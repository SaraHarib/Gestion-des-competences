/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import dao.AdminDao;
import dao.CategorieDao;
import dao.ClientDao;
import dao.CompetenceDao;
import dao.ProfilCompetenceDao;
import dao.UserDao;
import entities.Admin;
import entities.Categorie;
import entities.Client;
import entities.Competence;
import entities.ProfilCompetence;
import entities.ProfilCompetencePK;
import entities.User;
import java.util.Date;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import util.HibernateUtil;

/**
 *
 * @author Sara
 */
public class Test {

    public static void main(String[] args) {
        //HibernateUtil.getSessionFactory();
        ClientDao clientDao = new ClientDao();
        CategorieDao categorieDao = new CategorieDao();
        CompetenceDao competenceDao = new CompetenceDao();
        ProfilCompetenceDao profilCompetenceDao = new ProfilCompetenceDao();
        AdminDao ad = new AdminDao();
        UserDao ud = new UserDao();
        ClientDao client = new ClientDao();

        clientDao.create(new Client("EE123456", "Harib", "Sara", "saraharib12@gmail.com", "123"));
        Categorie categorie = new Categorie("Soft Skills");
        categorieDao.create(categorie);

        Competence competence = new Competence();
        competence.setNom("Communication interpersonnelle");
        competence.setNiveau("Avancé");
        competence.setCategorie(categorie);
        competenceDao.create(competence);

        try {
            Client c = clientDao.findById(1);
            Competence cm = competenceDao.findById(1);

            if (c == null || cm == null) {
                System.out.println("Client ou compétence introuvable !");
                return;
            }

            Date dateAjout = new Date();
            ProfilCompetencePK pk = new ProfilCompetencePK(c.getId(), cm.getId());

            ProfilCompetence profilCompetence = new ProfilCompetence();
            profilCompetence.setpK(pk);
            profilCompetence.setClient(c);
            profilCompetence.setCompetence(cm);
            profilCompetence.setDateAjout(dateAjout);

            profilCompetenceDao.create(profilCompetence);
            System.out.println("ProfilCompetence enregistré avec succès !");
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Erreur lors de l'enregistrement du profil compétence !");
        }

        ad.create(new Admin("R123", "Rami", "Mohamed", "rami@gmail.com", "rami123"));
        ad.create(new Admin("S123", "Safi", "Amal", "safi@gmail.com", "safi123"));

        Admin a = ad.findById(3);
        if (a != null) {
            a.setEmail("amal123@gmail.com");
            ad.update(a);
            System.out.println("Admin mis à jour !");
        } else {
            System.out.println("Admin avec ID 3 non trouvé.");
        }

        Admin adminToDelete = ad.findById(4);
        if (adminToDelete != null) {
            ad.delete(adminToDelete);
            System.out.println("Admin supprimé !");
        } else {
            System.out.println("Admin avec ID 4 non trouvé.");
        }

        User u = ud.findById(1);
        if (u != null) {
            u.setMotDePasse("sara123");
            ud.update(u);
            System.out.println("Utilisateur mis à jour !");
        } else {
            System.out.println("Utilisateur avec ID 1 non trouvé.");
        }
        User userToDelete = ud.findById(10);
        if (userToDelete != null) {
            ud.delete(userToDelete);
            System.out.println("Utilisateur supprimé !");
        } else {
            System.out.println("Utilisateur avec ID 10 non trouvé.");
        }
    }
}
