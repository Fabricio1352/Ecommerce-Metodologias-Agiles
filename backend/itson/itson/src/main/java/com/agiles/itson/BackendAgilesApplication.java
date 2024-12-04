package com.agiles.itson;

import org.springframework.amqp.rabbit.annotation.EnableRabbit;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
@EnableRabbit
@EnableJpaRepositories(basePackages = "com.agiles.itson.repository")
@EntityScan(basePackages = "com.agiles.itson.model")
public class BackendAgilesApplication {

	public static void main(String[] args) {
		SpringApplication.run(BackendAgilesApplication.class, args);
	}

}
