package repository;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import Model.Korisnik;

public interface KorisnikRepository extends CrudRepository<Korisnik, Long>{
	Korisnik findByUsername(String username);
	Optional<Korisnik> findById(Long id);
	

}
