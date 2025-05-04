package controllers;

import entities.Client;
import services.ClientService;
import services.SendMail;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet(name = "Mdob", urlPatterns = {"/Mdob"})
public class Mdob extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        ClientService cl = new ClientService();
        Client c = cl.findClientByEmail(email);
        
        if (c != null) {
            String code = String.format("%06d", (int) (Math.random() * 1000000));
            HttpSession session = request.getSession();
            session.setAttribute("client", c);
            session.setAttribute("code_verification", code);
            
            SendMail sed = new SendMail();
            boolean mailSent = sed.send(code, email);
            
            if (mailSent) {
                // Succes - afficher la page de vérification
                request.getRequestDispatcher("verification.jsp").forward(request, response);
            } else {
                // Échec d'envoi d'email - afficher message d'erreur
                request.setAttribute("msg", "Échec d'envoi du code de vérification. Veuillez réessayer plus tard.");
                request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("msg", "Email n'existe pas");
            request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
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

    @Override
    public String getServletInfo() {
        return "Servlet pour gérer la demande de réinitialisation de mot de passe";
    }
}