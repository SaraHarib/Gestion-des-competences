/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 *
 * @author Sara
 */
@Entity
@Table(name = "competences")
public class Competence {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String nom;
    private String niveau;

    @OneToMany(mappedBy = "competence")
    private List<ProfilCompetence> profilCompetences;

    @ManyToOne
    @JoinColumn(name = "categorieId")
    private Categorie categorie;

    public Competence() {
    }

    public Competence(String nom, String niveau, Categorie categorie) {
        this.nom = nom;
        this.niveau = niveau;
        this.categorie = categorie;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getNiveau() {
        return niveau;
    }

    public void setNiveau(String niveau) {
        this.niveau = niveau;
    }

    public Categorie getCategorie() {
        return categorie;
    }

    public void setCategorie(Categorie categorie) {
        this.categorie = categorie;
    }

    public List<ProfilCompetence> getProfilCompetences() {
        return profilCompetences;
    }

    public void setProfilCompetences(List<ProfilCompetence> profilCompetences) {
        this.profilCompetences = profilCompetences;
    }

}
