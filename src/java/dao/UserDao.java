/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import entities.User;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

/**
 *
 * @author Sara
 */
public class UserDao extends AbstractDao<User> {

    public UserDao() {
        super(User.class);
    }

    public User findUserByEmail(String email) {
        Session session = null;
        Transaction tx = null;
        User user = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();

            user = (User) session
                    .getNamedQuery("User.findByEmail")
                    .setParameter("email", email)
                    .uniqueResult();

            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
        } finally {
            if (session != null) {
                session.close();
            }
        }

        return user;
    }
}
