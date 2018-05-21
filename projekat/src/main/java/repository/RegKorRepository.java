package repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import korisnici.RegKor;

public interface RegKorRepository extends CrudRepository<RegKor, Long>{
	RegKor findByUsernameIgnoreCase(String username);
	Optional<RegKor> findById(Long id);
	RegKor findByEmail(String email);
    List<RegKor> findByFirstNameIgnoreCase(String ime);
    List<RegKor> findByLastNameIgnoreCase(String prezime);
    List<RegKor> findByFirstNameAndLastNameIgnoreCase(String ime, String prezime);

}
