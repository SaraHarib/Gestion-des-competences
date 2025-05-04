package entities;

import java.util.Date;
import javax.persistence.*;

@Entity
@NamedQueries({
    @NamedQuery(
        name = "ProfilCompetence.findByClient",
        query = "SELECT pc FROM ProfilCompetence pc WHERE pc.client.id = :idClient"
    ),
    @NamedQuery(
        name = "findCreatedBetween",
        query = "FROM ProfilCompetence pc WHERE pc.dateAjout BETWEEN :start AND :end"
    )
})
@Table(name = "profilCompetences")
public class ProfilCompetence {

    @EmbeddedId
    private ProfilCompetencePK pK;

    @Temporal(TemporalType.DATE)
    @Column(name = "dateAjout") // ✅ autorise l'insertion et la mise à jour
    private Date dateAjout;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "client", referencedColumnName = "id", insertable = false, updatable = false)
    private Client client;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "competence", referencedColumnName = "id", insertable = false, updatable = false)
    private Competence competence;

    // 🔧 Constructeurs
    public ProfilCompetence() {}

    public ProfilCompetence(ProfilCompetencePK pK, Date dateAjout, Client client, Competence competence) {
        this.pK = pK;
        this.dateAjout = dateAjout;
        this.client = client;
        this.competence = competence;
    }

    // 🔧 Getters et setters
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
