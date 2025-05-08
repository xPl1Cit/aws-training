package com.deloitte.andreas.repository;

import com.deloitte.andreas.entity.Greeting;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface GreetingRepository extends JpaRepository<Greeting, Integer> {
    Greeting findFirstByName(String name);
}
