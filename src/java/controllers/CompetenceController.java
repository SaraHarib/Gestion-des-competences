/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import dao.CompetenceDao;
import entities.Competence;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sara
 */
@WebServlet(name = "CompetenceController", urlPatterns = {"/CompetenceController"})
public class CompetenceController extends HttpServlet {

    private CompetenceDao competenceDao;

    @Override
    public void init() throws ServletException {
        competenceDao = new CompetenceDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Competence> listeCompetences = competenceDao.getAllCompetences();

        request.setAttribute("listeCompetences", listeCompetences);

        request.getRequestDispatcher("/clients.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}