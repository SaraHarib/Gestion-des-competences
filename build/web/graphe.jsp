<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
if (session.getAttribute("admin") == null) {
    response.sendRedirect("Authentification.jsp");
    return;
}
%>
<!DOCTYPE html>
<html lang="fr">
<head>
<meta charset="UTF-8">
<title>Statistiques | SkillBoard</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap + Chart.js -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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

    /* Chart Container */
    .chart-container {
        background: white;
        border-radius: 15px;
        box-shadow: var(--card-shadow);
        padding: 30px;
        margin-bottom: 30px;
        transition: var(--transition);
        position: relative;
        overflow: hidden;
        animation: fadeIn 0.5s ease forwards;
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
        background: linear-gradient(to bottom, var(--secondary), var(--secondary-light));
    }
    
    .chart-header {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 25px;
    }
    
    .chart-title {
        font-size: 1.5rem;
        font-weight: 600;
        color: var(--primary);
        margin: 0;
        padding-left: 15px;
        position: relative;
    }
    
    .chart-actions {
        display: flex;
        gap: 10px;
    }
    
    .chart-btn {
        background-color: rgba(52, 152, 219, 0.1);
        color: var(--accent);
        border: none;
        border-radius: 8px;
        padding: 8px 15px;
        font-size: 0.9rem;
        cursor: pointer;
        transition: var(--transition);
        display: flex;
        align-items: center;
    }
    
    .chart-btn:hover {
        background-color: var(--accent);
        color: white;
    }
    
    .chart-btn i {
        margin-right: 8px;
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
    }
    
    /* Animation */
    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(20px); }
        to { opacity: 1; transform: translateY(0); }
    }
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
            <a href="users.jsp" class="sidebar-link">
                <i class="fas fa-users"></i>
                <span>Clients</span>
            </a>
            <a href="graphe.jsp" class="sidebar-link active">
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
        <h1 class="page-title">Statistiques</h1>
    </div>
    
    <div class="chart-container">
        <div class="chart-header">
            <h2 class="chart-title">Compétences par catégorie</h2>
            <div class="chart-actions">
                <button class="chart-btn" id="barChartBtn">
                    <i class="fas fa-chart-bar"></i> Barres
                </button>
                <button class="chart-btn" id="pieChartBtn">
                    <i class="fas fa-chart-pie"></i> Camembert
                </button>
            </div>
        </div>
        <canvas id="competenceChart"></canvas>
    </div>
</div>

<script>
    document.addEventListener('DOMContentLoaded', () => {
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
        
        // Chart initialization
        let currentChart = null;
        let chartData = null;
        
        fetch('CompetenceCategorieStatController')
            .then(res => res.json())
            .then(data => {
                chartData = data;
                const labels = data.map(item => item.categorie);
                const counts = data.map(item => item.competenceCount);

                const colors = [
                    'rgba(231, 76, 60, 0.7)',
                    'rgba(52, 152, 219, 0.7)',
                    'rgba(46, 204, 113, 0.7)',
                    'rgba(155, 89, 182, 0.7)',
                    'rgba(241, 196, 15, 0.7)',
                    'rgba(52, 73, 94, 0.7)',
                    'rgba(230, 126, 34, 0.7)',
                    'rgba(26, 188, 156, 0.7)'
                ];

                createBarChart(labels, counts, colors);
                
                // Chart type toggle buttons
                document.getElementById('barChartBtn').addEventListener('click', () => {
                    createBarChart(labels, counts, colors);
                });
                
                document.getElementById('pieChartBtn').addEventListener('click', () => {
                    createPieChart(labels, counts, colors);
                });
            })
            .catch(err => {
                document.getElementById('competenceChart').outerHTML =
                    `<div class="alert alert-danger text-center mt-5">
                        <i class="fas fa-exclamation-triangle me-2"></i>
                        <strong>Erreur lors du chargement des données :</strong> ${err}
                    </div>`;
            });
            
        function createBarChart(labels, counts, colors) {
            if (currentChart) {
                currentChart.destroy();
            }
            
            currentChart = new Chart(document.getElementById('competenceChart'), {
                type: 'bar',
                data: {
                    labels: labels,
                    datasets: [{
                        label: 'Nombre de compétences',
                        data: counts,
                        backgroundColor: colors,
                        borderColor: colors.map(c => c.replace('0.7', '1')),
                        borderWidth: 1,
                        borderRadius: 5
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true,
                            title: {
                                display: true,
                                text: "Compétences",
                                font: { size: 14, weight: '500' }
                            },
                            ticks: {
                                font: { size: 12 }
                            }
                        },
                        x: {
                            title: {
                                display: true,
                                text: "Catégories",
                                font: { size: 14, weight: '500' }
                            },
                            ticks: {
                                font: { size: 12 }
                            }
                        }
                    },
                    plugins: {
                        legend: {
                            display: true,
                            position: 'top',
                            labels: {
                                font: { size: 12, weight: '500' }
                            }
                        },
                        tooltip: {
                            callbacks: {
                                label: context => `${context.parsed.y} compétence(s)`
                            }
                        }
                    }
                }
            });
        }
        
        function createPieChart(labels, counts, colors) {
            if (currentChart) {
                currentChart.destroy();
            }
            
            currentChart = new Chart(document.getElementById('competenceChart'), {
                type: 'pie',
                data: {
                    labels: labels,
                    datasets: [{
                        data: counts,
                        backgroundColor: colors,
                        borderColor: colors.map(c => c.replace('0.7', '1')),
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    plugins: {
                        legend: {
                            display: true,
                            position: 'right',
                            labels: {
                                font: { size: 12, weight: '500' }
                            }
                        },
                        tooltip: {
                            callbacks: {
                                label: context => `${context.parsed} compétence(s)`
                            }
                        }
                    }
                }
            });
        }
    });
</script>
</body>
</html>