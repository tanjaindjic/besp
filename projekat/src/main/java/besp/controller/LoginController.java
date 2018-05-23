package besp.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import besp.Model.Korisnik;
import besp.dto.KorisnikDTO;
import besp.service.LoginService;

@RestController
public class LoginController {
	
	@Autowired
	private LoginService loginService;
	
	@RequestMapping(method = RequestMethod.GET, value = "/login")
    public void redirect(HttpServletResponse response) throws IOException{
		System.out.println("uso u kontroler");
        loginService.redirect(response);
    }
	
    @RequestMapping(method = RequestMethod.POST, value = "/login") 
    public Korisnik login(@RequestBody KorisnikDTO korisnik){
    	return loginService.login(korisnik);
    }

}
