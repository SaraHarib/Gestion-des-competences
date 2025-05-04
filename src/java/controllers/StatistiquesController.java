package controllers;

import dao.ProfilCompetenceDao;
import entities.Client;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "StatistiquesController", urlPatterns = {"/StatistiquesController"})
public class StatistiquesController extends HttpServlet {

    private final ProfilCompetenceDao dao = new ProfilCompetenceDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);
        Client client = (session != null) ? (Client) session.getAttribute("client") : null;

        if (client == null) {
            response.sendRedirect("Authentification.jsp");
            return;
        }

        List<Object[]> stats = dao.countByCategorieForClient(client.getId());
        request.setAttribute("statistiquesCategorie", stats);

        request.getRequestDispatcher("statistiques.jsp").forward(request, response);
    }
}
