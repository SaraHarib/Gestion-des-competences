<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    if (session.getAttribute("client") == null) {
        response.sendRedirect("Authentification.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mon Profil | SkillBoard</title>
    
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <style>
        :root {
            --primary: #954a70;
            --primary-dark: #7d3d5e;
            --primary-light: #c06a94;
            --secondary: #d17ea6;
            --light: #f8f9fa;
            --dark: #333;
            --text: #4a4a4a;
            --card-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            --transition: all 0.3s ease;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f5f5f7;
            margin: 0;
            padding: 0;
            color: var(--text);
            overflow-x: hidden;
        }

        /* Sidebar Styles */
        .sidebar {
            width: 280px;
            background: linear-gradient(135deg, var(--primary), var(--primary-light));
            color: white;
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            padding: 30px 0;
            box-shadow: 5px 0 15px rgba(0, 0, 0, 0.1);
            z-index: 1000;
            transition: var(--transition);
        }

        .sidebar-header {
            padding: 0 25px 30px;
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            margin-bottom: 20px;
        }

        .logo-container {
            max-width: 180px;
            margin: 0 auto 20px;
        }

        .logo-container img {
            width: 100%;
            height: auto;
            filter: brightness(0) invert(1);
        }

        .user-info {
            display: flex;
            align-items: center;
            padding: 0 25px;
            margin-bottom: 30px;
        }

        .user-avatar {
            width: 45px;
            height: 45px;
            border-radius: 50%;
            background-color: rgba(255, 255, 255, 0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 15px;
            font-size: 1.2rem;
        }

        .user-details {
            flex: 1;
        }

        .user-name {
            font-weight: 600;
            font-size: 0.95rem;
            margin-bottom: 3px;
        }

        .user-role {
            font-size: 0.8rem;
            opacity: 0.8;
        }

        .nav-menu {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .nav-item {
            margin-bottom: 5px;
        }

        .nav-link {
            display: flex;
            align-items: center;
            padding: 12px 25px;
            color: white;
            text-decoration: none;
            transition: var(--transition);
            position: relative;
        }

        .nav-link:hover, .nav-link.active {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .nav-link.active::before {
            content: '';
            position: absolute;
            left: 0;
            top: 0;
            height: 100%;
            width: 4px;
            background-color: white;
        }

        .nav-link i {
            margin-right: 15px;
            font-size: 1.2rem;
        }

        .sidebar-footer {
            position: absolute;
            bottom: 0;
            width: 100%;
            padding: 20px 25px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
        }

        .logout-btn {
            display: flex;
            align-items: center;
            color: white;
            text-decoration: none;
            transition: var(--transition);
            font-size: 0.9rem;
        }

        .logout-btn:hover {
            opacity: 0.8;
            color: white;
        }

        .logout-btn i {
            margin-right: 10px;
        }

        /* Main Content Styles */
        .main-content {
            margin-left: 280px;
            padding: 40px;
            transition: var(--transition);
        }

        /* Alert Styles */
        #alertContainer {
            margin-bottom: 25px;
        }

        .alert {
            border: none;
            border-radius: 12px;
            padding: 16px 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            position: relative;
            border-left: 4px solid;
            animation: slideInDown 0.5s ease forwards;
        }

        .alert-success {
            background-color: rgba(40, 167, 69, 0.1);
            border-left-color: #28a745;
            color: #1e7e34;
        }

        .alert-warning {
            background-color: rgba(255, 193, 7, 0.1);
            border-left-color: #ffc107;
            color: #d39e00;
        }

        .alert-danger {
            background-color: rgba(220, 53, 69, 0.1);
            border-left-color: #dc3545;
            color: #bd2130;
        }

        .alert-info {
            background-color: rgba(23, 162, 184, 0.1);
            border-left-color: #17a2b8;
            color: #117a8b;
        }

        .alert-light {
            background-color: rgba(248, 249, 250, 0.7);
            border-left-color: var(--primary);
            color: var(--text);
        }

        .alert-dismissible .btn-close {
            padding: 16px 20px;
            opacity: 0.5;
            transition: var(--transition);
        }

        .alert-dismissible .btn-close:hover {
            opacity: 1;
        }

        @keyframes slideInDown {
            from {
                transform: translateY(-20px);
                opacity: 0;
            }
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .page-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }

        .page-title {
            font-size: 1.8rem;
            font-weight: 600;
            color: var(--primary);
            position: relative;
            display: inline-block;
            margin-bottom: 30px;
        }

        .page-title::after {
            content: '';
            position: absolute;
            bottom: -8px;
            left: 0;
            width: 50px;
            height: 3px;
            background: linear-gradient(to right, var(--primary), var(--secondary));
        }

        /* Stats Card */
        .stats-card {
            background-color: white;
            border-radius: 15px;
            box-shadow: var(--card-shadow);
            padding: 20px;
            margin-bottom: 30px;
            display: flex;
            align-items: center;
            transition: var(--transition);
        }

        .stats-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }

        .stats-icon {
            width: 60px;
            height: 60px;
            border-radius: 12px;
            background: linear-gradient(135deg, var(--primary), var(--primary-light));
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 20px;
            color: white;
            font-size: 1.5rem;
        }

        .stats-info {
            flex: 1;
        }

        .stats-value {
            font-size: 1.8rem;
            font-weight: 600;
            color: var(--primary);
            margin-bottom: 5px;
        }

        .stats-label {
            color: var(--text);
            font-size: 0.9rem;
        }

        /* Filter Styles */
        .filter-container {
            background-color: white;
            border-radius: 15px;
            box-shadow: var(--card-shadow);
            padding: 25px;
            margin-bottom: 30px;
        }

        .filter-title {
            font-size: 1.1rem;
            font-weight: 600;
            color: var(--primary);
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }

        .filter-title i {
            margin-right: 10px;
        }

        .filter-input {
            position: relative;
        }

        .filter-input i {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #aaa;
        }

        .filter-input input {
            padding-left: 40px;
            border-radius: 50px;
            border: 1px solid #e0e0e0;
            transition: var(--transition);
        }

        .filter-input input:focus {
            box-shadow: 0 0 15px rgba(149, 74, 112, 0.1);
            border-color: var(--primary-light);
            outline: none;
        }

        /* Table Styles */
        .skills-table {
            background-color: white;
            border-radius: 15px;
            box-shadow: var(--card-shadow);
            overflow: hidden;
            margin-bottom: 30px;
        }

        .skills-table table {
            margin-bottom: 0;
        }

        .skills-table th {
            background: linear-gradient(135deg, var(--primary), var(--primary-light));
            color: white;
            font-weight: 500;
            border: none;
            padding: 15px 20px;
        }

        .skills-table td {
            padding: 15px 20px;
            vertical-align: middle;
            border-color: #f0f0f0;
        }

        .skills-table tbody tr {
            transition: var(--transition);
        }

        .skills-table tbody tr:hover {
            background-color: rgba(149, 74, 112, 0.03);
        }

        .category-badge {
            display: inline-block;
            padding: 5px 12px;
            background-color: rgba(149, 74, 112, 0.1);
            color: var(--primary);
            border-radius: 50px;
            font-size: 0.8rem;
        }

        .level-badge {
            display: inline-block;
            padding: 5px 12px;
            background-color: rgba(23, 162, 184, 0.1);
            color: #117a8b;
            border-radius: 50px;
            font-size: 0.8rem;
        }

        .btn-delete {
            background-color: rgba(220, 53, 69, 0.1);
            color: #dc3545;
            border: none;
            border-radius: 8px;
            padding: 8px 12px;
            transition: var(--transition);
        }

        .btn-delete:hover {
            background-color: #dc3545;
            color: white;
        }

        .empty-state {
            text-align: center;
            padding: 50px 20px;
            background-color: white;
            border-radius: 15px;
            box-shadow: var(--card-shadow);
        }

        .empty-icon {
            font-size: 3rem;
            color: #ccc;
            margin-bottom: 20px;
        }

        .empty-text {
            font-size: 1.1rem;
            color: #888;
            margin-bottom: 20px;
        }

        .btn-add-skill {
            background: linear-gradient(to right, var(--primary), var(--primary-light));
            color: white;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            font-weight: 500;
            transition: var(--transition);
        }

        .btn-add-skill:hover {
            background: linear-gradient(to right, var(--primary-dark), var(--primary));
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(149, 74, 112, 0.3);
            color: white;
        }

        /* Responsive Styles */
        .menu-toggle {
            display: none;
            position: fixed;
            top: 20px;
            right: 20px;
            background-color: var(--primary);
            color: white;
            border: none;
            border-radius: 50%;
            width: 45px;
            height: 45px;
            font-size: 1.2rem;
            z-index: 1001;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
        }

        @media (max-width: 992px) {
            .sidebar {
                transform: translateX(-100%);
            }
            
            .sidebar.active {
                transform: translateX(0);
            }
            
            .main-content {
                margin-left: 0;
                padding: 30px 20px 80px;
            }
            
            .menu-toggle {
                display: flex;
                align-items: center;
                justify-content: center;
            }
            
            .skills-table {
                overflow-x: auto;
            }
            
            .page-header {
                flex-direction: column;
                align-items: flex-start;
            }
        }

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .stats-card, .filter-container, .skills-table, .empty-state {
            animation: fadeIn 0.5s ease forwards;
        }

        .stats-card { animation-delay: 0.1s; }
        .filter-container { animation-delay: 0.2s; }
        .skills-table { animation-delay: 0.3s; }
    </style>
</head>
<body>

    <!-- Mobile Menu Toggle -->
    <button class="menu-toggle" id="menuToggle">
        <i class="bi bi-list"></i>
    </button>

    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <div class="logo-container">
                <img src="https://hebbkx1anhila5yf.public.blob.vercel-storage.com/logo-uS7Lbbc6k3uKCt5eid0QkyL6mnVlld.png" alt="SkillBoard Logo">
            </div>
        </div>
        
        <div class="user-info">
            <div class="user-avatar">
                <i class="bi bi-person"></i>
            </div>
            <div class="user-details">
                <div class="user-name">${sessionScope.client.prenom} ${sessionScope.client.nom}</div>
                <div class="user-role">Utilisateur</div>
            </div>
        </div>
        
        <ul class="nav-menu">
            <li class="nav-item">
                <a href="CompetenceController" class="nav-link">
                    <i class="bi bi-trophy"></i>
                    <span>Compétences</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="ProfilClientController" class="nav-link active">
                    <i class="bi bi-person-badge"></i>
                    <span>Mon Profil</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="StatistiquesController" class="nav-link">
                    <i class="bi bi-graph-up"></i>
                    <span>Statistiques</span>
                </a>
            </li>
        </ul>
        
        <div class="sidebar-footer">
            <a href="DeconnexionController" class="logout-btn">
                <i class="bi bi-box-arrow-right"></i>
                <span>Déconnexion</span>
            </a>
        </div>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Alert Container -->
        <div id="alertContainer">
            <c:if test="${success}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="bi bi-check-circle-fill me-2"></i> Compétence ajoutée avec succès.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Fermer"></button>
                </div>
            </c:if>
            <c:if test="${alreadyAdded}">
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i> Cette compétence est déjà dans votre profil.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Fermer"></button>
                </div>
            </c:if>
            <c:if test="${error}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="bi bi-x-circle-fill me-2"></i> Une erreur s'est produite.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Fermer"></button>
                </div>
            </c:if>
            <c:if test="${param.deleted == 'true'}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="bi bi-check-circle-fill me-2"></i> Compétence supprimée avec succès.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Fermer"></button>
                </div>
            </c:if>
        </div>

        <h1 class="page-title">Mon Profil</h1>

        <!-- Stats Card -->
        <div class="stats-card">
            <div class="stats-icon">
                <i class="bi bi-award"></i>
            </div>
            <div class="stats-info">
                <div class="stats-value">${nbCompetences}</div>
                <div class="stats-label">Compétences dans votre profil</div>
            </div>
        </div>

        <!-- Filter Section -->
        <div class="filter-container">
            <div class="filter-title">
                <i class="bi bi-funnel"></i> Filtrer mes compétences
            </div>
            <div class="filter-input">
                <i class="bi bi-search"></i>
                <input type="text" id="filtreCategorie" class="form-control" placeholder="Filtrer par catégorie...">
            </div>
        </div>

        <!-- Skills Table -->
        <c:choose>
            <c:when test="${profilCompetences != null and fn:length(profilCompetences) > 0}">
                <div class="skills-table">
                    <table class="table table-hover">
                        <thead>
                            <tr>
                                <th>Compétence</th>
                                <th>Catégorie</th>
                                <th>Niveau</th>
                                <th>Date d'ajout</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="pc" items="${profilCompetences}">
                                <tr data-categorie="${pc.competence.categorie.nom}">
                                    <td><strong>${pc.competence.nom}</strong></td>
                                    <td><span class="category-badge">${pc.competence.categorie.nom}</span></td>
                                    <td><span class="level-badge">${pc.competence.niveau}</span></td>
                                    <td><fmt:formatDate value="${pc.dateAjout}" pattern="dd/MM/yyyy" /></td>
                                    <td>
                                        <form action="ProfilCompetenceController" method="post"
                                            onsubmit="return confirm('Êtes-vous sûr de vouloir supprimer cette compétence de votre profil ?');">
                                            <input type="hidden" name="_method" value="DELETE" />
                                            <input type="hidden" name="idCompetence" value="${pc.competence.id}" />
                                            <button type="submit" class="btn btn-delete">
                                                <i class="bi bi-trash"></i> Supprimer
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:when>
            <c:otherwise>
                <div class="empty-state">
                    <div class="empty-icon">
                        <i class="bi bi-clipboard-x"></i>
                    </div>
                    <div class="empty-text">Vous n'avez pas encore ajouté de compétences à votre profil.</div>
                    <a href="CompetenceController" class="btn btn-add-skill">
                        <i class="bi bi-plus-circle me-2"></i> Ajouter des compétences
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Fermer automatiquement les alertes après 5 secondes
            setTimeout(function() {
                const alerts = document.querySelectorAll('.alert');
                alerts.forEach(alert => {
                    const bsAlert = new bootstrap.Alert(alert);
                    bsAlert.close();
                });
            }, 5000);
            
            // Mobile menu toggle
            const menuToggle = document.getElementById('menuToggle');
            const sidebar = document.getElementById('sidebar');
            
            if (menuToggle) {
                menuToggle.addEventListener('click', function() {
                    sidebar.classList.toggle('active');
                    
                    // Change icon based on sidebar state
                    const icon = this.querySelector('i');
                    icon.classList.toggle('bi-list');
                    icon.classList.toggle('bi-x');
                });
            }
            
            // Filtrage par catégorie
            const filtreInput = document.getElementById("filtreCategorie");
            const lignes = document.querySelectorAll("tbody tr");
            
            if (filtreInput) {
                filtreInput.addEventListener("input", function() {
                    const valeur = this.value.toLowerCase();
                    
                    lignes.forEach(row => {
                        const categorie = row.getAttribute("data-categorie").toLowerCase();
                        
                        if (categorie.includes(valeur)) {
                            row.style.display = "";
                            row.style.animation = "fadeIn 0.3s ease forwards";
                        } else {
                            row.style.display = "none";
                        }
                    });
                });
            }
        });
    </script>
</body>
</html>