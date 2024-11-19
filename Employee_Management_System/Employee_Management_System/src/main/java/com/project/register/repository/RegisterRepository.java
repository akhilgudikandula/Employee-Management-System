package com.project.register.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.project.register.model.RegisterModel;

@Repository
public interface RegisterRepository extends JpaRepository<RegisterModel,Long>{
	
	@Query("select r.userName from RegisterModel r where r.userName = ?1")
	 Optional<String> findByUserName( String userName);
	
	@Query("select r.email from RegisterModel r where r.email=?1")
	Optional<String> findByEmail(String email);
	
}