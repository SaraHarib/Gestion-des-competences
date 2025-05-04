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

    public List<Competence> getAllCompetences() {
        Session session = null;
        Transaction tx = null;
        List<Competence> competences = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            competences = session.getNamedQuery("Competence.findAll").list();
            tx.commit();
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
        return competences;
    }

    public List<Object[]> countByCategorie() {
        Session session = null;
        Transaction tx = null;
        List<Object[]> stats = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            stats = session.getNamedQuery("Competence.countByCategorie").list();
            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) {
                tx.rollback();
            }
            throw e;
        } finally {
            if (session != null) {
                session.close();
            }
        }
        return stats;
    }

}
