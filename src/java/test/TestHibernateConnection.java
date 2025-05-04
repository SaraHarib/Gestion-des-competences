/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class TestHibernateConnection {
    public static void main(String[] args) {
        try {
            // Chargement de la configuration
            Configuration configuration = new Configuration().configure();
            SessionFactory sessionFactory = configuration.buildSessionFactory();

            // Ouverture de session
            Session session = sessionFactory.openSession();
            session.beginTransaction();

            System.out.println("✅ Connexion Hibernate réussie !");

            session.getTransaction().commit();
            session.close();
            sessionFactory.close();

        } catch (Exception e) {
            System.err.println("❌ Erreur de connexion Hibernate : " + e.getMessage());
            e.printStackTrace();
        }
    }
}
