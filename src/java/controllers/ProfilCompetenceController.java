package controllers;

import com.google.gson.Gson;
import dao.CompetenceDao;
import dao.ProfilCompetenceDao;
import entities.Client;
import entities.Competence;
import entities.ProfilCompetence;
import entities.ProfilCompetencePK;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

@WebServlet(name = "ProfilCompetenceController", urlPatterns = {"/ProfilCompetenceController"})
public class ProfilCompetenceController extends HttpServlet {

    private final ProfilCompetenceDao profilCompetenceDao = new ProfilCompetenceDao();
    private final CompetenceDao competenceDao = new CompetenceDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Client client = (Client) session.getAttribute("client");

        if (client == null) {
            response.sendRedirect("Authentification.jsp");
            return;
        }

        List<ProfilCompetence> liste = profilCompetenceDao.getProfilCompetencesByClient(client.getId());

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        String json = new Gson().toJson(liste);
        response.getWriter().write(json);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Client client = (Client) session.getAttribute("client");

        if (client == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        String methodOverride = request.getParameter("_method");

        if ("DELETE".equalsIgnoreCase(methodOverride)) {
            doDelete(request, response);
            return;
        }

        // Traitement ajout de compétence
        try {
            int idCompetence = Integer.parseInt(request.getParameter("idCompetence"));

            boolean alreadyExists = profilCompetenceDao.exists(client.getId(), idCompetence);
            if (alreadyExists) {
                response.sendRedirect("CompetenceController?alreadyAdded=true");
                return;
            }

            Competence competence = competenceDao.findById(idCompetence);
            ProfilCompetencePK pk = new ProfilCompetencePK(client.getId(), idCompetence);
            ProfilCompetence pc = new ProfilCompetence(pk, new Date(), client, competence);

            profilCompetenceDao.create(pc);
            response.sendRedirect("ProfilClientController?success=true");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("CompetenceController?error=true");
        }
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        Client client = (Client) session.getAttribute("client");

        if (client == null) {
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED);
            return;
        }

        try {
            int idCompetence = Integer.parseInt(request.getParameter("idCompetence"));
            ProfilCompetencePK pk = new ProfilCompetencePK(client.getId(), idCompetence);
            ProfilCompetence pc = new ProfilCompetence();
            pc.setpK(pk);

            profilCompetenceDao.delete(pc);
            response.sendRedirect("ProfilClientController?deleted=true");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("ProfilClientController?error=true");
        }
    }
    
    public List<Object[]> countByCategorieForClient(int clientId) {
    Session session = null;
    Transaction tx = null;
    List<Object[]> results = null;

    try {
        session = HibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();

        String hql = "SELECT c.nom, COUNT(pc) " +
                     "FROM ProfilCompetence pc " +
                     "JOIN pc.competence cpt " +
                     "JOIN cpt.categorie c " +
                     "WHERE pc.client.id = :clientId " +
                     "GROUP BY c.nom";

        results = session.createQuery(hql).setParameter("clientId", clientId).list();
        tx.commit();
    } catch (Exception e) {
        if (tx != null) tx.rollback();
        e.printStackTrace();
    } finally {
        if (session != null) session.close();
    }

    return results;
}


}
