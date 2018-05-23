package besp.service;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import besp.Model.Korisnik;
import besp.dto.KorisnikDTO;

@Service
public class LoginService {
	
	@Autowired
	private KorisnikService korisnikService;
	
	public void redirect(HttpServletResponse response) throws IOException{
		response.sendRedirect("http://localhost:8096/login.html");
	}

	public Korisnik login(KorisnikDTO korisnik){
	
		Korisnik k =  korisnikService.getKorisnik(korisnik.getUsername());
		if(k==null)
			return null;
		BCryptPasswordEncoder bc = new BCryptPasswordEncoder();

		if( bc.matches(korisnik.getPassword(), k.getPassword()) )
			return k;
		else return null;
		
	}
}
