package korisnici;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.OneToMany;

import Model.Rezervacija;
import Model.Smestaj;

@Entity
public class RegKor extends Korisnik {
	
    private String firstName;

    private String lastName;

    private String email;

    private String adresa;
    
    @OneToMany
    private List<Rezervacija> rezervacije;
    
    public RegKor(){ super(); }

	public List<Rezervacija> getRezervacije() {
		return rezervacije;
	}

	public void setRezervacije(List<Rezervacija> rezervacije) {
		this.rezervacije = rezervacije;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAdresa() {
		return adresa;
	}

	public void setAdresa(String adresa) {
		this.adresa = adresa;
	}



}
