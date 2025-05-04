/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.google.gson.Gson;
import dao.CompetenceDao;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mapper.CategorieCompetenceCount;

/**
 *
 * @author Sara
 */
@WebServlet(name = "CompetenceCategorieStatController", urlPatterns = {"/CompetenceCategorieStatController"})
public class CompetenceCategorieStatController extends HttpServlet {

    private final CompetenceDao dao = new CompetenceDao();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Object[]> resultats = dao.countByCategorie();
        List<CategorieCompetenceCount> stats = new ArrayList<>();

        for (Object[] ligne : resultats) {
            String categorieNom = (String) ligne[0];
            Long count = (Long) ligne[1];
            stats.add(new CategorieCompetenceCount(categorieNom, count));
        }

        String json = new Gson().toJson(stats);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);
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