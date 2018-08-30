package com.doraemon.cloud.bpm;

import org.activiti.spring.boot.SecurityAutoConfiguration;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.liquibase.LiquibaseAutoConfiguration;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;

@SpringBootApplication(exclude ={SecurityAutoConfiguration.class,LiquibaseAutoConfiguration.class})
@EnableEurekaClient
@ServletComponentScan
public class BpmServiceApplication {

    public static void main(String[] args) {
        SpringApplication.run(BpmServiceApplication.class, args);
    }
}
