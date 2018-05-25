package besp.service;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import besp.Model.Korisnik;

@Service
public class RegisterService {
	
	public void redirect(HttpServletResponse response) throws IOException{
		response.sendRedirect("http://localhost:8096/register.html");
	}

	public String register(Korisnik k){
		return null;
	}

}
