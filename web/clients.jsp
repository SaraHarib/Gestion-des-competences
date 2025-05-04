<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

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
    <title>Compétences disponibles | SkillBoard</title>
    
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

        .search-box {
            position: relative;
            max-width: 300px;
        }

        .search-input {
            width: 100%;
            padding: 10px 15px 10px 40px;
            border-radius: 50px;
            border: 1px solid #e0e0e0;
            background-color: white;
            transition: var(--transition);
        }

        .search-input:focus {
            box-shadow: 0 0 15px rgba(149, 74, 112, 0.1);
            border-color: var(--primary-light);
            outline: none;
        }

        .search-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #aaa;
        }

        /* Card Styles */
        .skill-card {
            background-color: white;
            border-radius: 15px;
            box-shadow: var(--card-shadow);
            padding: 25px;
            transition: var(--transition);
            height: 100%;
            border: none;
            position: relative;
            overflow: hidden;
        }

        .skill-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }

        .skill-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 5px;
            height: 100%;
            background: linear-gradient(to bottom, var(--primary), var(--secondary));
        }

        .skill-card h5 {
            font-weight: 600;
            color: var(--primary);
            margin-bottom: 15px;
            font-size: 1.2rem;
        }

        .skill-info {
            margin-bottom: 20px;
        }

        .skill-label {
            font-weight: 500;
            color: var(--dark);
            margin-right: 5px;
        }

        .skill-value {
            color: var(--text);
        }

        .skill-category {
            display: inline-block;
            padding: 5px 12px;
            background-color: rgba(149, 74, 112, 0.1);
            color: var(--primary);
            border-radius: 50px;
            font-size: 0.8rem;
            margin-bottom: 15px;
        }

        .btn-add {
            background: linear-gradient(to right, var(--primary), var(--primary-light));
            color: white;
            border: none;
            border-radius: 8px;
            padding: 10px 15px;
            font-weight: 500;
            transition: var(--transition);
            width: 100%;
        }

        .btn-add:hover {
            background: linear-gradient(to right, var(--primary-dark), var(--primary));
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(149, 74, 112, 0.3);
            color: white;
        }

        .btn-add i {
            margin-right: 8px;
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
            
            .page-header {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .search-box {
                margin-top: 20px;
                max-width: 100%;
                width: 100%;
            }
        }

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .skill-card {
            animation: fadeIn 0.5s ease forwards;
        }

        .row > div:nth-child(1) .skill-card { animation-delay: 0.1s; }
        .row > div:nth-child(2) .skill-card { animation-delay: 0.2s; }
        .row > div:nth-child(3) .skill-card { animation-delay: 0.3s; }
        .row > div:nth-child(4) .skill-card { animation-delay: 0.4s; }
        .row > div:nth-child(5) .skill-card { animation-delay: 0.5s; }
        .row > div:nth-child(6) .skill-card { animation-delay: 0.6s; }
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
                <a href="CompetenceController" class="nav-link active">
                    <i class="bi bi-trophy"></i>
                    <span>Compétences</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="ProfilClientController" class="nav-link">
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
            <c:if test="${param.success == 'true'}">
                <div class="alert alert-success alert-dismissible fade show" role="alert">
                    <i class="bi bi-check-circle-fill me-2"></i> Compétence ajoutée avec succès à votre profil.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Fermer"></button>
                </div>
            </c:if>
            <c:if test="${param.alreadyAdded == 'true'}">
                <div class="alert alert-warning alert-dismissible fade show" role="alert">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i> Cette compétence est déjà présente dans votre profil.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Fermer"></button>
                </div>
            </c:if>
            <c:if test="${param.error == 'true'}">
                <div class="alert alert-danger alert-dismissible fade show" role="alert">
                    <i class="bi bi-x-circle-fill me-2"></i> Une erreur est survenue lors de l'ajout de la compétence.
                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Fermer"></button>
                </div>
            </c:if>
        </div>

        <div class="page-header">
            <h1 class="page-title">Compétences Disponibles</h1>
            
            <div class="search-box">
                <i class="bi bi-search search-icon"></i>
                <input type="text" class="search-input" placeholder="Rechercher une compétence..." id="searchSkill">
            </div>
        </div>

        <div class="row" id="skillsContainer">
            <c:forEach var="competence" items="${listeCompetences}">
                <div class="col-lg-4 col-md-6 mb-4 skill-item">
                    <div class="skill-card">
                        <h5>${competence.nom}</h5>
                        <div class="skill-category">
                            <i class="bi bi-tag"></i> ${competence.categorie.nom}
                        </div>
                        <div class="skill-info">
                            <span class="skill-label">Niveau:</span>
                            <span class="skill-value">${competence.niveau}</span>
                        </div>
                        <form action="ProfilCompetenceController" method="post">
                            <input type="hidden" name="idCompetence" value="${competence.id}">
                            <button type="submit" class="btn btn-add">
                                <i class="bi bi-plus-circle"></i> Ajouter à mes compétences
                            </button>
                        </form>
                    </div>
                </div>
            </c:forEach>
        </div>
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
            
            // Search functionality
            const searchInput = document.getElementById('searchSkill');
            const skillItems = document.querySelectorAll('.skill-item');
            
            searchInput.addEventListener('input', function() {
                const searchTerm = this.value.toLowerCase();
                
                skillItems.forEach(item => {
                    const skillName = item.querySelector('h5').textContent.toLowerCase();
                    const skillCategory = item.querySelector('.skill-category').textContent.toLowerCase();
                    
                    if (skillName.includes(searchTerm) || skillCategory.includes(searchTerm)) {
                        item.style.display = 'block';
                    } else {
                        item.style.display = 'none';
                    }
                });
            });
        });
    </script>
</body>
</html>