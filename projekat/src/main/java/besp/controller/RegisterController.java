package besp.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

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
    public void login(){
    	System.out.println(registerService.register());
    }
}
