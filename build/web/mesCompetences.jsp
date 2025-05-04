<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="entities.ProfilCompetence" %>
<%@ page import="entities.Client" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    Client client = (Client) session.getAttribute("client");
    if (client == null) {
        response.sendRedirect("Authentification.jsp");
        return;
    }

    dao.ProfilCompetenceDao pcDao = new dao.ProfilCompetenceDao();
    List<ProfilCompetence> competences = pcDao.getProfilCompetencesByClient(client.getId());
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Mes Compétences | SkillBoard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background-color: #f5f6fa;
            margin: 0;
        }

        .sidebar {
            width: 250px;
            height: 100vh;
            position: fixed;
            background-color: #1d3557;
            padding: 20px;
            color: white;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 30px;
        }

        .sidebar a {
            display: block;
            color: white;
            padding: 10px 15px;
            border-radius: 6px;
            margin-bottom: 10px;
            text-decoration: none;
        }

        .sidebar a:hover,
        .sidebar a.active {
            background-color: #457b9d;
        }

        .main {
            margin-left: 270px;
            padding: 40px;
        }

        h1 {
            font-size: 2rem;
            font-weight: 600;
            margin-bottom: 30px;
            color: #1d3557;
        }

        table {
            background: white;
            border-radius: 10px;
            width: 100%;
            box-shadow: 0 0 20px rgba(0,0,0,0.05);
            border-collapse: collapse;
        }

        th, td {
            padding: 16px 20px;
            text-align: left;
        }

        th {
            background-color: #1d3557;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .badge-date {
            background-color: #e0f7fa;
            color: #007B8A;
            padding: 6px 12px;
            border-radius: 12px;
            font-size: 0.85rem;
        }

        .no-data {
            background-color: white;
            text-align: center;
            padding: 50px;
            border-radius: 10px;
        }

        .no-data i {
            font-size: 3rem;
            color: #ccc;
        }

        .no-data p {
            margin-top: 15px;
            color: #777;
            font-size: 1.1rem;
        }
    </style>
</head>
<body>

<div class="sidebar">
    <h2>SkillBoard</h2>
    <a href="CompetenceController">Ajouter Compétence</a>
    <a href="mesCompetences.jsp" class="active">Mes Compétences</a>
    <a href="DeconnexionController">Déconnexion</a>
</div>

<div class="main">
    <h1>Mes Compétences</h1>

    <%
        if (competences != null && !competences.isEmpty()) {
    %>
    <table>
        <thead>
            <tr>
                <th>Nom</th>
                <th>Niveau</th>
                <th>Catégorie</th>
                <th>Date d'ajout</th>
            </tr>
        </thead>
        <tbody>
            <% for (ProfilCompetence pc : competences) { %>
                <tr>
                    <td><%= pc.getCompetence().getNom() %></td>
                    <td><%= pc.getCompetence().getNiveau() %></td>
                    <td><%= pc.getCompetence().getCategorie().getNom() %></td>
                    <td><span class="badge-date"><%= sdf.format(pc.getDateAjout()) %></span></td>
                </tr>
            <% } %>
        </tbody>
    </table>
    <% } else { %>
    <div class="no-data">
        <i class="fas fa-folder-open"></i>
        <p>Aucune compétence ajoutée pour le moment.</p>
    </div>
    <% } %>
</div>

</body>
</html>
