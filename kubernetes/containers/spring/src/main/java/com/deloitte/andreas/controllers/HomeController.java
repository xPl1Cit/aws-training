package com.deloitte.andreas.controllers;

import com.deloitte.andreas.entity.Greeting;
import com.deloitte.andreas.repository.GreetingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/home")
public class HomeController {

    @Autowired
    private GreetingRepository repository;

    @GetMapping()
    public String showHome(String name) {
        Greeting testGreeting = new Greeting(name);
        repository.saveAndFlush(testGreeting);
        return "Hey " + repository.findFirstByName(testGreeting.getName()).getName() + ", welcome to my project!";
    }

}
