package controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import service.LoginService;

@RestController
public class LoginController {	

    @Autowired
    private LoginService loginService;
	
    @RequestMapping(method = RequestMethod.GET, value = "/login")
    public void redirect(HttpServletResponse response) throws IOException{
        response.sendRedirect("http://localhost:8096/login.html");
    }
    @RequestMapping(method = RequestMethod.POST, value = "/login") 
    public void login(){
    	System.out.println("proba logina");
    }
    

}