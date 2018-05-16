package com.tutorialq.repositories;


import com.tutorialq.entities.ClientDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public interface ClientDetailsRepository extends JpaRepository<ClientDetails, Long> {

}
