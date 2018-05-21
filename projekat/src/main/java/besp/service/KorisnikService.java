package besp.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import besp.Model.Korisnik;
import besp.repository.KorisnikRepository;

@Service
public class KorisnikService {
	
	@Autowired
	private KorisnikRepository korisnikRepo;
	
	public List<Korisnik> getAllKorisnik(){
        List<Korisnik> allKorisnik = new ArrayList<>();
        korisnikRepo.findAll().forEach(allKorisnik::add);
       // System.out.println(allKorisniks.size());
        return allKorisnik;
    }
	
	public void addKorisnik(Korisnik k){
        korisnikRepo.save(k);
    }

    public Korisnik getKorisnik(String username){

        return korisnikRepo.findByUsername(username);
    }

    public Korisnik getKorisnik(Long id){
        return korisnikRepo.findById(id).get();
    }

    public void updateKorisnik(Korisnik a){
        korisnikRepo.save(a);
    }

    public void updatePassword(Korisnik a){
        korisnikRepo.save(a);
    }

    public void deleteKorisnik(Long id){
    	Korisnik a = korisnikRepo.findById(id).get();
        korisnikRepo.delete(a);
    }


}
