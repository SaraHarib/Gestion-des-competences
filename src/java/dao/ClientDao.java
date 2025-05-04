/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Client;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author Sara
 */
public class ClientDao extends AbstractDao<Client> {

    public ClientDao() {
        super(Client.class);
    }

    public List<Client> findClientsByNomCompetence(String nomCompetence) {
        Session session = null;
        Transaction tx = null;
        List<Client> clients = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            clients = session.getNamedQuery("Client.findClientsByNomCompetence")
                    .setParameter("nomCompetence", nomCompetence)
                    .list();
            tx.commit();
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return clients;
    }

    public Client findClientByEmail(String email) {
        Session session = null;
        Transaction tx = null;
        Client client = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            System.out.println("Recherche client avec email : " + email);
            client = (Client) session.getNamedQuery("findClientByEmail").setParameter("email", email).uniqueResult();
            tx.commit();

            if (client != null) {
                System.out.println("Client trouvé : " + client.getEmail());
            } else {
                System.out.println("Aucun client trouvé avec l'email : " + email);
            }
        } catch (HibernateException ex) {
            if (tx != null) {
                tx.rollback();
            }
            ex.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return client;
    }

}
