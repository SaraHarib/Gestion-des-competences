/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 *
 * @author Sara
 */
@Entity
@NamedQueries({
    @NamedQuery(name = "findCreatedBetween", query = "from ProfilCompetence where dateAjout between :start and :end")
})
@Table(name = "profilCompetences")
public class ProfilCompetence {

    @EmbeddedId
    private ProfilCompetencePK pK;

    @Temporal(TemporalType.DATE)
    @Column(insertable = false, updatable = false)
    private Date dateAjout;

    @ManyToOne
    @JoinColumn(name = "client", referencedColumnName = "id", insertable = false, updatable = false)
    private Client client;

    @ManyToOne
    @JoinColumn(name = "competence", referencedColumnName = "id", insertable = false, updatable = false)
    private Competence competence;

    public ProfilCompetence() {
    }

    public ProfilCompetence(ProfilCompetencePK pK, Date dateAjout, Client client, Competence competence) {
        this.pK = pK;
        this.dateAjout = dateAjout;
        this.client = client;
        this.competence = competence;
    }

    public ProfilCompetencePK getpK() {
        return pK;
    }

    public void setpK(ProfilCompetencePK pK) {
        this.pK = pK;
    }

    public Date getDateAjout() {
        return dateAjout;
    }

    public void setDateAjout(Date dateAjout) {
        this.dateAjout = dateAjout;
    }

    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
    }

    public Competence getCompetence() {
        return competence;
    }

    public void setCompetence(Competence competence) {
        this.competence = competence;
    }

}
