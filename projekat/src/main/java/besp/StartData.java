package besp;



import java.util.ArrayList;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import besp.Model.Korisnik;
import besp.Model.Enums.Role;
import besp.Model.Enums.StatusKorisnika;
import besp.repository.KorisnikRepository;
import besp.service.KeyStoreService;

@Component
public class StartData {
	
	@Autowired
	private KorisnikRepository korisnikRepo;
	
	@Autowired
	private KeyStoreService keyStoreService;
	

	 @PostConstruct
	 public void initIt(){
		 Korisnik k = new Korisnik();
		 BCryptPasswordEncoder bc = new BCryptPasswordEncoder();
		 
		 k.setUsername("admin");		
		 k.setPassword(bc.encode("admin"));
         k.setFirstName("Pera");
         k.setLastName("Peric");
         k.setAktiviran(true);
         k.setRole(Role.ADMIN);
         k.setStatusNaloga(StatusKorisnika.AKTIVAN);
         k.setAdresa("");
         k.setPIB("");
         k.setIzdaje(new ArrayList<>());
         k.setRezervacije(new ArrayList<>());
         korisnikRepo.save(k);
	 }
}
