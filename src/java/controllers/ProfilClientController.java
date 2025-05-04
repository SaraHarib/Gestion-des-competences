package controllers;

import dao.ProfilCompetenceDao;
import entities.Client;
import entities.ProfilCompetence;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Comparator;
import java.util.List;

@WebServlet(name = "ProfilClientController", urlPatterns = {"/ProfilClientController"})
public class ProfilClientController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Client client = (session != null) ? (Client) session.getAttribute("client") : null;

        if (client == null) {
            request.setAttribute("msg", "Votre session a expiré. Veuillez vous reconnecter.");
            request.getRequestDispatcher("Authentification.jsp").forward(request, response);
            return;
        }

        try {
            ProfilCompetenceDao dao = new ProfilCompetenceDao();
            List<ProfilCompetence> competences = dao.getProfilCompetencesByClient(client.getId());

            // ✅ Tri optionnel : compétences les plus récentes en premier
            if (competences != null) {
                competences.sort(Comparator.comparing(ProfilCompetence::getDateAjout).reversed());
            }

            System.out.println("🔍 Compétences trouvées pour client " + client.getId() + " : " +
                    (competences != null ? competences.size() : "null"));

            request.setAttribute("profilCompetences", competences);
            request.setAttribute("nbCompetences", (competences != null) ? competences.size() : 0);

            // ✅ Gestion des messages (feedback)
            if (request.getParameter("success") != null)
                request.setAttribute("success", true);
            if (request.getParameter("alreadyAdded") != null)
                request.setAttribute("alreadyAdded", true);
            if (request.getParameter("error") != null)
                request.setAttribute("error", true);
            if (request.getParameter("deleted") != null)
                request.setAttribute("deleted", true);

            request.getRequestDispatcher("profil.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("msg", "Erreur lors du chargement des compétences.");
            request.getRequestDispatcher("profil.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
