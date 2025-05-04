<%@page import="entities.User"%>
<%@page import="services.UserService"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>

<%
    User user = (User) session.getAttribute("admin");
    if (user == null) {
        response.sendRedirect("Authentification.jsp");
        return;
    }
%>

<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
    response.setHeader("Pragma", "no-cache");
    response.setDateHeader("Expires", 0);

    UserService us = new UserService();
    java.util.List<User> allUsers = us.findAll();
    java.util.List<User> users = new java.util.ArrayList<User>();

    for (User u : allUsers) {
        if (u instanceof entities.Client) {
            users.add(u); 
        }
    }
    int totalClients = users.size();
%>

<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Liste des Clients | Luxury Drive</title>
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
        <style>
            :root {
                --primary: #2c3e50;
                --primary-dark: #1a2b3c;
                --primary-light: #3d5166;
                --secondary: #e74c3c;
                --secondary-light: #f1654a;
                --accent: #3498db;
                --light: #ecf0f1;
                --dark: #2c3e50;
                --text: #34495e;
                --success: #27ae60;
                --warning: #f39c12;
                --card-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
                --transition: all 0.3s ease;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background-color: #f5f7fa;
                color: var(--text);
                margin: 0;
                padding: 0;
                min-height: 100vh;
            }

            /* Sidebar Styling */
            .sidebar {
                width: 280px;
                background: linear-gradient(135deg, var(--primary) 0%, var(--primary-dark) 100%);
                color: white;
                position: fixed;
                top: 0;
                left: 0;
                height: 100%;
                box-shadow: 5px 0 15px rgba(0,0,0,0.1);
                z-index: 100;
                transition: var(--transition);
                overflow-y: auto;
            }

            .sidebar-header {
                padding: 25px 20px;
                border-bottom: 1px solid rgba(255, 255, 255, 0.1);
                margin-bottom: 20px;
            }

            .logo-container {
                display: flex;
                align-items: center;
                justify-content: center;
                margin-bottom: 15px;
            }

            .sidebar-logo {
                max-width: 160px;
                height: auto;
            }

            .admin-info {
                display: flex;
                align-items: center;
                padding: 0 20px;
                margin-bottom: 30px;
            }

            .admin-avatar {
                width: 50px;
                height: 50px;
                border-radius: 50%;
                background-color: rgba(255, 255, 255, 0.2);
                display: flex;
                align-items: center;
                justify-content: center;
                margin-right: 15px;
                font-size: 1.5rem;
            }

            .admin-details {
                flex: 1;
            }

            .admin-name {
                font-weight: 600;
                font-size: 1rem;
                margin-bottom: 3px;
            }

            .admin-role {
                font-size: 0.8rem;
                opacity: 0.8;
            }

            .nav-section {
                margin-bottom: 15px;
            }

            .nav-section-title {
                font-size: 0.75rem;
                text-transform: uppercase;
                letter-spacing: 1px;
                color: rgba(255, 255, 255, 0.5);
                padding: 0 25px;
                margin-bottom: 10px;
            }

            .nav-links {
                display: flex;
                flex-direction: column;
                gap: 5px;
                padding: 0 15px;
            }

            .sidebar-link {
                display: flex;
                align-items: center;
                padding: 12px 15px;
                color: white;
                border-radius: 8px;
                text-decoration: none;
                font-weight: 500;
                transition: var(--transition);
                font-size: 0.95rem;
                position: relative;
            }

            .sidebar-link i {
                margin-right: 12px;
                font-size: 1.1rem;
                width: 20px;
                text-align: center;
            }

            .sidebar-link:hover {
                background-color: rgba(255, 255, 255, 0.1);
            }

            .sidebar-link.active {
                background-color: rgba(255, 255, 255, 0.15);
            }

            .sidebar-link.active::before {
                content: '';
                position: absolute;
                left: 0;
                top: 0;
                height: 100%;
                width: 4px;
                background-color: var(--secondary);
                border-radius: 0 2px 2px 0;
            }

            .sidebar-footer {
                position: absolute;
                bottom: 0;
                width: 100%;
                padding: 20px;
                border-top: 1px solid rgba(255, 255, 255, 0.1);
            }

            .logout-btn {
                display: flex;
                align-items: center;
                color: white;
                text-decoration: none;
                transition: var(--transition);
                font-size: 0.9rem;
                opacity: 0.8;
            }

            .logout-btn:hover {
                opacity: 1;
            }

            .logout-btn i {
                margin-right: 10px;
            }

            /* Main Content */
            .main-content {
                margin-left: 280px;
                padding: 40px;
                transition: var(--transition);
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
                background: linear-gradient(to right, var(--secondary), var(--secondary-light));
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
                box-shadow: 0 0 15px rgba(52, 152, 219, 0.1);
                border-color: var(--accent);
                outline: none;
            }

            .search-icon {
                position: absolute;
                left: 15px;
                top: 50%;
                transform: translateY(-50%);
                color: #aaa;
            }

            /* Stats Cards */
            .stats-container {
                display: grid;
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
                gap: 20px;
                margin-bottom: 30px;
            }

            .stat-card {
                background-color: white;
                border-radius: 12px;
                box-shadow: var(--card-shadow);
                padding: 20px;
                transition: var(--transition);
                position: relative;
                overflow: hidden;
            }

            .stat-card:hover {
                transform: translateY(-5px);
                box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            }

            .stat-card::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                width: 4px;
                height: 100%;
                background: linear-gradient(to bottom, var(--secondary), var(--secondary-light));
            }

            .stat-icon {
                position: absolute;
                top: 20px;
                right: 20px;
                font-size: 2.5rem;
                opacity: 0.1;
                color: var(--primary);
            }

            .stat-value {
                font-size: 2rem;
                font-weight: 700;
                color: var(--primary);
                margin-bottom: 5px;
            }

            .stat-label {
                font-size: 0.9rem;
                color: var(--text);
                opacity: 0.7;
            }

            /* Table Styling */
            .table-container {
                background: white;
                border-radius: 12px;
                box-shadow: var(--card-shadow);
                overflow: hidden;
                margin-bottom: 30px;
                transition: var(--transition);
            }

            .table-container:hover {
                box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            }

            .table-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 20px 25px;
                border-bottom: 1px solid #eee;
            }

            .table-title {
                font-size: 1.2rem;
                font-weight: 600;
                color: var(--primary);
            }

            .table-actions {
                display: flex;
                gap: 10px;
            }

            .table-btn {
                padding: 8px 12px;
                border-radius: 6px;
                font-size: 0.85rem;
                font-weight: 500;
                text-decoration: none;
                transition: var(--transition);
                display: inline-flex;
                align-items: center;
                border: none;
                cursor: pointer;
            }

            .table-btn i {
                margin-right: 5px;
            }

            .refresh-btn {
                background-color: var(--light);
                color: var(--text);
            }

            .refresh-btn:hover {
                background-color: #dfe6e9;
            }

            .export-btn {
                background-color: var(--primary);
                color: white;
            }

            .export-btn:hover {
                background-color: var(--primary-dark);
            }

            .data-table {
                width: 100%;
                border-collapse: separate;
                border-spacing: 0;
            }

            .data-table thead th {
                background-color: #f8f9fa;
                color: var(--primary);
                padding: 15px 20px;
                text-align: left;
                font-weight: 600;
                font-size: 0.9rem;
                border-bottom: 1px solid #eee;
            }

            .data-table tbody tr {
                transition: var(--transition);
            }

            .data-table tbody tr:hover {
                background-color: rgba(52, 152, 219, 0.05);
            }

            .data-table tbody td {
                padding: 15px 20px;
                border-bottom: 1px solid #eee;
                vertical-align: middle;
                font-size: 0.95rem;
            }

            .data-table tbody tr:last-child td {
                border-bottom: none;
            }

            .user-info {
                display: flex;
                align-items: center;
            }

            .user-avatar {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                background-color: #f1f1f1;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-right: 15px;
                font-size: 1rem;
                color: var(--primary);
            }

            .user-name {
                font-weight: 500;
            }

            .user-email {
                font-size: 0.85rem;
                color: #777;
            }

            .status-badge {
                display: inline-block;
                padding: 5px 12px;
                border-radius: 50px;
                font-size: 0.8rem;
                font-weight: 500;
            }

            .status-active {
                background-color: rgba(39, 174, 96, 0.1);
                color: var(--success);
            }

            .status-inactive {
                background-color: rgba(231, 76, 60, 0.1);
                color: var(--secondary);
            }

            .actions-container {
                display: flex;
                gap: 8px;
            }

            .action-btn {
                padding: 8px 12px;
                border-radius: 6px;
                font-size: 0.85rem;
                font-weight: 500;
                text-decoration: none;
                transition: var(--transition);
                display: inline-flex;
                align-items: center;
                border: none;
                cursor: pointer;
            }

            .action-btn i {
                margin-right: 5px;
                font-size: 0.9rem;
            }

            .delete-btn {
                background-color: rgba(231, 76, 60, 0.1);
                color: var(--secondary);
            }

            .delete-btn:hover {
                background-color: var(--secondary);
                color: white;
            }

            .update-btn {
                background-color: rgba(243, 156, 18, 0.1);
                color: var(--warning);
            }

            .update-btn:hover {
                background-color: var(--warning);
                color: white;
            }

            .view-btn {
                background-color: rgba(52, 152, 219, 0.1);
                color: var(--accent);
            }

            .view-btn:hover {
                background-color: var(--accent);
                color: white;
            }

            .add-btn {
                background-color: var(--success);
                color: white;
                padding: 12px 20px;
                border-radius: 8px;
                font-weight: 500;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
                transition: var(--transition);
                box-shadow: 0 5px 15px rgba(39, 174, 96, 0.2);
            }

            .add-btn i {
                margin-right: 10px;
            }

            .add-btn:hover {
                background-color: #219653;
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(39, 174, 96, 0.3);
            }

            .empty-message {
                text-align: center;
                padding: 50px;
            }

            .empty-message i {
                font-size: 4rem;
                color: #ddd;
                margin-bottom: 20px;
            }

            .empty-message p {
                font-size: 1.1rem;
                color: #777;
            }

            /* Pagination */
            .pagination {
                display: flex;
                justify-content: flex-end;
                align-items: center;
                padding: 15px 25px;
                border-top: 1px solid #eee;
            }

            .pagination-info {
                margin-right: auto;
                font-size: 0.9rem;
                color: #777;
            }

            .pagination-controls {
                display: flex;
                gap: 5px;
            }

            .pagination-btn {
                width: 35px;
                height: 35px;
                display: flex;
                align-items: center;
                justify-content: center;
                border-radius: 6px;
                background-color: #f8f9fa;
                color: var(--text);
                text-decoration: none;
                transition: var(--transition);
                font-size: 0.9rem;
            }

            .pagination-btn:hover {
                background-color: var(--primary);
                color: white;
            }

            .pagination-btn.active {
                background-color: var(--primary);
                color: white;
            }

            /* Mobile Menu Toggle */
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
                cursor: pointer;
            }

            /* Responsive Design */
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

                .stats-container {
                    grid-template-columns: 1fr;
                }
            }

            /* Animation */
            @keyframes fadeIn {
                from { opacity: 0; transform: translateY(20px); }
                to { opacity: 1; transform: translateY(0); }
            }

            .stat-card, .table-container {
                animation: fadeIn 0.5s ease forwards;
            }

            .stats-container > div:nth-child(1) { animation-delay: 0.1s; }
            .stats-container > div:nth-child(2) { animation-delay: 0.2s; }
            .stats-container > div:nth-child(3) { animation-delay: 0.3s; }
            .table-container { animation-delay: 0.5s; }
        </style>
    </head>
    <body>
        <!-- Mobile Menu Toggle -->
        <button class="menu-toggle" id="menuToggle">
            <i class="fas fa-bars"></i>
        </button>

        <!-- Sidebar -->
        <div class="sidebar" id="sidebar">
            <div class="sidebar-header">
                <div class="logo-container">
                    <img src="images/logo.png" alt="Luxury Drive Logo" class="sidebar-logo">
                </div>
            </div>

            <div class="admin-info">
                <div class="admin-avatar">
                    <i class="fas fa-user"></i>
                </div>
                <div class="admin-details">
                    <div class="admin-name">${sessionScope.admin.prenom} ${sessionScope.admin.nom}</div>
                    <div class="admin-role">Administrateur</div>
                </div>
            </div>

            <div class="nav-section">
                <div class="nav-section-title">Gestion</div>
                <div class="nav-links">
                    <a href="users.jsp" class="sidebar-link active">
                        <i class="fas fa-users"></i>
                        <span>Clients</span>
                    </a>
                    
                    <a href="graphe.jsp" class="sidebar-link">
                        <i class="fas fa-chart-bar"></i>
                        <span>Statistiques</span>
                    </a>
                </div>
            </div>

            <div class="sidebar-footer">
                <a href="DeconnexionController" class="logout-btn">
                    <i class="fas fa-sign-out-alt"></i>
                    <span>Déconnexion</span>
                </a>
            </div>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="page-header">
                <h1 class="page-title">Gestion des Clients</h1>

                <div class="search-box">
                    <i class="fas fa-search search-icon"></i>
                    <input type="text" class="search-input" placeholder="Rechercher un client..." id="searchClient">
                </div>
            </div>

            <!-- Stats Cards -->
            <div class="stats-container">
                <div class="stat-card">
                    <i class="fas fa-users stat-icon"></i>
                    <div class="stat-value" id="totalClients">
                        <%= totalClients%>
                    </div>
                    <div class="stat-label">Clients totaux</div>
                </div>

                <div class="stat-card">
                    <i class="fas fa-user-plus stat-icon"></i>
                    <div class="stat-value">12</div>
                    <div class="stat-label">Nouveaux ce mois</div>
                </div>

                <div class="stat-card">
                    <i class="fas fa-user-check stat-icon"></i>
                    <div class="stat-value">85%</div>
                    <div class="stat-label">Taux d'activité</div>
                </div>
            </div>

            <!-- Table Container -->
            <div class="table-container">
                <div class="table-header">
                    <div class="table-title">Liste des Clients</div>
                    <div class="table-actions">
                        <button class="table-btn refresh-btn">
                            <i class="fas fa-sync-alt"></i> Actualiser
                        </button>
                        <button class="table-btn export-btn">
                            <i class="fas fa-download"></i> Exporter
                        </button>
                    </div>
                </div>

                <table class="data-table">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Client</th>
                            <th>Email</th>
                            <th>Statut</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody id="clientsTableBody">
                        <%
                            if (users != null && !users.isEmpty()) {
                                for (User u : users) {
                                    if (u.getClass().getSimpleName().equals("Client")) {
                        %>
                        <tr class="client-row">
                            <td><%= u.getId()%></td>
                            <td>
                                <div class="user-info">
                                    <div class="user-avatar">
                                        <%= u.getPrenom().substring(0, 1).toUpperCase()%>
                                    </div>
                                    <div>
                                        <div class="user-name"><%= u.getPrenom()%> <%= u.getNom()%></div>
                                    </div>
                                </div>
                            </td>
                            <td>
                                <div class="user-email"><%= u.getEmail()%></div>
                            </td>
                            <td>
                                <span class="status-badge status-active">Actif</span>
                            </td>
                            <td class="actions-container">
                                <a href="<%= request.getContextPath() + "/UserController?id=" + u.getId() + "&op=update"%>" class="action-btn update-btn">
                                    <i class="fas fa-edit"></i> Modifier
                                </a>
                                <a href="<%= request.getContextPath() + "/UserController?id=" + u.getId() + "&op=delete"%>" class="action-btn delete-btn">
                                    <i class="fas fa-trash-alt"></i> Supprimer
                                </a>
                            </td>
                        </tr>
                        <%
                                }

                            }
                        } else {
                        %>
                        <tr>
                            <td colspan="5">
                                <div class="empty-message">
                                    <i class="fas fa-user-slash"></i>
                                    <p>Aucun client trouvé</p>
                                </div>
                            </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>

                <div class="pagination">
                    <div class="pagination-info">Affichage de 1 à <%= totalClients%> sur <%= totalClients%> entrées</div>
                    <div class="pagination-controls">
                        <a href="#" class="pagination-btn"><i class="fas fa-chevron-left"></i></a>
                        <a href="#" class="pagination-btn active">1</a>
                        <a href="#" class="pagination-btn"><i class="fas fa-chevron-right"></i></a>
                    </div>
                </div>
            </div>

            <a href="Inscription.jsp?admin=true" class="add-btn">
                <i class="fas fa-plus"></i> Ajouter un client
            </a>

            <input type="hidden" name="source" value="<%= request.getParameter("admin") != null ? "admin" : "client"%>">
        </div>

        <!-- JavaScript -->
        <script>
            document.addEventListener('DOMContentLoaded', function() {
            // Mobile menu toggle
            const menuToggle = document.getElementById('menuToggle');
                    const sidebar = document.getElementById('sidebar');
                    if (menuToggle) {
            menuToggle.addEventListener('click', function() {
            sidebar.classList.toggle('active');
                    // Change icon based on sidebar state
                    const icon = this.querySelector('i');
                    icon.classList.toggle('fa-bars');
                    icon.classList.toggle('fa-times');
            });
            }

            // Search functionality
            const searchInput = document.getElementById('searchClient');
                    const clientRows = document.querySelectorAll('.client-row');
                    if (searchInput) {
            searchInput.addEventListener('input', function() {
            const searchTerm = this.value.toLowerCase();
                    clientRows.forEach(row = > {
                    const name = row.querySelector('.user-name').textContent.toLowerCase();
                            const email = row.querySelector('.user-email').textContent.toLowerCase();
                            if (name.includes(searchTerm) || email.includes(searchTerm)) {
                    row.style.display = '';
                    } else {
                    row.style.display = 'none';
                    }
                    });
            });
            }

            // Refresh button functionality
            const refreshBtn = document.querySelector('.refresh-btn');
                    if (refreshBtn) {
            refreshBtn.addEventListener('click', function() {
            location.reload();
            });
            }

            // Export button functionality (placeholder)
            const exportBtn = document.querySelector('.export-btn');
                    if (exportBtn) {
            exportBtn.addEventListener('click', function() {
            alert('Fonctionnalité d\'export en cours de développement');
            });
            }
            });
        </script>
    </body>
</html>