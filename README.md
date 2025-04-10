# **Projet : Gestion des Compétences** 🌟

## 📌 Table des matières
- [Contexte](#contexte)
- [Problématique](#problématique)
- [Objectifs](#objectifs)
- [Technologies Utilisées](#technologies-utilisées)
- [Diagramme de classe](#diagramme-de-classe)
- [Modèle conceptuel de la base de donnée](#modèle-conceptuel-de-la-base-de-donnée)
- [Exécution des tests](#exécution-des-tests)

---

## **Contexte** 🌐

Avec l’évolution rapide du marché de l’emploi et la transformation digitale des entreprises, la gestion des compétences devient un enjeu central. Les organisations cherchent à mieux identifier, valoriser et développer les compétences de leurs collaborateurs. De même, les individus souhaitent suivre l’évolution de leur parcours professionnel et mettre en avant leurs compétences clés.

Ce projet s’inscrit dans cette dynamique en proposant une plateforme numérique de gestion des compétences, destinée aux utilisateurs qui souhaitent suivre leurs compétences et aux administrateurs qui veulent avoir une vue d’ensemble sur les talents disponibles et les tendances.



---

## **Problématique** ❗️

La gestion des compétences est souvent confrontée à plusieurs problèmes :


- 🔍 **Manque de visibilité des compétences individuelles** : Les utilisateurs ont du mal à centraliser et suivre leurs compétences dans le temps.


- 📁 **Absence de structuration claire des données** : Les systèmes classiques ne permettent pas une classification efficace des compétences par catégories, rendant leur gestion complexe.

- 📊 **Difficulté à produire des statistiques pertinentes** : Il est souvent compliqué d’avoir une vision synthétique des compétences disponibles par catégorie ou par utilisateur.

---

## **Objectifs** 🎯

Ce projet vise à offrir une solution intuitive et performante pour répondre aux besoins précédemment évoqués, avec les objectifs suivants :

1. 🧑‍💻 **Permettre aux utilisateurs d’ajouter et gérer leurs compétences**  
   Interface simple pour ajouter une compétence avec son niveau, classée par catégorie.


2. 📌 **Afficher les compétences sous forme de tableau dynamique**  
   Avec possibilité de suppression et modification en temps réel via AJAX.


3. 📊 **Afficher des statistiques par catégorie**  
   Grâce à `Chart.js`, les utilisateurs peuvent visualiser quelles catégories sont les plus développées dans leur profil ou dans la base globale.

   
4. 🛠 **Permettre aux administrateurs de superviser les profils**  
   Un tableau de bord permet de visualiser les profils, les compétences ajoutées, les dates d’ajout, etc.


---

##  🛠 **Technologies Utilisées** 

- 💻 **Java Web**
- 🗃 **Base de données** : MySQL
- 📈 **Chart.js** pour les statistiques dynamiques
- ⚡ **AJAX** pour l'ajout/suppression en temps réel
- 🧩 **Hibernate** pour la persistance des données

---

## **Diagramme de classe** 🧩

![Diagramme de classe](./images/diagclasses.png)

---

## **Modèle conceptuel de la base de donnée** 🧠

![Modèle conceptuel](./images/conception.png)

---

## **Exécution des tests** 🧪
### 🛠️**Création de tables**
![Création de tables](./images/creation1.png)  
![Création de tables](./images/creation2.png)  
![Création de tables](./images/creation3.png)  
![Création de tables](./images/creation4.png)  

### 💾**Insertion de données**
![Insertion](./images/insertion1.png)
![Insertion](./images/insertion2.png)

### 🔍**Filtrage**
![Filtre](./images/filtrage1.png)
![Filtre](./images/filtrage2.png)

