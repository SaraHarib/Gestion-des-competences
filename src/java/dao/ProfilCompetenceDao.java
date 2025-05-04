package dao;

import entities.ProfilCompetence;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import util.HibernateUtil;

import java.util.Date;
import java.util.List;

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

            pc = session.getNamedQuery("findCreatedBetween")
                        .setParameter("start", start)
                        .setParameter("end", end)
                        .list();

            tx.commit();
        } catch (HibernateException e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }

        return pc;
    }

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
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }

        return profilCompetences;
    }

    public boolean isCompetenceAvailable(int competenceId, int clientId, Date dateDebut, Date dateFin) {
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();

            Long count = (Long) session.createQuery(
                    "SELECT COUNT(pc) FROM ProfilCompetence pc " +
                    "WHERE pc.competence.id = :competenceId " +
                    "AND pc.client.id = :clientId " +
                    "AND NOT (pc.dateAjout < :dateDebut OR pc.dateAjout > :dateFin)")
                    .setParameter("competenceId", competenceId)
                    .setParameter("clientId", clientId)
                    .setParameter("dateDebut", dateDebut)
                    .setParameter("dateFin", dateFin)
                    .uniqueResult();

            return count == 0;
        } finally {
            if (session != null) session.close();
        }
    }

    public List<Object[]> countProfilCompetenceByNiveau() {
        Session session = null;
        Transaction tx = null;
        List<Object[]> results = null;

        try {
            session = HibernateUtil.getSessionFactory().openSession();
            tx = session.beginTransaction();

            String hql = "SELECT c.niveau, COUNT(pc) " +
                         "FROM ProfilCompetence pc JOIN pc.competence c " +
                         "GROUP BY c.niveau";

            @SuppressWarnings("unchecked")
            List<Object[]> queryResults = session.createQuery(hql).list();
            results = queryResults;

            tx.commit();
        } catch (Exception e) {
            if (tx != null) tx.rollback();
            e.printStackTrace();
        } finally {
            if (session != null) session.close();
        }

        return results;
    }
    
    public void deleteByClientId(int clientId) {
    Session session = HibernateUtil.getSessionFactory().openSession();
    Transaction tx = session.beginTransaction();

    session.createQuery("DELETE FROM ProfilCompetence pc WHERE pc.client.id = :clientId")
           .setParameter("clientId", clientId)
           .executeUpdate();

    tx.commit();
    session.close();
}
    public boolean exists(int clientId, int competenceId) {
    Session session = null;
    try {
        session = HibernateUtil.getSessionFactory().openSession();

        Long count = (Long) session.createQuery(
            "SELECT COUNT(pc) FROM ProfilCompetence pc " +
            "WHERE pc.client.id = :clientId AND pc.competence.id = :competenceId")
            .setParameter("clientId", clientId)
            .setParameter("competenceId", competenceId)
            .uniqueResult();

        return count > 0;
    } catch (Exception e) {
        e.printStackTrace();
        return true; // Par sécurité
    } finally {
        if (session != null) session.close();
    }
}
public List<Object[]> countByCategorieForClient(int clientId) {
    Session session = null;
    Transaction tx = null;
    List<Object[]> results = null;

    try {
        session = HibernateUtil.getSessionFactory().openSession();
        tx = session.beginTransaction();

        String hql = "SELECT c.nom, COUNT(pc) " +
                     "FROM ProfilCompetence pc " +
                     "JOIN pc.competence cpt " +
                     "JOIN cpt.categorie c " +
                     "WHERE pc.client.id = :clientId " +
                     "GROUP BY c.nom";

        results = session.createQuery(hql).setParameter("clientId", clientId).list();
        tx.commit();
    } catch (Exception e) {
        if (tx != null) tx.rollback();
        e.printStackTrace();
    } finally {
        if (session != null) session.close();
    }

    return results;
}

}
