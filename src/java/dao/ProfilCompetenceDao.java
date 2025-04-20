/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Competence;
import entities.ProfilCompetence;
import java.util.Date;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author Sara
 */
public class ProfilCompetenceDao extends AbstractDao<ProfilCompetence> {

    public ProfilCompetenceDao() {
        super(ProfilCompetence.class);
    }

    public List<ProfilCompetence> findCreatedBetween(Date start, Date end) {
        Session session = null;
        Transaction tx = null;
        List<ProfilCompetence> pc = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            pc = session.getNamedQuery("findCreatedBetween").setParameter("start", start).setParameter("end", end).list();
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
        return pc;
    }
}
