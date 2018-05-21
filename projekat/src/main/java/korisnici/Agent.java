package korisnici;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.OneToMany;

import Model.Rezervacija;
import Model.Smestaj;

@Entity
public class Agent extends Korisnik{
	
    private String firstName;

    private String lastName;
    
    private String email;
    
    private String poslovniMaticniBroj;

    @OneToMany
    private List<Smestaj> izdaje;
    
    @OneToMany
    private List<Rezervacija> rezervacije;
    
    public Agent(){ super(); }

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

	public String getPoslovniMaticniBroj() {
		return poslovniMaticniBroj;
	}

	public void setPoslovniMaticniBroj(String poslovniMaticniBroj) {
		this.poslovniMaticniBroj = poslovniMaticniBroj;
	}

	public List<Smestaj> getIzdaje() {
		return izdaje;
	}

	public void setIzdaje(List<Smestaj> izdaje) {
		this.izdaje = izdaje;
	}

	public List<Rezervacija> getRezervacije() {
		return rezervacije;
	}

	public void setRezervacije(List<Rezervacija> rezervacije) {
		this.rezervacije = rezervacije;
	}


}
