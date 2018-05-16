package com.tutorialq.repositories;

import com.tutorialq.entities.ImmigrationDetails;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

@Transactional(readOnly = true)
public interface ImmigrationDetailsRepository extends JpaRepository<ImmigrationDetails, Long> {

}
