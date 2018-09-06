package com.tutorialq.repositories;


import com.tutorialq.entities.ClientDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
public interface ClientDetailsRepository extends JpaRepository<ClientDetails, Long> {
    /**
     * Returns the list of ClientDetails for a given EmployeeId.
     *
     * @param employeeId
     * @return
     */
    List<ClientDetails> findAllByEmployeeEmployeeIdOrderByCreatedAtDesc(long employeeId);
}
