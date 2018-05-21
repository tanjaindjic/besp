package repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import korisnici.Admin;
import korisnici.Korisnik;

public interface AdminRepository extends CrudRepository<Admin, Long> {
	Admin findByUsername(String username);
	Optional<Admin> findById(Long id);
	Admin findByEmail(String email);

}
