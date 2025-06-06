package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Authentification_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta charset=\"UTF-8\">\n");
      out.write("        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("        <title>Connexion - SkillBoard</title>\n");
      out.write("\n");
      out.write("        <!-- Bootstrap CSS -->\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css\" rel=\"stylesheet\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("        <style>\n");
      out.write("            body {\n");
      out.write("                background: url('images/ins.png') no-repeat center center fixed;\n");
      out.write("                background-size: cover;\n");
      out.write("                min-height: 100vh;\n");
      out.write("                margin: 0;\n");
      out.write("                font-family: 'Poppins', 'Segoe UI', sans-serif;\n");
      out.write("                display: flex;\n");
      out.write("                align-items: center;\n");
      out.write("                justify-content: center;\n");
      out.write("                color: #333;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .login-container {\n");
      out.write("                background-color: rgba(255, 255, 255, 0.95);\n");
      out.write("                border-radius: 24px;\n");
      out.write("                display: flex;\n");
      out.write("                width: 1000px;\n");
      out.write("                max-width: 95%;\n");
      out.write("                overflow: hidden;\n");
      out.write("                box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);\n");
      out.write("                transition: all 0.3s ease;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .login-container:hover {\n");
      out.write("                box-shadow: 0 25px 70px rgba(0, 0, 0, 0.2);\n");
      out.write("                transform: translateY(-5px);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .login-left {\n");
      out.write("                background: linear-gradient(135deg, #954a70, #b25c88, #d17ea6);\n");
      out.write("                color: white;\n");
      out.write("                flex: 1;\n");
      out.write("                padding: 50px 40px;\n");
      out.write("                display: flex;\n");
      out.write("                flex-direction: column;\n");
      out.write("                justify-content: center;\n");
      out.write("                text-align: center;\n");
      out.write("                position: relative;\n");
      out.write("                overflow: hidden;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .login-left::before {\n");
      out.write("                content: '';\n");
      out.write("                position: absolute;\n");
      out.write("                top: 0;\n");
      out.write("                left: 0;\n");
      out.write("                right: 0;\n");
      out.write("                bottom: 0;\n");
      out.write("                background: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiPjxkZWZzPjxwYXR0ZXJuIGlkPSJwYXR0ZXJuIiB3aWR0aD0iNDAiIGhlaWdodD0iNDAiIHZpZXdCb3g9IjAgMCA0MCA0MCIgcGF0dGVyblVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgcGF0dGVyblRyYW5zZm9ybT0icm90YXRlKDQ1KSI+PHJlY3QgaWQ9InBhdHRlcm4tYmFja2dyb3VuZCIgd2lkdGg9IjQwMCUiIGhlaWdodD0iNDAwJSIgZmlsbD0icmdiYSgyNTUsMjU1LDI1NSwwKSI+PC9yZWN0PiA8Y2lyY2xlIGZpbGw9InJnYmEoMjU1LDI1NSwyNTUsMC4wNSkiIGN4PSIyMCIgY3k9IjIwIiByPSIxIj48L2NpcmNsZT48L3BhdHRlcm4+PC9kZWZzPjxyZWN0IGZpbGw9InVybCgjcGF0dGVybikiIGhlaWdodD0iMTAwJSIgd2lkdGg9IjEwMCUiPjwvcmVjdD48L3N2Zz4=') repeat;\n");
      out.write("                opacity: 0.4;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .login-left h2 {\n");
      out.write("                font-weight: 700;\n");
      out.write("                margin-bottom: 16px;\n");
      out.write("                font-size: 2.2rem;\n");
      out.write("                position: relative;\n");
      out.write("                z-index: 1;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .login-left p {\n");
      out.write("                font-size: 1rem;\n");
      out.write("                line-height: 1.6;\n");
      out.write("                font-weight: 300;\n");
      out.write("                margin-bottom: 16px;\n");
      out.write("                position: relative;\n");
      out.write("                z-index: 1;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .logo-container {\n");
      out.write("                margin: 0 auto 30px;\n");
      out.write("                position: relative;\n");
      out.write("                z-index: 1;\n");
      out.write("                max-width: 280px;\n");
      out.write("                transition: all 0.3s ease;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .logo-container img {\n");
      out.write("                width: 100%;\n");
      out.write("                height: auto;\n");
      out.write("                filter: brightness(0) invert(1);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .login-right {\n");
      out.write("                flex: 1;\n");
      out.write("                padding: 50px 40px;\n");
      out.write("                display: flex;\n");
      out.write("                flex-direction: column;\n");
      out.write("                justify-content: center;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .login-right h4 {\n");
      out.write("                font-weight: 600;\n");
      out.write("                color: #954a70;\n");
      out.write("                margin-bottom: 30px;\n");
      out.write("                font-size: 1.8rem;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-label {\n");
      out.write("                font-weight: 500;\n");
      out.write("                font-size: 0.9rem;\n");
      out.write("                color: #555;\n");
      out.write("                margin-bottom: 8px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .input-group {\n");
      out.write("                margin-bottom: 5px;\n");
      out.write("                border-radius: 12px;\n");
      out.write("                overflow: hidden;\n");
      out.write("                box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);\n");
      out.write("                transition: all 0.3s ease;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .input-group:focus-within {\n");
      out.write("                box-shadow: 0 5px 15px rgba(149, 74, 112, 0.1);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .input-group-text {\n");
      out.write("                background-color: #f8f9fa;\n");
      out.write("                border: none;\n");
      out.write("                color: #b25c88;\n");
      out.write("                padding-left: 15px;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-control {\n");
      out.write("                border: none;\n");
      out.write("                padding: 12px 15px;\n");
      out.write("                font-size: 0.95rem;\n");
      out.write("                background-color: #f8f9fa;\n");
      out.write("                transition: all 0.3s ease;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-control:focus {\n");
      out.write("                background-color: #fff;\n");
      out.write("                border-color: #b25c88;\n");
      out.write("                box-shadow: none;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-check-input {\n");
      out.write("                border-color: #ccc;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-check-input:checked {\n");
      out.write("                background-color: #954a70;\n");
      out.write("                border-color: #954a70;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .form-check-label {\n");
      out.write("                color: #666;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .btn-primary {\n");
      out.write("                background: linear-gradient(to right, #954a70, #c06a94);\n");
      out.write("                border: none;\n");
      out.write("                padding: 12px;\n");
      out.write("                font-weight: 500;\n");
      out.write("                border-radius: 12px;\n");
      out.write("                box-shadow: 0 5px 15px rgba(149, 74, 112, 0.3);\n");
      out.write("                transition: all 0.3s ease;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .btn-primary:hover {\n");
      out.write("                background: linear-gradient(to right, #7d3d5e, #954a70);\n");
      out.write("                transform: translateY(-2px);\n");
      out.write("                box-shadow: 0 8px 20px rgba(149, 74, 112, 0.4);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .btn-primary:active {\n");
      out.write("                transform: translateY(0);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .btn-outline-secondary {\n");
      out.write("                border: 1px solid #e0e0e0;\n");
      out.write("                color: #555;\n");
      out.write("                padding: 12px;\n");
      out.write("                font-weight: 500;\n");
      out.write("                border-radius: 12px;\n");
      out.write("                transition: all 0.3s ease;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .btn-outline-secondary:hover {\n");
      out.write("                background-color: #f8f9fa;\n");
      out.write("                color: #954a70;\n");
      out.write("                border-color: #ccc;\n");
      out.write("                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .divider {\n");
      out.write("                display: flex;\n");
      out.write("                align-items: center;\n");
      out.write("                text-align: center;\n");
      out.write("                margin: 25px 0;\n");
      out.write("                color: #999;\n");
      out.write("                font-size: 0.9rem;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .divider::before,\n");
      out.write("            .divider::after {\n");
      out.write("                content: '';\n");
      out.write("                flex: 1;\n");
      out.write("                border-bottom: 1px solid #eee;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .divider:not(:empty)::before {\n");
      out.write("                margin-right: 1em;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .divider:not(:empty)::after {\n");
      out.write("                margin-left: 1em;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            a {\n");
      out.write("                color: #954a70;\n");
      out.write("                text-decoration: none;\n");
      out.write("                transition: all 0.2s ease;\n");
      out.write("                font-weight: 500;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            a:hover {\n");
      out.write("                color: #7d3d5e;\n");
      out.write("                text-decoration: none;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            .text-danger {\n");
      out.write("                background-color: #fff0f0;\n");
      out.write("                border-radius: 8px;\n");
      out.write("                padding: 10px;\n");
      out.write("                font-size: 0.9rem;\n");
      out.write("                border-left: 3px solid #dc3545;\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            @media (max-width: 768px) {\n");
      out.write("                .login-container {\n");
      out.write("                    flex-direction: column;\n");
      out.write("                    max-width: 90%;\n");
      out.write("                }\n");
      out.write("                \n");
      out.write("                .login-left, .login-right {\n");
      out.write("                    padding: 30px;\n");
      out.write("                }\n");
      out.write("                \n");
      out.write("                .login-left h2 {\n");
      out.write("                    font-size: 1.8rem;\n");
      out.write("                }\n");
      out.write("                \n");
      out.write("                .logo-container {\n");
      out.write("                    max-width: 220px;\n");
      out.write("                    margin-bottom: 20px;\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </style>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("\n");
      out.write("        <div class=\"login-container\">\n");
      out.write("            <div class=\"login-left\">\n");
      out.write("                <div class=\"logo-container\">\n");
      out.write("                    <img src=\"https://hebbkx1anhila5yf.public.blob.vercel-storage.com/logo-uS7Lbbc6k3uKCt5eid0QkyL6mnVlld.png\" alt=\"SkillBoard Logo\">\n");
      out.write("                </div>\n");
      out.write("                <p>Gérez vos compétences et explorez des domaines de formation adaptés.</p>\n");
      out.write("                <p>Connectez-vous pour ajouter vos compétences, suivre votre progression, et consulter des statistiques personnalisées.</p>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"login-right\">\n");
      out.write("                <h4 class=\"text-center\">Connexion</h4>\n");
      out.write("                <form action=\"/SkillBoard/AuthentificationController\" method=\"post\">\n");
      out.write("                    <div class=\"mb-4\">\n");
      out.write("                        <label for=\"email\" class=\"form-label\">Email</label>\n");
      out.write("                        <div class=\"input-group\">\n");
      out.write("                            <span class=\"input-group-text\"><i class=\"bi bi-envelope\"></i></span>\n");
      out.write("                            <input type=\"email\" class=\"form-control\" id=\"email\" name=\"email\" placeholder=\"Votre adresse email\" required>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"mb-4\">\n");
      out.write("                        <label for=\"password\" class=\"form-label\">Mot de passe</label>\n");
      out.write("                        <div class=\"input-group\">\n");
      out.write("                            <span class=\"input-group-text\"><i class=\"bi bi-lock\"></i></span>\n");
      out.write("                            <input type=\"password\" class=\"form-control\" id=\"password\" name=\"password\" placeholder=\"Votre mot de passe\" required>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"mb-4 form-check\">\n");
      out.write("                        <input type=\"checkbox\" class=\"form-check-input\" id=\"remember\">\n");
      out.write("                        <label class=\"form-check-label\" for=\"remember\">Se souvenir de moi</label>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"d-grid mb-4\">\n");
      out.write("                        <button type=\"submit\" class=\"btn btn-primary\">\n");
      out.write("                            <i class=\"bi bi-box-arrow-in-right me-2\"></i>Connexion\n");
      out.write("                        </button>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"divider\">ou</div>\n");
      out.write("\n");
      out.write("                    <div class=\"d-grid mb-4\">\n");
      out.write("                        <a href=\"forgotPassword.jsp\" class=\"btn btn-outline-secondary\">\n");
      out.write("                            <i class=\"bi bi-question-circle me-2\"></i>Mot de passe oublié ?\n");
      out.write("                        </a>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"text-center\">\n");
      out.write("                        <span style=\"color: #666;\">Vous n'avez pas de compte ?</span>\n");
      out.write("                        <a href=\"Inscription.jsp\" class=\"ms-2\">Créer un compte</a>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    ");
 if (request.getAttribute("msg") != null) { 
      out.write("\n");
      out.write("                    <div class=\"mt-4 text-danger text-center\">\n");
      out.write("                        <i class=\"bi bi-exclamation-triangle me-2\"></i>\n");
      out.write("                        ");
      out.print( request.getAttribute("msg") );
      out.write("\n");
      out.write("                    </div>\n");
      out.write("                    ");
 } 
      out.write("\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
