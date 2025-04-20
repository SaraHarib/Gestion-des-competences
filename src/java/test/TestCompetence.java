/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import dao.CompetenceDao;
import entities.Competence;

/**
 *
 * @author Sara
 */
public class TestCompetence {

    public static void main(String[] args) {
        CompetenceDao cd = new CompetenceDao();
        for (Competence c : cd.findByNiveau("Avancé")) {
            System.out.println(c.getNiveau());
        }
    }

}
