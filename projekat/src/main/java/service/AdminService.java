package service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import korisnici.Admin;
import repository.AdminRepository;

@Service
public class AdminService {
	 @Autowired
	    private AdminRepository adminRepo;
	 
	 public List<Admin> getAllAdmins(){
	        List<Admin> allAdmins = new ArrayList<>();
	        adminRepo.findAll().forEach(allAdmins::add);
	       // System.out.println(allAdmins.size());
	        return allAdmins;
	    }

	  

	    public void addAdmin(Admin k){
	        adminRepo.save(k);
	    }

	    public Admin getAdmin(String username){

	        return adminRepo.findByUsername(username);
	    }

	    public Admin getAdmin(Long id){
	        return adminRepo.findById(id).get();
	    }

	    public void updateAdmin(Admin a){
	        adminRepo.save(a);
	    }

	    public void updatePassword(Admin a){
	        adminRepo.save(a);
	    }

	    public Admin getAdminByEmail(String email){
	        return adminRepo.findByEmail(email);
	    }

	    public void deleteAdmin(Admin a){
	        adminRepo.delete(a);
	    }


}
