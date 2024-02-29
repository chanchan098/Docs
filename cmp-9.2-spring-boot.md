# Spring Boot – Transaction Management Using @Transactional Annotation

<https://www.geeksforgeeks.org/spring-boot-transaction-management-using-transactional-annotation/>

a transaction is a sequence of actions performed by the application that together pipelined to perform a single operation.

## @Transactional Annotation

If the transaction becomes successful then the changes made to the database are committed, if any transaction fails, all the changes made to that particular transaction can be rollback and it will ensure that the database remains in a consistent state.

# 4. Getting Started

## 1. Introducing Spring Boot

Spring Boot helps you to create stand-alone, production-grade Spring-based applications that you can run.

## 3.2. Installing the Spring Boot CLI

## 4. Developing Your First Spring Boot Application

[doc](https://docs.spring.io/spring-boot/docs/3.1.9/reference/html/getting-started.html#getting-started.first-application)

### 4.2. Setting up the project with Maven

### 4.3. Setting up the project with Gradle

# 6. Developing with Spring Boot

## 6.1.1. Dependency Management

### 6.1.2. Maven

[html](https://docs.spring.io/spring-boot/docs/3.1.9/maven-plugin/reference/htmlsingle/#introduction)

### 6.1.3. Gradle

[html](https://docs.spring.io/spring-boot/docs/3.1.9/gradle-plugin/reference/htmlsingle/)

## 6.2. Structuring Your Code

### 6.2.2. Locating the Main Application Class

`@SpringBootApplication annotation ` implicitly defines a base “search package” for certain items.  

For example, if you are writing a JPA application, the package of the `@SpringBootApplication` annotated class is used to search for @Entity items.

Using a root package also allows component scan to apply only on your project.


## 6.3. Configuration Classes

### 6.3.1. Importing Additional Configuration Classes

The `@Import` annotation can be used to import additional configuration classes.

### 6.3.2. Importing XML Configuration

If you absolutely must use XML based configuration, we recommend that you still start with a `@Configuration` class.  
You can then use an `@ImportResource` annotation to load XML configuration files.

## 6.4. Auto-configuration

Spring Boot auto-configuration attempts to automatically configure your Spring application based on the *jar dependencies* that you have added.  

You need to opt-in to auto-configuration  
by adding the @EnableAutoConfiguration or @SpringBootApplication annotations  
to one of your @Configuration classes.

### 6.4.2. Disabling Specific Auto-configuration Classes

If you find that specific auto-configuration classes that you do not want are being applied, you can use the exclude attribute of @SpringBootApplication to disable them,  
as shown in the following example:

```java
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;

@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class MyApplication {

}
```

### 6.4.3. Auto-configuration Packages

The `@EnableAutoConfiguration` annotation (either directly or through its presence on `@SpringBootApplication`) determines the default auto-configuration package.  
Additional packages can be configured using the `@AutoConfigurationPackage` annotation.

## 6.5. Spring Beans and Dependency Injection

We generally recommend using *constructor injection* to wire up dependencies and `@ComponentScan` to find beans.

you can add `@ComponentScan` without any arguments or use the `@SpringBootApplication` annotation which implicitly includes it.

All of your application components (@Component, @Service, @Repository, @Controller, and others) are automatically registered as Spring Beans.

## 6.6. Using the @SpringBootApplication Annotation

A single `@SpringBootApplication` annotation can be used to enable those three features, that is:

- `@EnableAutoConfiguration`: enable Spring Boot’s auto-configuration mechanism

- `@ComponentScan`: enable @Component scan on the package where the application is located (see the best practices)

- `@SpringBootConfiguration`: enable registration of extra beans in the context or the import of additional configuration classes. An alternative to Spring’s standard @Configuration that aids configuration detection in your integration tests.


# 7. Core Features

## 7.1. SpringApplication

### 7.1.2. Lazy Initialization

SpringApplication allows an application to be initialized lazily.  
When lazy initialization is enabled, beans are created as they are needed rather than during application startup.

```yaml
spring:
  main:
    lazy-initialization: true

```

### 7.1.3. Customizing the Banner

The banner that is printed on start up can be changed by adding a banner.txt file to your classpath or by setting the `spring.banner.location` property to the location of such a file.  
If the file has an encoding other than UTF-8, you can set `spring.banner.charset`.

Inside your banner.txt file, you can use any key available in the Environment as well as any of the following placeholders:

### 7.1.4. Customizing SpringApplication

If the SpringApplication defaults are not to your taste, you can instead create a local instance and customize it. For example, to turn off the banner,  
you could write:

```java
import org.springframework.boot.Banner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class MyApplication {

    public static void main(String[] args) {
        SpringApplication application = new SpringApplication(MyApplication.class);
        application.setBannerMode(Banner.Mode.OFF);
        application.run(args);
    }

}
```

It is also possible to configure the SpringApplication by using an application.properties file. 

For a complete list of the configuration options, see the [SpringApplication Javadoc](https://docs.spring.io/spring-boot/docs/3.1.9/api/org/springframework/boot/SpringApplication.html).


### doc-7.1.5. Fluent Builder API

### pending-7.1.6. Application Availability

### doc-7.1.7. Application Events and Listeners

### doc-7.1.8. Web Environment

### 7.1.10. Using the ApplicationRunner or CommandLineRunner

If you need to run some specific code once the SpringApplication has started, you can implement the `ApplicationRunner` or `CommandLineRunner` interfaces.  

Both interfaces work in the same way and offer a single run method, which is called just before `SpringApplication.run(…​)` completes.

### 7.1.11. Application Exit

Each SpringApplication registers a shutdown hook with the JVM to ensure that the ApplicationContext closes gracefully on exit.


In addition, beans may implement the `org.springframework.boot.ExitCodeGenerator` interface if they wish to return a specific exit code when SpringApplication.exit() is called.  
This exit code can then be passed to `System.exit()` to return it as a status code, as shown in the following example:

```java
import org.springframework.boot.ExitCodeGenerator;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class MyApplication {

    @Bean
    public ExitCodeGenerator exitCodeGenerator() {
        return () -> 42;
    }

    public static void main(String[] args) {
        System.exit(SpringApplication.exit(SpringApplication.run(MyApplication.class, args)));
    }

}


```

Also, the ExitCodeGenerator interface may be implemented by exceptions. 


### doc-7.1.13. Application Startup tracking


## 7.2. Externalized Configuration

# 9. Data

Spring Boot integrates with a number of data technologies, both SQL and NoSQL.


## 9.1. SQL Databases

