package service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import korisnici.Agent;
import repository.AgentRepository;

@Service
public class AgentService {

	 @Autowired
	    private AgentRepository agentRepo;
	 
	 public List<Agent> getAllAgents(){
	        List<Agent> allAgents = new ArrayList<>();
	        agentRepo.findAll().forEach(allAgents::add);
	       // System.out.println(allAgents.size());
	        return allAgents;
	    }

	  

	    public void addAgent(Agent k){
	        agentRepo.save(k);
	    }

	    public Agent getAgent(String username){

	        return agentRepo.findByUsername(username);
	    }

	    public Agent getAgent(Long id){
	        return agentRepo.findById(id).get();
	    }

	    public void updateAgent(Agent a){
	        agentRepo.save(a);
	    }

	    public void updatePassword(Agent a){
	        agentRepo.save(a);
	    }

	    public Agent getAgentByEmail(String email){
	        return agentRepo.findByEmail(email);
	    }

	    public void deleteAgent(Agent a){
	        agentRepo.delete(a);
	    }

	 
}
