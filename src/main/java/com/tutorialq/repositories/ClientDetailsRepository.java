package com.tutorialq.repositories;


import com.tutorialq.entities.ClientDetails;
import org.springframework.data.repository.CrudRepository;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public interface ClientDetailsRepository extends CrudRepository<ClientDetails, Long> {

}
