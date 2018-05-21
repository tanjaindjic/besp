package service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import korisnici.RegKor;
import repository.RegKorRepository;

@Service
public class RegKorService {
	
	@Autowired
	private RegKorRepository regKorRepo;
	
	public List<RegKor> getAllRegKors(){
        List<RegKor> allRegKors = new ArrayList<>();
        regKorRepo.findAll().forEach(allRegKors::add);
       // System.out.println(allRegKors.size());
        return allRegKors;
    }

  

    public void addRegKor(RegKor k){
        regKorRepo.save(k);
    }

    public RegKor getRegKor(String username){

        return regKorRepo.findByUsernameIgnoreCase(username);
    }

    public RegKor getRegKor(Long id){
        return regKorRepo.findById(id).get();
    }

    public void updateRegKor(RegKor a){
        regKorRepo.save(a);
    }

    public void updatePassword(RegKor a){
        regKorRepo.save(a);
    }

    public RegKor getRegKorByEmail(String email){
        return regKorRepo.findByEmail(email);
    }

    public void deleteRegKor(RegKor a){
        regKorRepo.delete(a);
    }


}
