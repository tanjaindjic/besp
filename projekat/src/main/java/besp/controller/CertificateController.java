package besp.controller;

import java.security.Principal;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
//import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import besp.Model.Korisnik;
import besp.Model.Enums.Role;
import besp.certificate.CertificateDTO;
import besp.service.CertificateService;
import besp.service.KeyStoreService;
import besp.service.KorisnikService;


@RestController
@RequestMapping("/certificates")
public class CertificateController {

    @Autowired
    private CertificateService certificateService;

    @Autowired
    private KorisnikService korisnikService;

    @Autowired
    private KeyStoreService keyStoreService;

    @RequestMapping(method = RequestMethod.GET)
    public ResponseEntity<List<CertificateDTO>> getCerticatesAll() {
        List<CertificateDTO> certificateDTOS = keyStoreService.getCertificatesDTO();
        return new ResponseEntity<>(certificateDTOS, HttpStatus.OK);
    }

    @RequestMapping(method = RequestMethod.POST,
            consumes = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<CertificateDTO> genCertificate(@RequestBody CertificateDTO dto, Principal principal) {
        if (dto.getCaa() == 1) {
            dto.setIsCa(true);
        } else {
            dto.setIsCa(false);
        }
        if (dto.getisCa()) {
            Korisnik user = korisnikService.getKorisnik(principal.getName());
            if (user.getRole() != Role.ADMIN) {
                return new ResponseEntity<>(HttpStatus.UNAUTHORIZED);
            }
        }
        X509Certificate created = certificateService.generateCertificate(dto);
        if (created != null) {
            CertificateDTO creDto = new CertificateDTO(created);
            return new ResponseEntity<>(creDto, HttpStatus.CREATED);
        }
        return new ResponseEntity<>(HttpStatus.FORBIDDEN);
    }

    @RequestMapping(value = "/issuers", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<List<String>> getIssuers() {
        ArrayList<String> issuers = keyStoreService.getIssuers();
        return new ResponseEntity<>(issuers, HttpStatus.OK);
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ResponseEntity<CertificateDTO> getCertificate(@PathVariable String id) {
        CertificateDTO certDto = keyStoreService.getCertificateDTO(id);
        return new ResponseEntity<>(certDto, HttpStatus.OK);
    }

    @RequestMapping(value = "/check/{id}", method = RequestMethod.GET)
    public ResponseEntity<String> checkCertificate(@PathVariable String id) {
        String respond = certificateService.check(id);
        return new ResponseEntity<>(respond, HttpStatus.OK);
    }

    @RequestMapping(value = "/download/{id}", method = RequestMethod.GET)
    public ResponseEntity<String> download(@PathVariable String id) {
        String file = certificateService.download(id);
        if (file == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(file, HttpStatus.OK);
    }

   /* @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "/revoke/{id}", method = RequestMethod.GET)
    public ResponseEntity<CertificateDTO> revoke(@PathVariable String id) {
        certificateService.revoke(id);
        return new ResponseEntity<>(HttpStatus.OK);
    }

    @PreAuthorize("hasAuthority('ADMIN')")
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<CertificateDTO> delete(@PathVariable String id) {
        keyStoreService.delete(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }*/


}