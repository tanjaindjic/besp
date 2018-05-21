package controller;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;

/*
import com.isa.ISA.dbModel.Encryption;
import com.isa.ISA.service.EncryptionService;
import org.springframework.security.crypto.encrypt.Encryptors;
import org.springframework.security.crypto.encrypt.TextEncryptor;
import org.springframework.security.crypto.keygen.KeyGenerators;*/
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import korisnici.Admin;
import korisnici.Korisnik;
import service.AdminService;
import service.RegKorService;
import service.RegisterService;

@RestController
public class RegisterController {

	@Autowired
	private RegKorService regKorService;
	@Autowired
	private AdminService adminService;


	private RegisterService registerService;

	@RequestMapping(method = RequestMethod.GET, value = "/register")
	public void redirect(HttpServletResponse response) throws IOException{
	    response.sendRedirect("http://localhost:8096/register.html");
	}
 
 	@RequestMapping(method = RequestMethod.POST, value = "/register")
    public void register() {
 		System.out.println("uso u registraciju");
    }

}
