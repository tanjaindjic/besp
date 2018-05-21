package service;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

@Service
public class LoginService {
	
	public void redirect(HttpServletResponse response) throws IOException{
		response.sendRedirect("http://localhost:8096/login.html");
	}

	public String login(){
		return "proba logina";
	}
}
