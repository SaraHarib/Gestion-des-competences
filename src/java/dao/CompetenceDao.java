/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Competence;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author Sara
 */
public class CompetenceDao extends AbstractDao<Competence> {

    public CompetenceDao() {
        super(Competence.class);
    }

    public List<Competence> findByNiveau(String niveau) {
        Session session = null;
        Transaction tx = null;
        List<Competence> competences = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            competences = session.getNamedQuery("Competence.findByNiveau").setParameter("niveau", niveau).list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return competences;
    }

}
