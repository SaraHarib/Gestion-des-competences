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
    <title>Statistiques | SkillBoard</title>
    
    <!-- CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
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

        /* Chart Styles */
        .stats-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            margin-bottom: 30px;
        }

        .stat-card {
            background-color: white;
            border-radius: 15px;
            box-shadow: var(--card-shadow);
            padding: 20px;
            transition: var(--transition);
            border: none;
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
            width: 5px;
            height: 100%;
            background: linear-gradient(to bottom, var(--primary), var(--secondary));
        }

        .stat-card h5 {
            font-weight: 600;
            color: var(--primary);
            margin-bottom: 10px;
            font-size: 1.1rem;
        }

        .stat-value {
            font-size: 2rem;
            font-weight: 700;
            color: var(--dark);
            margin-bottom: 5px;
        }

        .stat-label {
            font-size: 0.85rem;
            color: var(--text);
            opacity: 0.7;
        }

        .chart-container {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: var(--card-shadow);
            margin-bottom: 30px;
            transition: var(--transition);
            position: relative;
            overflow: hidden;
        }

        .chart-container:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
        }

        .chart-container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 5px;
            height: 100%;
            background: linear-gradient(to bottom, var(--primary), var(--secondary));
        }

        .chart-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .chart-title {
            font-size: 1.2rem;
            font-weight: 600;
            color: var(--primary);
        }

        .chart-actions {
            display: flex;
            gap: 10px;
        }

        .chart-btn {
            background-color: rgba(149, 74, 112, 0.1);
            color: var(--primary);
            border: none;
            border-radius: 8px;
            padding: 8px 12px;
            font-size: 0.85rem;
            cursor: pointer;
            transition: var(--transition);
            display: flex;
            align-items: center;
        }

        .chart-btn:hover {
            background-color: rgba(149, 74, 112, 0.2);
        }

        .chart-btn i {
            margin-right: 5px;
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
            
            .stats-container {
                grid-template-columns: 1fr;
            }
        }

        /* Animation */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .stat-card, .chart-container {
            animation: fadeIn 0.5s ease forwards;
        }

        .stats-container > div:nth-child(1) { animation-delay: 0.1s; }
        .stats-container > div:nth-child(2) { animation-delay: 0.2s; }
        .stats-container > div:nth-child(3) { animation-delay: 0.3s; }
        .chart-container { animation-delay: 0.4s; }
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
                <a href="ProfilClientController" class="nav-link">
                    <i class="bi bi-person-badge"></i>
                    <span>Mon Profil</span>
                </a>
            </li>
            <li class="nav-item">
                <a href="StatistiquesController" class="nav-link active">
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
        <div class="page-header">
            <h1 class="page-title">Statistiques des Compétences</h1>
        </div>

        <!-- Stats Summary Cards -->
        <div class="stats-container">
            <div class="stat-card">
                <h5>Total des compétences</h5>
                <div class="stat-value" id="totalSkills">0</div>
                <div class="stat-label">Toutes catégories confondues</div>
            </div>
            
            <div class="stat-card">
                <h5>Catégorie principale</h5>
                <div class="stat-value" id="topCategory">-</div>
                <div class="stat-label">Catégorie la plus représentée</div>
            </div>
            
            <div class="stat-card">
                <h5>Moyenne par catégorie</h5>
                <div class="stat-value" id="avgPerCategory">0</div>
                <div class="stat-label">Compétences par catégorie</div>
            </div>
        </div>

        <!-- Chart Container -->
        <div class="chart-container">
            <div class="chart-header">
                <div class="chart-title">Compétences par Catégorie</div>
                <div class="chart-actions">
                    <button class="chart-btn" id="barChartBtn">
                        <i class="bi bi-bar-chart"></i> Barres
                    </button>
                    <button class="chart-btn" id="pieChartBtn">
                        <i class="bi bi-pie-chart"></i> Camembert
                    </button>
                </div>
            </div>
            <canvas id="chartCategorie"></canvas>
        </div>
    </div>

    <!-- JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
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
                    icon.classList.toggle('bi-list');
                    icon.classList.toggle('bi-x');
                });
            }
            
            // Données dynamiques injectées depuis le controller
            const labels = [
                <c:forEach var="stat" items="${statistiquesCategorie}" varStatus="loop">
                    "${stat[0]}"<c:if test="${!loop.last}">,</c:if>
                </c:forEach>
            ];

            const data = [
                <c:forEach var="stat" items="${statistiquesCategorie}" varStatus="loop">
                    ${stat[1]}<c:if test="${!loop.last}">,</c:if>
                </c:forEach>
            ];
            
            // Calculate and display summary statistics
            const totalSkills = data.reduce((sum, val) => sum + val, 0);
            document.getElementById('totalSkills').textContent = totalSkills;
            
            let topCategoryIndex = 0;
            let maxValue = 0;
            data.forEach((val, idx) => {
                if (val > maxValue) {
                    maxValue = val;
                    topCategoryIndex = idx;
                }
            });
            
            if (labels.length > 0) {
                document.getElementById('topCategory').textContent = labels[topCategoryIndex];
            }
            
            const avgPerCategory = labels.length > 0 ? (totalSkills / labels.length).toFixed(1) : 0;
            document.getElementById('avgPerCategory').textContent = avgPerCategory;

            // Initialize chart
            let currentChart = null;
            const ctx = document.getElementById('chartCategorie').getContext('2d');
            
            function createBarChart() {
                if (currentChart) {
                    currentChart.destroy();
                }
                
                currentChart = new Chart(ctx, {
                    type: 'bar',
                    data: {
                        labels: labels,
                        datasets: [{
                            label: 'Nombre de compétences',
                            data: data,
                            backgroundColor: 'rgba(149, 74, 112, 0.6)',
                            borderColor: '#954a70',
                            borderWidth: 1,
                            borderRadius: 5
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: { display: false },
                            tooltip: { enabled: true }
                        },
                        scales: {
                            y: {
                                beginAtZero: true,
                                ticks: {
                                    stepSize: 1
                                }
                            }
                        }
                    }
                });
            }
            
            function createPieChart() {
                if (currentChart) {
                    currentChart.destroy();
                }
                
                currentChart = new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: labels,
                        datasets: [{
                            data: data,
                            backgroundColor: [
                                'rgba(149, 74, 112, 0.8)',
                                'rgba(209, 126, 166, 0.8)',
                                'rgba(125, 61, 94, 0.8)',
                                'rgba(192, 106, 148, 0.8)',
                                'rgba(170, 85, 127, 0.8)',
                                'rgba(149, 74, 112, 0.6)',
                                'rgba(209, 126, 166, 0.6)',
                                'rgba(125, 61, 94, 0.6)',
                                'rgba(192, 106, 148, 0.6)',
                                'rgba(170, 85, 127, 0.6)'
                            ],
                            borderColor: '#ffffff',
                            borderWidth: 2
                        }]
                    },
                    options: {
                        responsive: true,
                        plugins: {
                            legend: { 
                                display: true,
                                position: 'right'
                            },
                            tooltip: { enabled: true }
                        }
                    }
                });
            }
            
            // Initialize with bar chart
            createBarChart();
            
            // Chart type toggle buttons
            document.getElementById('barChartBtn').addEventListener('click', createBarChart);
            document.getElementById('pieChartBtn').addEventListener('click', createPieChart);
        });
    </script>
</body>
</html>