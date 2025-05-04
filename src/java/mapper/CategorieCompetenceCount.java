/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mapper;

/**
 *
 * @author Sara
 */
public class CategorieCompetenceCount {

    private String categorie;
    private long competenceCount;

    public CategorieCompetenceCount(String categorie, long competenceCount) {
        this.categorie = categorie;
        this.competenceCount = competenceCount;
    }

    public String getCategorie() {
        return categorie;
    }

    public long getCompetenceCount() {
        return competenceCount;
    }
}
