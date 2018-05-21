package besp;



import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import besp.Model.Korisnik;
import besp.Model.Enums.Role;
import besp.Model.Enums.StatusKorisnika;
import besp.repository.KorisnikRepository;

@Component
public class StartData {
	
	@Autowired
	private KorisnikRepository korisnikRepo;
	

	 @PostConstruct
	 public void initIt(){
		 Korisnik k = new Korisnik();
		 k.setUsername("admin");		
		 k.setPassword("admin");
         k.setFirstName("Pera");
         k.setLastName("Peric");
         k.setAktiviran(true);
         k.setRole(Role.ADMIN);
         k.setStatusNaloga(StatusKorisnika.AKTIVAN);
         k.setAdresa("");
         k.setPIB("");
         k.setIzdaje(new ArrayList<>());
         k.setRezervacije(new ArrayList<>());
         //korisnikRepo.save(k);
         System.out.println("dodao admira");
	 }
}
