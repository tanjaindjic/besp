package repository;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import korisnici.Agent;

public interface AgentRepository extends CrudRepository<Agent, Long>{
	Agent findByUsername(String username);
	Optional<Agent> findById(Long id);
	Agent findByEmail(String email);

}
