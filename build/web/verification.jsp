<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vérification | SkillBoard</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            background: url('images/liste.png') no-repeat center center fixed;
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

        .verification-container {
            width: 100%;
            max-width: 500px;
            overflow: hidden;
            border-radius: 24px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
            background-color: rgba(255, 255, 255, 0.95);
            transition: all 0.3s ease;
        }

        .verification-container:hover {
            box-shadow: 0 25px 70px rgba(0, 0, 0, 0.2);
            transform: translateY(-5px);
        }

        .header {
            background: linear-gradient(135deg, #954a70, #b25c88, #d17ea6);
            color: white;
            padding: 30px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .header::before {
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
            margin: 0 auto 20px;
            position: relative;
            z-index: 1;
            max-width: 200px;
        }

        .logo-container img {
            width: 100%;
            height: auto;
            filter: brightness(0) invert(1);
        }

        .header h3 {
            font-weight: 600;
            margin-bottom: 10px;
            font-size: 1.8rem;
            position: relative;
            z-index: 1;
        }

        .header p {
            font-size: 0.95rem;
            opacity: 0.9;
            margin-bottom: 0;
            position: relative;
            z-index: 1;
        }

        .form-section {
            padding: 40px;
        }

        .form-label {
            font-weight: 500;
            font-size: 0.9rem;
            color: #555;
            margin-bottom: 8px;
        }

        .verification-code {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 25px;
        }

        .code-input {
            width: 100%;
            max-width: 300px;
            border: none;
            border-radius: 12px;
            padding: 15px;
            font-size: 1.2rem;
            text-align: center;
            letter-spacing: 2px;
            background-color: #f8f9fa;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.05);
            transition: all 0.3s ease;
        }

        .code-input:focus {
            box-shadow: 0 5px 15px rgba(149, 74, 112, 0.1);
            outline: none;
            background-color: #fff;
        }

        .btn-verify {
            background: linear-gradient(to right, #954a70, #c06a94);
            border: none;
            padding: 12px;
            font-weight: 500;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(149, 74, 112, 0.3);
            transition: all 0.3s ease;
            color: white;
            width: 100%;
        }

        .btn-verify:hover {
            background: linear-gradient(to right, #7d3d5e, #954a70);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(149, 74, 112, 0.4);
        }

        .btn-verify:active {
            transform: translateY(0);
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #954a70;
            text-decoration: none;
            font-size: 0.9rem;
            transition: all 0.2s ease;
        }

        .back-link:hover {
            color: #7d3d5e;
        }

        .error-message {
            background-color: #fff0f0;
            border-radius: 8px;
            padding: 10px;
            font-size: 0.9rem;
            border-left: 3px solid #dc3545;
            margin-top: 20px;
            color: #dc3545;
            text-align: center;
        }

        /* Remove spinner from number input */
        input::-webkit-outer-spin-button,
        input::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        input[type=number] {
            -moz-appearance: textfield;
        }

        @media (max-width: 576px) {
            .verification-container {
                border-radius: 16px;
            }
            
            .header {
                padding: 25px 20px;
            }
            
            .form-section {
                padding: 30px 20px;
            }
            
            .logo-container {
                max-width: 160px;
            }
        }
    </style>
</head>
<body>
    <div class="verification-container">
        <div class="header">
            <div class="logo-container">
                <img src="https://hebbkx1anhila5yf.public.blob.vercel-storage.com/logo-uS7Lbbc6k3uKCt5eid0QkyL6mnVlld.png" alt="SkillBoard Logo">
            </div>
            <h3>Vérification</h3>
            <p>Veuillez entrer le code de vérification reçu par e-mail</p>
        </div>
        
        <div class="form-section">
            <form action="Verfier" method="post">
                <div class="mb-4">
                    <label for="code" class="form-label text-center d-block">Code de vérification</label>
                    <div class="verification-code">
                        <input type="number" name="code" id="code" class="code-input" required placeholder="Entrez le code">
                    </div>
                </div>

                <button type="submit" class="btn btn-verify">
                    <i class="bi bi-check-circle me-2"></i>Valider
                </button>

                <% if (request.getAttribute("msg") != null) { %>
                    <div class="error-message">
                        <i class="bi bi-exclamation-triangle me-2"></i>
                        <%= request.getAttribute("msg") %>
                    </div>
                <% } %>
                
                <a href="forgotPassword.jsp" class="back-link">
                    <i class="bi bi-arrow-left me-1"></i>Retour
                </a>
            </form>
        </div>
    </div>
</body>
</html>