package Model;

import Model.Enums.StatusRezevacije;

import javax.persistence.*;
import java.util.Date;

@Entity
public class Rezervacija {

    @Id
    @GeneratedValue
    private Long id;

    @Enumerated(EnumType.STRING)
    private StatusRezevacije status;

    @ManyToOne
    private Korisnik rezervisao;

    private int ocena;

    private Date datumOd;

    private Date datumDo;

    public Rezervacija() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public StatusRezevacije getStatus() {
        return status;
    }

    public void setStatus(StatusRezevacije status) {
        this.status = status;
    }

    public Korisnik getRezervisao() {
        return rezervisao;
    }

    public void setRezervisao(Korisnik rezervisao) {
        this.rezervisao = rezervisao;
    }

    public int getOcena() {
        return ocena;
    }

    public void setOcena(int ocena) {
        this.ocena = ocena;
    }

    public Date getDatumOd() {
        return datumOd;
    }

    public void setDatumOd(Date datumOd) {
        this.datumOd = datumOd;
    }

    public Date getDatumDo() {
        return datumDo;
    }

    public void setDatumDo(Date datumDo) {
        this.datumDo = datumDo;
    }
}
