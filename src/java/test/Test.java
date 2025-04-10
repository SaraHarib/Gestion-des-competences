/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import dao.CategorieDao;
import dao.ClientDao;
import dao.CompetenceDao;
import dao.ProfilCompetenceDao;
import entities.Categorie;
import entities.Client;
import entities.Competence;
import entities.ProfilCompetence;
import entities.ProfilCompetencePK;
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

        Client client = new Client("EE123456", "saraharib12@gmail.com", "123", "Harib", "Sara");
        clientDao.create(client);

        Categorie categorie = new Categorie("Soft Skills");
        categorieDao.create(categorie);

        Competence competence = new Competence();
        competence.setNom("Communication interpersonnelle");
        competence.setNiveau("Avancé");
        competence.setCategorie(categorie);
        competenceDao.create(competence);

        Date dateAjout = new Date();
        ProfilCompetencePK pk = new ProfilCompetencePK(client.getId(), competence.getId(), dateAjout);

        ProfilCompetence profilCompetence = new ProfilCompetence();
        profilCompetence.setpK(pk);
        profilCompetence.setClient(client);
        profilCompetence.setCompetence(competence);
        profilCompetence.setDateAjout(dateAjout);

        profilCompetenceDao.create(profilCompetence);
        System.out.println("ProfilCompetence enregistré avec succès !");

        Session session = HibernateUtil.getSessionFactory().openSession();

        String competenceNom = "Communication interpersonnelle";

        String hql1 = "SELECT DISTINCT pc.client FROM ProfilCompetence pc WHERE pc.competence.nom = :nom";
        Query query1 = session.createQuery(hql1);
        query1.setParameter("nom", competenceNom);

        List<Client> clients = query1.list();
        System.out.println("\nClients ayant la compétence : " + competenceNom);
        for (Client c : clients) {
            System.out.println("- " + c.getNom() + " " + c.getPrenom());
        }

        String cinCible = "EE123456";

        String hql2 = "SELECT DISTINCT pc.competence FROM ProfilCompetence pc WHERE pc.client.cin = :cin";
        Query query2 = session.createQuery(hql2);
        query2.setParameter("cin", cinCible);

        List<Competence> competences = query2.list();
        System.out.println("\nCompétences du client avec CIN " + cinCible + " :");
        for (Competence comp : competences) {
            System.out.println("- " + comp.getNom() + " (" + comp.getNiveau() + ")");
        }

        session.close();
        HibernateUtil.getSessionFactory().close();

    }
}
