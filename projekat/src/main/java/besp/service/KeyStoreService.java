package besp.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.KeyStore;
import java.security.KeyStoreException;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.security.PrivateKey;
import java.security.UnrecoverableKeyException;
import java.security.cert.Certificate;
import java.security.cert.CertificateEncodingException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.List;
import java.util.Optional;

import org.bouncycastle.asn1.x500.X500Name;
import org.bouncycastle.cert.jcajce.JcaX509CertificateHolder;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Service;

import besp.certificate.CertificateDTO;
import besp.certificate.CertificateInfo;
import besp.certificate.IssuerData;

@Service
public class KeyStoreService{
  //  private static final String PATH_CA = "ksCa.jks";
	public static final Path rootLocation = Paths.get("src/main/resources/static/assets/");
	private static String PATH_CA = findKeyStoreName();
	private static String PASSWORD_CA = setPass();
    private KeyStore keyStore;
    private String keyStoreName = "";
    private String keyStorePassword = "";

    public KeyStoreService() {
        try {
            keyStore = KeyStore.getInstance("JKS", "SUN");
        } catch (KeyStoreException | NoSuchProviderException e) {
            e.printStackTrace();
        }
    }
    
    public static String setPass(){
    	return CertificateInfo.getInstance().getPass();
    }
    private static String findKeyStoreName(){
    	File folder = new File(rootLocation.toString());
    	String fileName = "";
		for (final File fileEntry : folder.listFiles()) {
	        if (fileEntry.toString().endsWith(".jks")) {
	        	return fileEntry.toString();
	        } 
	    }
		Path filePath = rootLocation.resolve(fileName);
		return filePath.toString();
    }
    public List<X509Certificate> getCertificates() {
        List<X509Certificate> certificates = new ArrayList<>();

        try {
            loadKeyStore(PATH_CA, PASSWORD_CA);
            Enumeration<String> aliases = keyStore.aliases();

            while (aliases.hasMoreElements()) {
                String alias = aliases.nextElement();

                if (keyStore.isKeyEntry(alias)) {
                    certificates.add(getCertificate(alias).get());
                }
            }
            

        } catch (Exception e) {
            e.printStackTrace();
        }

        return certificates;
    }

    public List<CertificateDTO> getCertificatesDTO() {
        List<X509Certificate> certificates = getCertificates();
        List<CertificateDTO> certificateDTOS = new ArrayList<>();
        for (Certificate cert : certificates) {
            certificateDTOS.add(new CertificateDTO(cert));
        }
        return certificateDTOS;
    }

    
    public Optional<X509Certificate> getCertificate(String alias) {
        try {
            loadKeyStore(PATH_CA, PASSWORD_CA);
            X509Certificate cert = (X509Certificate) keyStore.getCertificate(alias);
            return Optional.ofNullable(cert);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }


    
    public ArrayList<String> getCertficatesSN() {
        List<X509Certificate> certificates = getCertificates();
        ArrayList<String> serialNumbers = new ArrayList<>();
        for (X509Certificate cert : certificates) {
            serialNumbers.add(cert.getSerialNumber().toString());
        }
        return serialNumbers;
    }

    
    public CertificateDTO getCertificateDTO(String alias) {
        loadKeyStore(PATH_CA, PASSWORD_CA);
        try {
            X509Certificate cert = (X509Certificate) keyStore.getCertificate(alias);
            if (cert != null) {
                return new CertificateDTO(cert);
            }
        } catch (KeyStoreException e) {
            e.printStackTrace();
        }
        return null;
    }


    
    public void writeCertificate(boolean isCa, Certificate certificate, String alias, PrivateKey pk) {
    	PATH_CA = findKeyStoreName();
    	setPass();
        this.keyStoreName = PATH_CA;
        this.keyStorePassword = PASSWORD_CA;
        loadKeyStore(PATH_CA, PASSWORD_CA);        
        try {
            keyStore.setCertificateEntry(alias, certificate);
            keyStore.setKeyEntry(alias, pk, keyStorePassword.toCharArray(), new Certificate[]{certificate});
        } catch (KeyStoreException e) {
            e.printStackTrace();
        }
        saveKeyStore(keyStoreName, keyStorePassword.toCharArray());
    }

    
    public IssuerData readIssuerFromStore(String alias) {
        loadKeyStore(PATH_CA, PASSWORD_CA);
        try {
            Certificate cert = keyStore.getCertificate(alias);
            PrivateKey privKey = (PrivateKey) keyStore.getKey(alias, PASSWORD_CA.toCharArray());
            X500Name issuerName = new JcaX509CertificateHolder((X509Certificate) cert).getSubject();
            return new IssuerData(privKey, issuerName);
        } catch (KeyStoreException | UnrecoverableKeyException | CertificateEncodingException | NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        return null;
    }

    
    public ArrayList<String> getIssuers() {
        loadKeyStore(PATH_CA, PASSWORD_CA);
        ArrayList<String> issuers = null;
        try {
            Enumeration<String> aliases = keyStore.aliases();
            issuers = Collections.list(aliases);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return issuers;
    }

    
    public boolean saveKeyStore(String fileName, char[] password) {
        try {
            keyStore.store(new FileOutputStream(fileName), password);
            return true;
        } catch (KeyStoreException | CertificateException | NoSuchAlgorithmException | IOException e) {
            e.printStackTrace();
        }
        return false;
    }

    
    public void createKeyStores() {
        try {
            keyStore.load(null, PASSWORD_CA.toCharArray());
            saveKeyStore(PATH_CA, PASSWORD_CA.toCharArray());
        } catch (IOException e) {
            e.printStackTrace();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (CertificateException e) {
            e.printStackTrace();
        }
    }

    
    public void delete(String alias) {
        loadKeyStore(PATH_CA, PASSWORD_CA);
        try {
            ArrayList<String> aliases = Collections.list(keyStore.aliases());
            if (aliases.contains(alias)) {
                keyStore.deleteEntry(alias);
                    saveKeyStore(PATH_CA, PASSWORD_CA.toCharArray());                    
                return;
            }
        } catch (KeyStoreException e) {
            e.printStackTrace();
        }
    }

    
    public void deleteList(List<X509Certificate> certificates) {
        for (X509Certificate cert : certificates) {
            delete(cert.getSerialNumber().toString());
        }
    }


    
    public void loadKeyStore(String keyStoreFile, String keyStorePassword) {
        keyStoreFile = keyStoreFile;
        PASSWORD_CA = setPass();
        keyStorePassword = PASSWORD_CA;
        try {
            keyStore.load(new FileInputStream(keyStoreFile), keyStorePassword.toCharArray());
        } catch (IOException | NoSuchAlgorithmException | CertificateException e) {
            e.printStackTrace();
        }
    }


}

