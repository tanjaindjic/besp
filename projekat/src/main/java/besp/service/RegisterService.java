package besp.service;

import java.io.IOException;
import java.io.StringWriter;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletResponse;

import org.bouncycastle.openssl.jcajce.JcaPEMWriter;
import org.bouncycastle.operator.OperatorCreationException;
import org.bouncycastle.pkcs.PKCS10CertificationRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import besp.Model.Korisnik;

@Service
public class RegisterService {
	
	@Autowired 
	private CSRService csrService;
	
	public void redirect(HttpServletResponse response) throws IOException{
		response.sendRedirect("http://localhost:8096/register.html");
	}

	public void register(Korisnik k) throws NoSuchAlgorithmException, NoSuchProviderException, OperatorCreationException, IOException{

		PKCS10CertificationRequest req = csrService.createCSR(k.getEmail());
		StringWriter str = new StringWriter();
		JcaPEMWriter pemWriter =new JcaPEMWriter(str);
		pemWriter.writeObject(req);
		pemWriter.close();
		str.close();
		System.out.println(str);
		

	}

}
