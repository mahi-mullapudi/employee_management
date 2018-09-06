package com.tutorialq.repositories;

import com.tutorialq.entities.ImmigrationDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional(readOnly = true)
public interface ImmigrationDetailsRepository extends JpaRepository<ImmigrationDetails, Long> {

    /**
     * Returns the List of ImmigrationDetails for a given EmployeeId.
     *
     * @param employeeId
     * @return
     */
    List<ImmigrationDetails> findAllByEmployeeEmployeeId(long employeeId);

}
