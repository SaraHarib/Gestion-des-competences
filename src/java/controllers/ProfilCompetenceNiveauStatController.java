/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import com.google.gson.Gson;
import dao.ProfilCompetenceDao;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Sara
 */
@WebServlet(name = "ProfilCompetenceNiveauStatController", urlPatterns = {"/ProfilCompetenceNiveauStatController"})
public class ProfilCompetenceNiveauStatController extends HttpServlet {

    private final ProfilCompetenceDao dao = new ProfilCompetenceDao();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Object[]> resultats = dao.countProfilCompetenceByNiveau();
            List<Map<String, Object>> stats = new ArrayList<>();

            for (Object[] ligne : resultats) {
                Map<String, Object> stat = new HashMap<>();
                stat.put("niveau", ligne[0]);
                stat.put("count", ligne[1]);
                stats.add(stat);
            }

            String json = new Gson().toJson(stats);

            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(json);
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"" + e.getMessage() + "\"}");
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