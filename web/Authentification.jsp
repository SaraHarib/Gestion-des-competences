<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Connexion - SkillBoard</title>

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
            }

            .login-container {
                background-color: rgba(255, 255, 255, 0.95);
                border-radius: 24px;
                display: flex;
                width: 1000px;
                max-width: 95%;
                overflow: hidden;
                box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
                transition: all 0.3s ease;
            }

            .login-container:hover {
                box-shadow: 0 25px 70px rgba(0, 0, 0, 0.2);
                transform: translateY(-5px);
            }

            .login-left {
                background: linear-gradient(135deg, #954a70, #b25c88, #d17ea6);
                color: white;
                flex: 1;
                padding: 50px 40px;
                display: flex;
                flex-direction: column;
                justify-content: center;
                text-align: center;
                position: relative;
                overflow: hidden;
            }

            .login-left::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: url('data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiPjxkZWZzPjxwYXR0ZXJuIGlkPSJwYXR0ZXJuIiB3aWR0aD0iNDAiIGhlaWdodD0iNDAiIHZpZXdCb3g9IjAgMCA0MCA0MCIgcGF0dGVyblVuaXRzPSJ1c2VyU3BhY2VPblVzZSIgcGF0dGVyblRyYW5zZm9ybT0icm90YXRlKDQ1KSI+PHJlY3QgaWQ9InBhdHRlcm4tYmFja2dyb3VuZCIgd2lkdGg9IjQwMCUiIGhlaWdodD0iNDAwJSIgZmlsbD0icmdiYSgyNTUsMjU1LDI1NSwwKSI+PC9yZWN0PiA8Y2lyY2xlIGZpbGw9InJnYmEoMjU1LDI1NSwyNTUsMC4wNSkiIGN4PSIyMCIgY3k9IjIwIiByPSIxIj48L2NpcmNsZT48L3BhdHRlcm4+PC9kZWZzPjxyZWN0IGZpbGw9InVybCgjcGF0dGVybikiIGhlaWdodD0iMTAwJSIgd2lkdGg9IjEwMCUiPjwvcmVjdD48L3N2Zz4=') repeat;
                opacity: 0.4;
            }

            .login-left h2 {
                font-weight: 700;
                margin-bottom: 16px;
                font-size: 2.2rem;
                position: relative;
                z-index: 1;
            }

            .login-left p {
                font-size: 1rem;
                line-height: 1.6;
                font-weight: 300;
                margin-bottom: 16px;
                position: relative;
                z-index: 1;
            }

            .logo-container {
                margin: 0 auto 30px;
                position: relative;
                z-index: 1;
                max-width: 280px;
                transition: all 0.3s ease;
            }

            .logo-container img {
                width: 100%;
                height: auto;
                filter: brightness(0) invert(1);
            }

            .login-right {
                flex: 1;
                padding: 50px 40px;
                display: flex;
                flex-direction: column;
                justify-content: center;
            }

            .login-right h4 {
                font-weight: 600;
                color: #954a70;
                margin-bottom: 30px;
                font-size: 1.8rem;
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

            .form-check-input {
                border-color: #ccc;
            }

            .form-check-input:checked {
                background-color: #954a70;
                border-color: #954a70;
            }

            .form-check-label {
                color: #666;
            }

            .btn-primary {
                background: linear-gradient(to right, #954a70, #c06a94);
                border: none;
                padding: 12px;
                font-weight: 500;
                border-radius: 12px;
                box-shadow: 0 5px 15px rgba(149, 74, 112, 0.3);
                transition: all 0.3s ease;
            }

            .btn-primary:hover {
                background: linear-gradient(to right, #7d3d5e, #954a70);
                transform: translateY(-2px);
                box-shadow: 0 8px 20px rgba(149, 74, 112, 0.4);
            }

            .btn-primary:active {
                transform: translateY(0);
            }

            .btn-outline-secondary {
                border: 1px solid #e0e0e0;
                color: #555;
                padding: 12px;
                font-weight: 500;
                border-radius: 12px;
                transition: all 0.3s ease;
            }

            .btn-outline-secondary:hover {
                background-color: #f8f9fa;
                color: #954a70;
                border-color: #ccc;
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.05);
            }

            .divider {
                display: flex;
                align-items: center;
                text-align: center;
                margin: 25px 0;
                color: #999;
                font-size: 0.9rem;
            }

            .divider::before,
            .divider::after {
                content: '';
                flex: 1;
                border-bottom: 1px solid #eee;
            }

            .divider:not(:empty)::before {
                margin-right: 1em;
            }

            .divider:not(:empty)::after {
                margin-left: 1em;
            }

            a {
                color: #954a70;
                text-decoration: none;
                transition: all 0.2s ease;
                font-weight: 500;
            }

            a:hover {
                color: #7d3d5e;
                text-decoration: none;
            }

            .text-danger {
                background-color: #fff0f0;
                border-radius: 8px;
                padding: 10px;
                font-size: 0.9rem;
                border-left: 3px solid #dc3545;
            }

            @media (max-width: 768px) {
                .login-container {
                    flex-direction: column;
                    max-width: 90%;
                }
                
                .login-left, .login-right {
                    padding: 30px;
                }
                
                .login-left h2 {
                    font-size: 1.8rem;
                }
                
                .logo-container {
                    max-width: 220px;
                    margin-bottom: 20px;
                }
            }
        </style>
    </head>
    <body>

        <div class="login-container">
            <div class="login-left">
                <div class="logo-container">
                    <img src="https://hebbkx1anhila5yf.public.blob.vercel-storage.com/logo-uS7Lbbc6k3uKCt5eid0QkyL6mnVlld.png" alt="SkillBoard Logo">
                </div>
                <p>Gérez vos compétences et explorez des domaines de formation adaptés.</p>
                <p>Connectez-vous pour ajouter vos compétences, suivre votre progression, et consulter des statistiques personnalisées.</p>
            </div>
            <div class="login-right">
                <h4 class="text-center">Connexion</h4>
                <form action="/SkillBoard/AuthentificationController" method="post">
                    <div class="mb-4">
                        <label for="email" class="form-label">Email</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-envelope"></i></span>
                            <input type="email" class="form-control" id="email" name="email" placeholder="Votre adresse email" required>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label for="password" class="form-label">Mot de passe</label>
                        <div class="input-group">
                            <span class="input-group-text"><i class="bi bi-lock"></i></span>
                            <input type="password" class="form-control" id="password" name="password" placeholder="Votre mot de passe" required>
                        </div>
                    </div>

                    <div class="mb-4 form-check">
                        <input type="checkbox" class="form-check-input" id="remember">
                        <label class="form-check-label" for="remember">Se souvenir de moi</label>
                    </div>

                    <div class="d-grid mb-4">
                        <button type="submit" class="btn btn-primary">
                            <i class="bi bi-box-arrow-in-right me-2"></i>Connexion
                        </button>
                    </div>

                    <div class="divider">ou</div>

                    <div class="d-grid mb-4">
                        <a href="forgotPassword.jsp" class="btn btn-outline-secondary">
                            <i class="bi bi-question-circle me-2"></i>Mot de passe oublié ?
                        </a>
                    </div>

                    <div class="text-center">
                        <span style="color: #666;">Vous n'avez pas de compte ?</span>
                        <a href="Inscription.jsp" class="ms-2">Créer un compte</a>
                    </div>

                    <% if (request.getAttribute("msg") != null) { %>
                    <div class="mt-4 text-danger text-center">
                        <i class="bi bi-exclamation-triangle me-2"></i>
                        <%= request.getAttribute("msg") %>
                    </div>
                    <% } %>
                </form>
            </div>
        </div>

    </body>
</html>