<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="entities.User"%>
<%
    User user = (User) request.getAttribute("user");
    if ((session.getAttribute("admin") == null && session.getAttribute("client") == null)) {
        response.sendRedirect("Authentification.jsp");
        return;
    }
    
    boolean isAdmin = session.getAttribute("admin") != null;
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Modifier Utilisateur | SkillBoard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

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
            min-height: 100vh;
            display: flex;
            flex-direction: column;
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
        
        /* Form Styling */
        .form-container {
            background: white;
            border-radius: 15px;
            box-shadow: var(--card-shadow);
            padding: 30px;
            margin-bottom: 30px;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
            animation: fadeIn 0.5s ease forwards;
            max-width: 800px;
            width: 100%;
            margin: 0 auto;
        }
        
        .form-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }
        
        .form-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 5px;
            height: 100%;
            background: linear-gradient(to bottom, var(--secondary), var(--secondary-light));
        }
        
        .form-header {
            margin-bottom: 25px;
            padding-left: 15px;
        }
        
        .form-title {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--primary);
            margin: 0;
            margin-bottom: 10px;
        }
        
        .form-subtitle {
            font-size: 0.95rem;
            color: var(--text);
            opacity: 0.7;
        }
        
        .form-group {
            margin-bottom: 20px;
            position: relative;
        }
        
        .form-label {
            font-weight: 500;
            margin-bottom: 8px;
            color: var(--primary);
            font-size: 0.95rem;
            display: block;
        }
        
        .form-control {
            border-radius: 8px;
            border: 1px solid #e0e0e0;
            padding: 12px 15px;
            transition: var(--transition);
            font-size: 0.95rem;
            width: 100%;
        }
        
        .form-control:focus {
            box-shadow: 0 0 0 3px rgba(52, 152, 219, 0.2);
            border-color: var(--accent);
            outline: none;
        }
        
        .form-text {
            font-size: 0.85rem;
            color: #777;
            margin-top: 5px;
        }
        
        .password-toggle {
            position: absolute;
            right: 15px;
            top: 42px;
            cursor: pointer;
            color: #aaa;
            transition: var(--transition);
        }
        
        .password-toggle:hover {
            color: var(--primary);
        }
        
        .form-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 30px;
        }
        
        .btn {
            padding: 12px 25px;
            border-radius: 8px;
            font-weight: 500;
            font-size: 1rem;
            cursor: pointer;
            transition: var(--transition);
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border: none;
        }
        
        .btn i {
            margin-right: 8px;
        }
        
        .btn-primary {
            background: linear-gradient(to right, var(--secondary), var(--secondary-light));
            color: white;
            box-shadow: 0 5px 15px rgba(231, 76, 60, 0.2);
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(231, 76, 60, 0.3);
            background: linear-gradient(to right, var(--secondary-light), var(--secondary));
        }
        
        .btn-secondary {
            background-color: #f1f2f6;
            color: var(--text);
        }
        
        .btn-secondary:hover {
            background-color: #dfe4ea;
        }
        
        .form-row {
            display: flex;
            gap: 20px;
            margin-bottom: 20px;
        }
        
        .form-col {
            flex: 1;
        }
        
        .user-avatar-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .user-avatar-preview {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            background-color: #f1f2f6;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 15px;
            font-size: 3rem;
            color: var(--primary);
            position: relative;
            overflow: hidden;
        }
        
        .user-avatar-preview img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .user-avatar-preview .avatar-letter {
            font-weight: 600;
        }
        
        .avatar-edit-btn {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            background-color: rgba(0, 0, 0, 0.5);
            color: white;
            text-align: center;
            padding: 5px;
            font-size: 0.8rem;
            opacity: 0;
            transition: var(--transition);
        }
        
        .user-avatar-preview:hover .avatar-edit-btn {
            opacity: 1;
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
            
            .form-row {
                flex-direction: column;
                gap: 0;
            }
        }
        
        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        /* Client View (No Sidebar) */
        .client-view {
            background: url('images/ins.png') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .client-view .form-container {
            max-width: 500px;
            margin: 0 auto;
        }
        
        .client-view .form-header {
            text-align: center;
            padding-left: 0;
        }
        
        .client-view .form-container::before {
            display: none;
        }
        
        .client-view .form-title {
            margin-bottom: 20px;
        }
        
        .client-view .form-actions {
            justify-content: center;
        }
        
        .client-view .btn-primary {
            width: 100%;
        }
    </style>
</head>
<body class="<%= !isAdmin ? "client-view" : "" %>">

<% if (isAdmin) { %>
    <!-- Mobile Menu Toggle -->
    <button class="menu-toggle" id="menuToggle">
        <i class="fas fa-bars"></i>
    </button>

    <!-- Sidebar -->
    <div class="sidebar" id="sidebar">
        <div class="sidebar-header">
            <div class="logo-container">
                <img src="images/logo.png" alt="SkillBoard Logo" class="sidebar-logo">
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
            <h1 class="page-title">Modifier Utilisateur</h1>
        </div>
<% } %>

    <div class="form-container">
        <div class="form-header">
            <h2 class="form-title">Modifier les informations</h2>
            <p class="form-subtitle">Mettez à jour les informations de l'utilisateur</p>
        </div>
        
        <div class="user-avatar-container">
            <div class="user-avatar-preview">
                <span class="avatar-letter"><%= user != null ? user.getPrenom().substring(0, 1).toUpperCase() : "U" %></span>
                <div class="avatar-edit-btn">Modifier</div>
            </div>
        </div>
        
        <form action="UserController" method="post" id="editUserForm">
            <input type="hidden" name="id" value="<%= user != null ? user.getId() : "" %>">
            
            <div class="form-row">
                <div class="form-col">
                    <div class="form-group">
                        <label for="nom" class="form-label">Nom</label>
                        <input type="text" class="form-control" id="nom" name="nom"
                               value="<%= user != null ? user.getNom() : "" %>" placeholder="Entrez le nom" required>
                    </div>
                </div>
                
                <div class="form-col">
                    <div class="form-group">
                        <label for="prenom" class="form-label">Prénom</label>
                        <input type="text" class="form-control" id="prenom" name="prenom"
                               value="<%= user != null ? user.getPrenom() : "" %>" placeholder="Entrez le prénom" required>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email"
                       value="<%= user != null ? user.getEmail() : "" %>" placeholder="Entrez l'email" required>
                <div class="form-text">Cet email sera utilisé pour la connexion</div>
            </div>

            <div class="form-group">
                <label for="pwd" class="form-label">Mot de passe</label>
                <input type="password" class="form-control" id="pwd" name="pwd"
                       value="<%= user != null ? user.getPassword() : "" %>" placeholder="Entrez le mot de passe" required>
                <i class="fas fa-eye password-toggle" id="passwordToggle"></i>
            </div>

            <% if ("admin".equals(request.getAttribute("source"))) { %>
                <input type="hidden" name="admin" value="true">
            <% } %>

            <div class="form-actions">
                <a href="<%= isAdmin ? "users.jsp" : "index.jsp" %>" class="btn btn-secondary">
                    <i class="fas fa-times"></i> Annuler
                </a>
                <button type="submit" class="btn btn-primary">
                    <i class="fas fa-save"></i> Enregistrer les modifications
                </button>
            </div>
        </form>
    </div>

<% if (isAdmin) { %>
    </div> <!-- End of main-content -->
<% } %>

<script>
    document.addEventListener('DOMContentLoaded', function() {
        // Mobile menu toggle
        const menuToggle = document.getElementById('menuToggle');
        const sidebar = document.getElementById('sidebar');
        
        if (menuToggle && sidebar) {
            menuToggle.addEventListener('click', function() {
                sidebar.classList.toggle('active');
                
                // Change icon based on sidebar state
                const icon = this.querySelector('i');
                icon.classList.toggle('fa-bars');
                icon.classList.toggle('fa-times');
            });
        }
        
        // Password visibility toggle
        const passwordToggle = document.getElementById('passwordToggle');
        const passwordInput = document.getElementById('pwd');
        
        if (passwordToggle && passwordInput) {
            passwordToggle.addEventListener('click', function() {
                const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                passwordInput.setAttribute('type', type);
                
                // Change icon based on password visibility
                this.classList.toggle('fa-eye');
                this.classList.toggle('fa-eye-slash');
            });
        }
        
        // Form validation
        const editUserForm = document.getElementById('editUserForm');
        
        if (editUserForm) {
            editUserForm.addEventListener('submit', function(event) {
                const email = document.getElementById('email').value;
                const password = document.getElementById('pwd').value;
                
                // Simple email validation
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (!emailRegex.test(email)) {
                    alert('Veuillez entrer une adresse email valide.');
                    event.preventDefault();
                    return;
                }
                
                // Simple password validation (at least 6 characters)
                if (password.length < 6) {
                    alert('Le mot de passe doit contenir au moins 6 caractères.');
                    event.preventDefault();
                    return;
                }
            });
        }
        
        // Input animation
        const formInputs = document.querySelectorAll('.form-control');
        
        formInputs.forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.classList.add('focused');
            });
            
            input.addEventListener('blur', function() {
                this.parentElement.classList.remove('focused');
            });
        });
    });
</script>

</body>
</html>