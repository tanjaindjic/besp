package besp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import besp.Model.Korisnik;
import besp.service.KorisnikService;

@RestController
public class KorisnikController {
	
	@Autowired
	private KorisnikService korisnikService;
	
	@RequestMapping(method = RequestMethod.GET, value = "/user")
	public List<Korisnik> getKorisnici(){
		System.out.println("usao po sve korisnike: ");
		System.out.println(korisnikService.getAllKorisnik().size());
		return korisnikService.getAllKorisnik();
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/user/{id}")
	public Korisnik getKorisnikByID(@RequestBody Long id){
		return korisnikService.getKorisnik(id);
	}
	
	@RequestMapping(method = RequestMethod.GET, value = "/user/username/{id}")
	public Korisnik getKorisnikByUsername(@RequestBody String id){
		return korisnikService.getKorisnik(id);
	}
	
	@RequestMapping(method = RequestMethod.PUT, value = "/user")
	public void updateKorisnik(@RequestBody Korisnik k){
		 korisnikService.addKorisnik(k);
	}
	
	@RequestMapping(method = RequestMethod.DELETE, value = "/user")
	public void deleteKorisnik(@RequestBody Long id){
		 korisnikService.deleteKorisnik(id);
	}

}
