/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import dao.ProfilCompetenceDao;
import entities.ProfilCompetence;
import java.util.Date;

/**
 *
 * @author Sara
 */
public class TestDate {

    public static void main(String[] args) {
        ProfilCompetenceDao pcd = new ProfilCompetenceDao();
        for (ProfilCompetence pc : pcd.findCreatedBetween(new Date("2025/04/01"), new Date("2025/04/31"))) {
            System.out.println(pc.getDateAjout() + ", " + pc.getCompetence().getNom() + " ," + pc.getClient().getNom());
        }
    }

}
