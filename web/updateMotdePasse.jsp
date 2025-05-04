<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Réinitialisation du mot de passe | SkillBoard</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">

    <style>
        body {
            background: url('images/bg-reset.jpg') no-repeat center center fixed;
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

        .reset-container {
            width: 100%;
            max-width: 500px;
            overflow: hidden;
            border-radius: 24px;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.15);
            background-color: rgba(255, 255, 255, 0.95);
            transition: all 0.3s ease;
        }

        .reset-container:hover {
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
            cursor: pointer;
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

        .password-strength {
            height: 5px;
            border-radius: 5px;
            margin-top: 8px;
            transition: all 0.3s ease;
            background-color: #e9ecef;
            overflow: hidden;
        }

        .password-strength-meter {
            height: 100%;
            width: 0;
            transition: all 0.3s ease;
        }

        .strength-text {
            font-size: 0.8rem;
            margin-top: 5px;
            color: #6c757d;
        }

        .btn-update {
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

        .btn-update:hover {
            background: linear-gradient(to right, #7d3d5e, #954a70);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(149, 74, 112, 0.4);
        }

        .btn-update:active {
            transform: translateY(0);
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

        .success-message {
            background-color: #f0fff0;
            border-radius: 8px;
            padding: 10px;
            font-size: 0.9rem;
            border-left: 3px solid #28a745;
            margin-top: 20px;
            color: #28a745;
            text-align: center;
        }

        .password-requirements {
            margin-top: 15px;
            padding: 10px;
            background-color: #f8f9fa;
            border-radius: 8px;
            font-size: 0.85rem;
        }

        .requirement {
            margin-bottom: 5px;
            color: #6c757d;
            transition: all 0.3s ease;
        }

        .requirement i {
            margin-right: 5px;
        }

        .requirement.valid {
            color: #28a745;
        }

        .requirement.invalid {
            color: #dc3545;
        }

        @media (max-width: 576px) {
            .reset-container {
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

    <div class="reset-container">
        <div class="header">
            <div class="logo-container">
                <img src="https://hebbkx1anhila5yf.public.blob.vercel-storage.com/logo-uS7Lbbc6k3uKCt5eid0QkyL6mnVlld.png" alt="SkillBoard Logo">
            </div>
            <h3>Réinitialisation du mot de passe</h3>
            <p>Créez un nouveau mot de passe sécurisé</p>
        </div>
        
        <div class="form-section">
            <form method="post" action="UpdatePasswordController" id="resetForm">
                <div class="mb-4">
                    <label for="password" class="form-label">Nouveau mot de passe</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-lock"></i></span>
                        <input type="password" class="form-control" id="password" name="password" required>
                        <span class="input-group-text toggle-password" title="Afficher/Masquer le mot de passe">
                            <i class="bi bi-eye"></i>
                        </span>
                    </div>
                    <div class="password-strength">
                        <div class="password-strength-meter"></div>
                    </div>
                    <div class="strength-text"></div>
                </div>

                <div class="mb-4">
                    <label for="passwordcnf" class="form-label">Confirmer le mot de passe</label>
                    <div class="input-group">
                        <span class="input-group-text"><i class="bi bi-lock-fill"></i></span>
                        <input type="password" class="form-control" id="passwordcnf" name="passwordcnf" required>
                        <span class="input-group-text toggle-password" title="Afficher/Masquer le mot de passe">
                            <i class="bi bi-eye"></i>
                        </span>
                    </div>
                </div>

                <div class="password-requirements">
                    <div class="requirement" id="length"><i class="bi bi-circle"></i> Au moins 8 caractères</div>
                    <div class="requirement" id="uppercase"><i class="bi bi-circle"></i> Au moins une majuscule</div>
                    <div class="requirement" id="lowercase"><i class="bi bi-circle"></i> Au moins une minuscule</div>
                    <div class="requirement" id="number"><i class="bi bi-circle"></i> Au moins un chiffre</div>
                    <div class="requirement" id="special"><i class="bi bi-circle"></i> Au moins un caractère spécial</div>
                    <div class="requirement" id="match"><i class="bi bi-circle"></i> Les mots de passe correspondent</div>
                </div>

                <button type="submit" class="btn btn-update mt-4">
                    <i class="bi bi-check-circle me-2"></i>Mettre à jour
                </button>

                <% if (request.getAttribute("msg") != null) { %>
                    <div class="error-message">
                        <i class="bi bi-exclamation-triangle me-2"></i>
                        <%= request.getAttribute("msg") %>
                    </div>
                <% } %>

                <% if (request.getAttribute("successMessage") != null) { %>
                    <div class="success-message">
                        <i class="bi bi-check-circle me-2"></i>
                        <%= request.getAttribute("successMessage") %>
                    </div>
                <% } %>
            </form>
        </div>
    </div>

    <!-- JavaScript for password functionality -->
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            const passwordInput = document.getElementById('password');
            const confirmInput = document.getElementById('passwordcnf');
            const strengthMeter = document.querySelector('.password-strength-meter');
            const strengthText = document.querySelector('.strength-text');
            const toggleButtons = document.querySelectorAll('.toggle-password');
            
            // Requirements
            const lengthReq = document.getElementById('length');
            const uppercaseReq = document.getElementById('uppercase');
            const lowercaseReq = document.getElementById('lowercase');
            const numberReq = document.getElementById('number');
            const specialReq = document.getElementById('special');
            const matchReq = document.getElementById('match');
            
            // Toggle password visibility
            toggleButtons.forEach(button => {
                button.addEventListener('click', function() {
                    const input = this.previousElementSibling;
                    const icon = this.querySelector('i');
                    
                    if (input.type === 'password') {
                        input.type = 'text';
                        icon.classList.remove('bi-eye');
                        icon.classList.add('bi-eye-slash');
                    } else {
                        input.type = 'password';
                        icon.classList.remove('bi-eye-slash');
                        icon.classList.add('bi-eye');
                    }
                });
            });
            
            // Check password strength
            passwordInput.addEventListener('input', function() {
                const password = this.value;
                let strength = 0;
                let color = '';
                let message = '';
                
                // Check requirements
                const hasLength = password.length >= 8;
                const hasUppercase = /[A-Z]/.test(password);
                const hasLowercase = /[a-z]/.test(password);
                const hasNumber = /[0-9]/.test(password);
                const hasSpecial = /[^A-Za-z0-9]/.test(password);
                
                updateRequirement(lengthReq, hasLength);
                updateRequirement(uppercaseReq, hasUppercase);
                updateRequirement(lowercaseReq, hasLowercase);
                updateRequirement(numberReq, hasNumber);
                updateRequirement(specialReq, hasSpecial);
                
                // Calculate strength
                if (password.length > 0) {
                    strength += hasLength ? 20 : 0;
                    strength += hasUppercase ? 20 : 0;
                    strength += hasLowercase ? 20 : 0;
                    strength += hasNumber ? 20 : 0;
                    strength += hasSpecial ? 20 : 0;
                }
                
                // Set color and message based on strength
                if (strength === 0) {
                    color = '#e9ecef';
                    message = '';
                } else if (strength <= 20) {
                    color = '#dc3545';
                    message = 'Très faible';
                } else if (strength <= 40) {
                    color = '#ffc107';
                    message = 'Faible';
                } else if (strength <= 60) {
                    color = '#fd7e14';
                    message = 'Moyen';
                } else if (strength <= 80) {
                    color = '#20c997';
                    message = 'Fort';
                } else {
                    color = '#28a745';
                    message = 'Très fort';
                }
                
                // Update UI
                strengthMeter.style.width = strength + '%';
                strengthMeter.style.backgroundColor = color;
                strengthText.textContent = message;
                strengthText.style.color = color;
                
                // Check if passwords match
                checkPasswordsMatch();
            });
            
            // Check if passwords match
            confirmInput.addEventListener('input', checkPasswordsMatch);
            
            function checkPasswordsMatch() {
                const password = passwordInput.value;
                const confirm = confirmInput.value;
                const doMatch = password === confirm && password.length > 0;
                
                updateRequirement(matchReq, doMatch);
            }
            
            function updateRequirement(element, isValid) {
                const icon = element.querySelector('i');
                
                if (isValid) {
                    element.classList.add('valid');
                    element.classList.remove('invalid');
                    icon.classList.remove('bi-circle', 'bi-x-circle');
                    icon.classList.add('bi-check-circle');
                } else if (element.textContent.includes('correspondent') && confirmInput.value.length === 0) {
                    element.classList.remove('valid', 'invalid');
                    icon.classList.remove('bi-check-circle', 'bi-x-circle');
                    icon.classList.add('bi-circle');
                } else if (passwordInput.value.length === 0) {
                    element.classList.remove('valid', 'invalid');
                    icon.classList.remove('bi-check-circle', 'bi-x-circle');
                    icon.classList.add('bi-circle');
                } else {
                    element.classList.add('invalid');
                    element.classList.remove('valid');
                    icon.classList.remove('bi-circle', 'bi-check-circle');
                    icon.classList.add('bi-x-circle');
                }
            }
            
            // Form validation
            document.getElementById('resetForm').addEventListener('submit', function(e) {
                const password = passwordInput.value;
                const confirm = confirmInput.value;
                
                const hasLength = password.length >= 8;
                const hasUppercase = /[A-Z]/.test(password);
                const hasLowercase = /[a-z]/.test(password);
                const hasNumber = /[0-9]/.test(password);
                const hasSpecial = /[^A-Za-z0-9]/.test(password);
                const doMatch = password === confirm;
                
                if (!hasLength || !hasUppercase || !hasLowercase || !hasNumber || !hasSpecial || !doMatch) {
                    e.preventDefault();
                    alert('Veuillez respecter toutes les exigences de mot de passe.');
                }
            });
        });
    </script>

</body>
</html>