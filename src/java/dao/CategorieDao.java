/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.Categorie;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author Sara
 */
public class CategorieDao extends AbstractDao<Categorie> {

    public CategorieDao() {
        super(Categorie.class);
    }

    public Categorie findCategorieById(int id) {
        Session session = null;
        Transaction tx = null;
        Categorie cat = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();
            cat = (Categorie) session
                    .getNamedQuery("Categorie.findCategorieById")
                    .setParameter("id", id)
                    .uniqueResult();
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
        return cat;
    }

    
}
