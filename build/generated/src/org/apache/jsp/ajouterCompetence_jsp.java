package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import entities.Competence;
import entities.Categorie;

public final class ajouterCompetence_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <meta charset=\"UTF-8\">\n");
      out.write("    <title>Ajouter une compétence</title>\n");
      out.write("    <style>\n");
      out.write("        body {\n");
      out.write("            font-family: Arial, sans-serif;\n");
      out.write("            margin: 40px;\n");
      out.write("        }\n");
      out.write("        form {\n");
      out.write("            margin-bottom: 30px;\n");
      out.write("            padding: 20px;\n");
      out.write("            border: 1px solid #ccc;\n");
      out.write("            width: 400px;\n");
      out.write("        }\n");
      out.write("        input, select {\n");
      out.write("            width: 100%;\n");
      out.write("            padding: 8px;\n");
      out.write("            margin-top: 8px;\n");
      out.write("            margin-bottom: 16px;\n");
      out.write("        }\n");
      out.write("        table {\n");
      out.write("            width: 80%;\n");
      out.write("            border-collapse: collapse;\n");
      out.write("            margin-top: 20px;\n");
      out.write("        }\n");
      out.write("        th, td {\n");
      out.write("            border: 1px solid #aaa;\n");
      out.write("            padding: 10px;\n");
      out.write("            text-align: left;\n");
      out.write("        }\n");
      out.write("        th {\n");
      out.write("            background-color: #eee;\n");
      out.write("        }\n");
      out.write("    </style>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("    <h2>Ajouter une nouvelle compétence</h2>\n");
      out.write("    <form action=\"competences\" method=\"post\">\n");
      out.write("        <label>Nom de la compétence :</label>\n");
      out.write("        <input type=\"text\" name=\"nom\" required />\n");
      out.write("\n");
      out.write("        <label>Niveau :</label>\n");
      out.write("        <input type=\"text\" name=\"niveau\" required />\n");
      out.write("\n");
      out.write("        <label>Catégorie :</label>\n");
      out.write("        <select name=\"categorieId\" required>\n");
      out.write("            <option value=\"\">-- Sélectionner une catégorie --</option>\n");
      out.write("            ");

                List<Categorie> categories = (List<Categorie>) request.getAttribute("listeCategories");
                if (categories != null) {
                    for (Categorie cat : categories) {
            
      out.write("\n");
      out.write("                        <option value=\"");
      out.print( cat.getId() );
      out.write('"');
      out.write('>');
      out.print( cat.getNom() );
      out.write("</option>\n");
      out.write("            ");

                    }
                }
            
      out.write("\n");
      out.write("        </select>\n");
      out.write("\n");
      out.write("        <input type=\"submit\" value=\"Ajouter\" />\n");
      out.write("    </form>\n");
      out.write("\n");
      out.write("    <h2>Liste des compétences existantes</h2>\n");
      out.write("    <table>\n");
      out.write("        <tr>\n");
      out.write("            <th>ID</th>\n");
      out.write("            <th>Nom</th>\n");
      out.write("            <th>Niveau</th>\n");
      out.write("            <th>Catégorie</th>\n");
      out.write("        </tr>\n");
      out.write("        ");

            List<Competence> competences = (List<Competence>) request.getAttribute("listeCompetences");
            if (competences != null) {
                for (Competence comp : competences) {
        
      out.write("\n");
      out.write("        <tr>\n");
      out.write("            <td>");
      out.print( comp.getId() );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( comp.getNom() );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( comp.getNiveau() );
      out.write("</td>\n");
      out.write("            <td>");
      out.print( comp.getCategorie().getNom() );
      out.write("</td>\n");
      out.write("        </tr>\n");
      out.write("        ");

                }
            }
        
      out.write("\n");
      out.write("    </table>\n");
      out.write("\n");
      out.write("</body>\n");
      out.write("</html>\n");
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
