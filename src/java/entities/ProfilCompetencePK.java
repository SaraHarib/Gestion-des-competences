/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author Sara
 */
@Embeddable
public class ProfilCompetencePK implements Serializable {

    @Column(name = "clientId")
    private int client;

    @Column(name = "competenceId")
    private int competence;

    @Column(name = "dateAjout")
    private Date dateAjout;

    public ProfilCompetencePK() {
    }

    public ProfilCompetencePK(int client, int competence, Date dateAjout) {
        this.client = client;
        this.competence = competence;
        this.dateAjout = dateAjout;
    }

    public int getClient() {
        return client;
    }

    public void setClient(int client) {
        this.client = client;
    }

    public int getCompetence() {
        return competence;
    }

    public void setCompetence(int competence) {
        this.competence = competence;
    }

    public Date getDateAjout() {
        return dateAjout;
    }

    public void setDateAjout(Date dateAjout) {
        this.dateAjout = dateAjout;
    }

}
