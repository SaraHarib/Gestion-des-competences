/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package services;

import entities.ProfilCompetence;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author Sara
 */
public class ProfilCompetenceService {
    

    public List<ProfilCompetence> getProfilCompetencesByClient(int idClient) {
        Session session = null;
        Transaction tx = null;
        List<ProfilCompetence> profilCompetences = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            profilCompetences = session.getNamedQuery("ProfilCompetence.findByClient")
                    .setParameter("idClient", idClient)
                    .list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return profilCompetences;
    }

}
