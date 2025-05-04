<%@page import="entities.Client"%>
<%
    Client user = (Client) request.getAttribute("user");
%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inscription - SkillBoard</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            background: url('images/ins.png') no-repeat center center fixed;
            background-size: cover;
            min-height: 100vh;
            margin: 0;
            font-family: 'Poppins', 'Segoe UI', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #333;
            padding: 20px;
        }

        .register-container {
            width: 100%;
            max-width: 800px;
            overflow: hidden;
            border-radius: 24px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
            background-color: rgba(255, 255, 255, 0.95);
            transition: all 0.3s ease;
            display: flex;
            flex-direction: row;
        }

        .register-container:hover {
            box-shadow: 0 25px 70px rgba(0, 0, 0, 0.2);
            transform: translateY(-5px);
        }

        .sidebar {
            background: linear-gradient(135deg, #954a70, #b25c88, #d17ea6);
            color: white;
            padding: 40px 30px;
            width: 40%;
            position: relative;
            overflow: hidden;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .sidebar::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiPjxkZWZzPjxwYXR0ZXJuIGlkPSJwYXR0ZXJuIiB3aWR0aD0iNDAiIGhlaWdodD0iNDAiIHZpZXdCb3g9IjAgMCA0MCA0MCIgcGF0dGVyblVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgcGF0dGVyblRyYW5zZm9ybT0icm90YXRlKDQ1KSI+PHJlY3QgaWQ9InBhdHRlcm4tYmFja2dyb3VuZCIgd2lkdGg9IjQwMCUiIGhlaWdodD0iNDAwJSIgZmlsbD0icmdiYSgyNTUsMjU1LDI1NSwwKSI+PC9yZWN0PiA8Y2lyY2xlIGZpbGw9InJnYmEoMjU1LDI1NSwyNTUsMC4wNSkiIGN4PSIyMCIgY3k9IjIwIiByPSIxIj48L2NpcmNsZT48L3BhdHRlcm4+PC9kZWZzPjxyZWN0IGZpbGw9InVybCgjcGF0dGVybikiIGhlaWdodD0iMTAwJSIgd2lkdGg9IjEwMCUiPjwvcmVjdD48L3N2Zz4=') repeat;
            opacity: 0.4;
        }

        .logo-container {
            margin: 0 auto 30px;
            position: relative;
            z-index: 1;
            max-width: 180px;
        }

        .logo-container img {
            width: 100%;
            height: auto;
            filter: brightness(0) invert(1);
        }

        .sidebar-content {
            position: relative;
            z-index: 1;
        }

        .sidebar h3 {
            font-weight: 600;
            margin-bottom: 15px;
            font-size: 1.8rem;
        }

        .sidebar p {
            font-size: 0.95rem;
            opacity: 0.9;
            margin-bottom: 20px;
            line-height: 1.6;
        }

        .benefits {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .benefits li {
            margin-bottom: 12px;
            display: flex;
            align-items: center;
            font-size: 0.9rem;
        }

        .benefits li i {
            margin-right: 10px;
            font-size: 1.1rem;
        }

        .form-section {
            padding: 40px;
            width: 60%;
        }

        .form-section h2 {
            font-weight: 600;
            color: #954a70;
            margin-bottom: 25px;
            font-size: 1.8rem;
            position: relative;
            display: inline-block;
        }

        .form-section h2::after {
            content: '';
            position: absolute;
            bottom: -8px;
            left: 0;
            width: 50px;
            height: 3px;
            background: linear-gradient(to right, #954a70, #d17ea6);
        }

        .form-label {
            font-weight: 500;
            font-size: 0.9rem;
            color: #555;
            margin-bottom: 8px;
        }

        .input-group {
            margin-bottom: 5px;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }

        .input-group:focus-within {
            box-shadow: 0 5px 15px rgba(149, 74, 112, 0.1);
        }

        .input-group-text {
            background-color: #f8f9fa;
            border: none;
            color: #b25c88;
            padding-left: 15px;
        }

        .form-control {
            border: none;
            padding: 12px 15px;
            font-size: 0.95rem;
            background-color: #f8f9fa;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            background-color: #fff;
            border-color: #b25c88;
            box-shadow: none;
        }

        .btn-register {
            background: linear-gradient(to right, #954a70, #c06a94);
            border: none;
            padding: 12px;
            font-weight: 500;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(149, 74, 112, 0.3);
            transition: all 0.3s ease;
            color: white;
            width: 100%;
            margin-top: 10px;
        }

        .btn-register:hover {
            background: linear-gradient(to right, #7d3d5e, #954a70);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(149, 74, 112, 0.4);
        }

        .btn-register:active {
            transform: translateY(0);
        }

        .login-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #954a70;
            text-decoration: none;
            font-size: 0.9rem;
            transition: all 0.2s ease;
        }

        .login-link:hover {
            color: #7d3d5e;
        }

        .form-floating {
            margin-bottom: 20px;
        }

        .form-floating > .form-control {
            padding: 1.5rem 1rem 0.5rem;
            height: calc(3.5rem + 2px);
        }

        .form-floating > label {
            padding: 1rem 1rem;
        }

        .toggle-password {
            cursor: pointer;
        }

        @media (max-width: 768px) {
            .register-container {
                flex-direction: column;
                max-width: 95%;
            }
            
            .sidebar, .form-section {
                width: 100%;
                padding: 30px 20px;
            }
            
            .sidebar {
                border-radius: 24px 24px 0 0;
                padding-bottom: 20px;
            }
            
            .logo-container {
                max-width: 150px;
                margin-bottom: 15px;
            }
            
            .sidebar h3 {
                font-size: 1.5rem;
            }
            
            .benefits {
                display: none;
            }
        }
    </style>
</head>
<body>
    <div class="register-container">
        <div class="sidebar">
            <div class="sidebar-content">
                <div class="logo-container">
                    <img src="https://hebbkx1anhila5yf.public.blob.vercel-storage.com/logo-uS7Lbbc6k3uKCt5eid0QkyL6mnVlld.png" alt="SkillBoard Logo">
                </div>
                <h3>Rejoignez SkillBoard</h3>
                <p>Créez votre compte pour accéder à toutes les fonctionnalités de la plateforme.</p>
                
                <ul class="benefits">
                    <li><i class="bi bi-check-circle"></i> Gérez vos compétences professionnelles</li>
                    <li><i class="bi bi-check-circle"></i> Suivez votre progression</li>
                    <li><i class="bi bi-check-circle"></i> Explorez des domaines de formation adaptés</li>
                    <li><i class="bi bi-check-circle"></i> Consultez des statistiques personnalisées</li>
                </ul>
            </div>
        </div>
        
        <div class="form-section">
            <h2>Créer un compte</h2>
            
            <form method="post" action="InscriptionController" id="registrationForm">
                <input type="hidden" name="id" value="<%= user != null ? user.getId() : ""%>" />
                
                <div class="form-floating mb-3">
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-person"></i></span>
                        <input type="text" class="form-control" id="nom" name="nom" value="<%= user != null ? user.getNom() : ""%>" placeholder="Entrez votre nom" required />
                    </div>
                    <div class="invalid-feedback">Veuillez entrer votre nom.</div>
                </div>
                
                <div class="form-floating mb-3">
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-person-fill"></i></span>
                        <input type="text" class="form-control" id="prenom" name="prenom" value="<%= user != null ? user.getPrenom() : ""%>" placeholder="Entrez votre prénom" required />
                    </div>
                    <div class="invalid-feedback">Veuillez entrer votre prénom.</div>
                </div>
                
                <div class="form-floating mb-3">
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-card-text"></i></span>
                        <input type="text" class="form-control" id="cin" name="cin" value="<%= user != null ? user.getCin() : ""%>" placeholder="Entrez votre CIN" required />
                    </div>
                    <div class="invalid-feedback">Veuillez entrer votre CIN.</div>
                </div>
                
                <div class="form-floating mb-3">
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                        <input type="email" class="form-control" id="email" name="email" value="<%= user != null ? user.getEmail() : ""%>" placeholder="Entrez votre email" required />
                    </div>
                    <div class="invalid-feedback">Veuillez entrer une adresse email valide.</div>
                </div>
                
                <div class="form-floating mb-3">
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-lock"></i></span>
                        <input type="password" class="form-control" id="pwd" name="pwd" value="<%= user != null ? user.getPassword() : ""%>" placeholder="Entrez votre mot de passe" required />
                        <span class="input-group-text toggle-password" title="Afficher/Masquer le mot de passe">
                            <i class="bi bi-eye"></i>
                        </span>
                    </div>
                    <div class="invalid-feedback">Veuillez entrer un mot de passe.</div>
                </div>
                
                <input type="hidden" name="source" value="<%= request.getParameter("admin") != null ? "admin" : "client" %>">
                
                <button type="submit" class="btn btn-register">
                    <i class="bi bi-person-plus me-2"></i>S'inscrire
                </button>
                
                <a href="Authentification.jsp" class="login-link">
                    <i class="bi bi-arrow-left me-1"></i>Déjà inscrit ? Connectez-vous
                </a>
            </form>
        </div>
    </div>

    <!-- JavaScript for form validation and password toggle -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Toggle password visibility
            const togglePassword = document.querySelector('.toggle-password');
            const passwordInput = document.querySelector('#pwd');
            
            togglePassword.addEventListener('click', function() {
                const type = passwordInput.getAttribute('type') === 'password' ? 'text' : 'password';
                passwordInput.setAttribute('type', type);
                
                // Toggle icon
                const icon = this.querySelector('i');
                if (type === 'text') {
                    icon.classList.remove('bi-eye');
                    icon.classList.add('bi-eye-slash');
                } else {
                    icon.classList.remove('bi-eye-slash');
                    icon.classList.add('bi-eye');
                }
            });
            
            // Form validation
            const form = document.getElementById('registrationForm');
            
            form.addEventListener('submit', function(event) {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                
                const inputs = form.querySelectorAll('.form-control');
                inputs.forEach(input => {
                    if (!input.checkValidity()) {
                        input.classList.add('is-invalid');
                    } else {
                        input.classList.remove('is-invalid');
                        input.classList.add('is-valid');
                    }
                    
                    input.addEventListener('input', function() {
                        if (this.checkValidity()) {
                            this.classList.remove('is-invalid');
                            this.classList.add('is-valid');
                        } else {
                            this.classList.remove('is-valid');
                            this.classList.add('is-invalid');
                        }
                    });
                });
            });
            
            // Email validation
            const emailInput = document.getElementById('email');
            emailInput.addEventListener('input', function() {
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                if (emailRegex.test(this.value)) {
                    this.classList.remove('is-invalid');
                    this.classList.add('is-valid');
                } else {
                    this.classList.remove('is-valid');
                    this.classList.add('is-invalid');
                }
            });
        });
    </script>
</body>
</html>