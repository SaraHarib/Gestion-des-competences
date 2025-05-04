/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package test;

import dao.CategorieDao;
import entities.Categorie;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Sara
 */
public class TestCategorie {

    public static void main(String[] args) {
        CategorieDao cd = new CategorieDao();

        int idRecherche = 1;

        Categorie cat = cd.findCategorieById(idRecherche);

        List<Categorie> categories = new ArrayList<>();
        if (cat != null) {
            categories.add(cat);
        } else {
            System.out.println("Aucune catégorie trouvée avec l'ID " + idRecherche);
        }

        for (Categorie c : categories) {
            System.out.println("Catégorie trouvée : " + c.getNom());
        }
    }
}
