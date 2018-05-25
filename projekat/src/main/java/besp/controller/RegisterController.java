package besp.controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;

import javax.servlet.http.HttpServletResponse;

import org.bouncycastle.operator.OperatorCreationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import besp.Model.Korisnik;
import besp.service.RegisterService;

@RestController
public class RegisterController {

	@Autowired
	private RegisterService registerService;
	
	@RequestMapping(method = RequestMethod.GET, value = "/register")
    public void redirect(HttpServletResponse response) throws IOException{
		registerService.redirect(response);
    }
    @RequestMapping(method = RequestMethod.POST, value = "/register") 
    public void login(@RequestBody Korisnik k) throws NoSuchAlgorithmException, NoSuchProviderException, OperatorCreationException, IOException{
    	registerService.register(k);
    }
}
