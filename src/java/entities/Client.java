/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.util.List;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.annotations.NamedNativeQuery;
import org.hibernate.annotations.NamedQuery;

/**
 *
 * @author Sara
 */
@Entity
@Table(name = "clients")

@NamedQuery(name = "findClientByEmail", query = "SELECT c FROM Client c WHERE c.email = :email")
@NamedNativeQuery(
        name = "Client.findClientsByNomCompetence",
        query = "SELECT u.id, u.nom, u.prenom, u.email, u.motDePasse, c.cin "
        + "FROM clients c "
        + "JOIN users u ON c.id = u.id "
        + "JOIN profilcompetences pc ON c.id = pc.client "
        + "JOIN competences comp ON pc.competence = comp.id "
        + "WHERE comp.nom = :nomCompetence",
        resultClass = Client.class
)

public class Client extends User {

    private String cin;

    @OneToMany(mappedBy = "client")
    private List<ProfilCompetence> profilCompetences;

    public Client() {
    }

    public Client(String cin, String nom, String prenom, String email, String motDePasse) {
        super(nom, prenom, email, motDePasse);
        this.cin = cin;
    }

    public String getCin() {
        return cin;
    }

    public void setCin(String cin) {
        this.cin = cin;
    }

    public List<ProfilCompetence> getProfilCompetences() {
        return profilCompetences;
    }

    public void setProfilCompetences(List<ProfilCompetence> profilCompetences) {
        this.profilCompetences = profilCompetences;
    }

}
