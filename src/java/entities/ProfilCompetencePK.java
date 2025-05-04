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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Sara
 */
@Embeddable
public class ProfilCompetencePK implements Serializable {

    @Column(name = "client")
    private int client;

    @Column(name = "competence")
    private int competence;

    public ProfilCompetencePK() {
    }

    public ProfilCompetencePK(int client, int competence) {
        this.client = client;
        this.competence = competence;
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

}
