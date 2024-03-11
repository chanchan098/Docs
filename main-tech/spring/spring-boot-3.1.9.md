# spring-boot.md

- [spring-boot.md](#spring-bootmd)
- [4. Getting Started](#4-getting-started)
  - [1. Introducing Spring Boot](#1-introducing-spring-boot)
  - [3.2. Installing the Spring Boot CLI](#32-installing-the-spring-boot-cli)
  - [4. Developing Your First Spring Boot Application](#4-developing-your-first-spring-boot-application)
    - [4.2. Setting up the project with Maven](#42-setting-up-the-project-with-maven)
    - [4.3. Setting up the project with Gradle](#43-setting-up-the-project-with-gradle)
- [6. Developing with Spring Boot](#6-developing-with-spring-boot)
  - [6.1.1. Dependency Management](#611-dependency-management)
    - [6.1.2. Maven](#612-maven)
    - [6.1.3. Gradle](#613-gradle)
  - [6.2. Structuring Your Code](#62-structuring-your-code)
    - [6.2.2. Locating the Main Application Class](#622-locating-the-main-application-class)
  - [6.3. Configuration Classes](#63-configuration-classes)
    - [6.3.1. Importing Additional Configuration Classes](#631-importing-additional-configuration-classes)
    - [6.3.2. Importing XML Configuration](#632-importing-xml-configuration)
  - [6.4. Auto-configuration](#64-auto-configuration)
    - [6.4.2. Disabling Specific Auto-configuration Classes](#642-disabling-specific-auto-configuration-classes)
    - [6.4.3. Auto-configuration Packages](#643-auto-configuration-packages)
  - [6.5. Spring Beans and Dependency Injection](#65-spring-beans-and-dependency-injection)
  - [6.6. Using the @SpringBootApplication Annotation](#66-using-the-springbootapplication-annotation)
- [7. Core Features](#7-core-features)
  - [7.1. SpringApplication](#71-springapplication)
    - [7.1.2. Lazy Initialization](#712-lazy-initialization)
    - [7.1.3. Customizing the Banner](#713-customizing-the-banner)
    - [7.1.4. Customizing SpringApplication](#714-customizing-springapplication)
    - [doc-7.1.5. Fluent Builder API](#doc-715-fluent-builder-api)
    - [pending-7.1.6. Application Availability](#pending-716-application-availability)
    - [doc-7.1.7. Application Events and Listeners](#doc-717-application-events-and-listeners)
    - [doc-7.1.8. Web Environment](#doc-718-web-environment)
    - [7.1.10. Using the ApplicationRunner or CommandLineRunner](#7110-using-the-applicationrunner-or-commandlinerunner)
    - [7.1.11. Application Exit](#7111-application-exit)
    - [doc-7.1.13. Application Startup tracking](#doc-7113-application-startup-tracking)
  - [7.2. Externalized Configuration](#72-externalized-configuration)
  - [7.2.8. Type-safe Configuration Properties](#728-type-safe-configuration-properties)
    - [JavaBean Properties Binding](#javabean-properties-binding)
- [7.9 Testing](#79-testing)
- [9. Data](#9-data)
  - [9.1. SQL Databases](#91-sql-databases)
- [Appendix](#appendix)
  - [Application Properties](#application-properties)
  - [Configuration Metadata](#configuration-metadata)
- [others---](#others---)
- [Spring Boot – Transaction Management Using @Transactional Annotation](#spring-boot--transaction-management-using-transactional-annotation)
  - [@Transactional Annotation](#transactional-annotation)
- [jpa-testing](#jpa-testing)
  - [trying trickies](#trying-trickies)
    - [from scratch to top.](#from-scratch-to-top)
    - [log](#log)
- [jpa config](#jpa-config)
  - [jpa.properties](#jpaproperties)
  - [mytest.yml](#mytestyml)
  - [IsTesting.java](#istestingjava)
  - [TestConfiguration.java](#testconfigurationjava)
  - [BaseJpaUnitTest.java](#basejpaunittestjava)
  - [JpaTestConfig.java](#jpatestconfigjava)
  - [used in](#used-in)
    - [(whole app) EladminSystemApplicationTests](#whole-app-eladminsystemapplicationtests)
    - [JpaTest.java](#jpatestjava)
    - [UserServiceTest.java](#userservicetestjava)

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

## 7.2.8. Type-safe Configuration Properties

### JavaBean Properties Binding

It is possible to bind a bean declaring standard JavaBean properties as shown in the following example:
```java
import java.net.InetAddress;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.boot.context.properties.ConfigurationProperties;

@ConfigurationProperties("my.service")
public class MyProperties {

    private boolean enabled;

    private InetAddress remoteAddress;

    private final Security security = new Security();

    public boolean isEnabled() {
        return this.enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public InetAddress getRemoteAddress() {
        return this.remoteAddress;
    }

    public void setRemoteAddress(InetAddress remoteAddress) {
        this.remoteAddress = remoteAddress;
    }

    public Security getSecurity() {
        return this.security;
    }

    public static class Security {

        private String username;

        private String password;

        private List<String> roles = new ArrayList<>(Collections.singleton("USER"));

        public String getUsername() {
            return this.username;
        }

        public void setUsername(String username) {
            this.username = username;
        }

        public String getPassword() {
            return this.password;
        }

        public void setPassword(String password) {
            this.password = password;
        }

        public List<String> getRoles() {
            return this.roles;
        }

        public void setRoles(List<String> roles) {
            this.roles = roles;
        }

    }

}


```


# 7.9 Testing

# 9. Data

Spring Boot integrates with a number of data technologies, both SQL and NoSQL.


## 9.1. SQL Databases



# Appendix 

[doc](https://docs.spring.io/spring-boot/docs/3.1.9/reference/html/index.html)

## Application Properties

## Configuration Metadata



# others---

# Spring Boot – Transaction Management Using @Transactional Annotation

<https://www.geeksforgeeks.org/spring-boot-transaction-management-using-transactional-annotation/>

a transaction is a sequence of actions performed by the application that together pipelined to perform a single operation.

## @Transactional Annotation

If the transaction becomes successful then the changes made to the database are committed, if any transaction fails, all the changes made to that particular transaction can be rollback and it will ensure that the database remains in a consistent state.

# jpa-testing

## trying trickies

### from scratch to top.
### log

# jpa config

## jpa.properties 

```
#jdbc.driverClassName=net.sf.log4jdbc.sql.jdbcapi.DriverSpy
#jdbc.url=jdbc:log4jdbc:mysql://localhost:3306/eladmin?serverTimezone=Asia/Shanghai&characterEncoding=utf8&useSSL=false
#jdbc.user=root
#jdbc.pass=123456
#hibernate.dialect=org.hibernate.dialect.MySQLDialect


jdbc.driverClassName=org.h2.Driver
jdbc.url=jdbc:h2:mem:myDb;DB_CLOSE_DELAY=-1;NON_KEYWORDS=KEY,VALUE;MODE=MySQL

hibernate.dialect=org.hibernate.dialect.H2Dialect
hibernate.show_sql=false
#if hibernate has error from https://stackoverflow.com/questions/70797504/spring-data-jpa-h2-database-is-returning-ddl-error-during-table-creation
hibernate.format_sql=true
hibernate.hbm2ddl.auto=create

hibernate.cache.use_second_level_cache=false
hibernate.cache.use_query_cache=false
```

## mytest.yml

```
my-test:
  testing: true
```

## IsTesting.java


```
import org.springframework.context.annotation.Condition;
import org.springframework.context.annotation.ConditionContext;
import org.springframework.core.env.Environment;
import org.springframework.core.type.AnnotatedTypeMetadata;

public class IsTesting implements Condition {
    @Override
    public boolean matches(ConditionContext context, AnnotatedTypeMetadata metadata) {
        Environment environment = context.getEnvironment();
        String loggingAccess = environment.getProperty("my-test.testing");
        return Boolean.parseBoolean(loggingAccess);
    }
}
```


## TestConfiguration.java

```


import me.zhengjie.modules.security.config.bean.SecurityProperties;
import me.zhengjie.modules.security.security.TokenProvider;
import me.zhengjie.modules.security.service.OnlineUserService;
import me.zhengjie.modules.security.service.UserCacheManager;
import me.zhengjie.utils.RedisUtils;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Conditional;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.redis.core.RedisTemplate;

@Conditional(IsTesting.class)
@Configuration
public class TestConfiguration {


    @Bean
    public UserCacheManager userCacheManager(){
        return new UserCacheManager();
    }
    // alter the unit-test-dev in test folder
    @Bean
    @ConfigurationProperties(prefix = "jwt-t")
    public SecurityProperties securityProperties() {
        return new SecurityProperties();
    }


    @Bean
    public RedisUtils redisUtils(RedisTemplate<Object, Object> redisTemplate){
        return new RedisUtils(redisTemplate);
    }

    @Bean
    public TokenProvider tokenProvider(SecurityProperties properties, RedisUtils redisUtils){
        return new TokenProvider(properties, redisUtils);
    }

    @Bean
    public FileProperties fileProperties(){
        return new FileProperties();
    }

    @Bean
    public OnlineUserService onlineUserService(SecurityProperties properties, TokenProvider tokenProvider, RedisUtils redisUtils){
        return new OnlineUserService(properties, tokenProvider, redisUtils);
    }
}


```

## BaseJpaUnitTest.java

```java


import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Conditional;
import org.springframework.context.annotation.Import;
import org.springframework.test.context.ActiveProfiles;

@Conditional(IsTesting.class)
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.NONE, classes = BaseJpaUnitTest.Application.class)
@ActiveProfiles(profiles = {
        "unit-test-default",//copied default
        "unit-test-dev", ////copied -dev
        "unit-test-mytest"
})
public class BaseJpaUnitTest {
    @ComponentScan(basePackages = {
            "me.zhengjie.modules.system.service.mapstruct",
    })
    @EnableAutoConfiguration
    @Import({
            JpaTestConfig.class,
            TestConfiguration.class,
    })
    public static class Application {
    }
}


```


## JpaTestConfig.java

<details>
  <summary>JpaTestConfig.java</summary>

```java

import java.util.Properties;

import com.alibaba.druid.pool.DruidDataSource;
import org.apache.poi.poifs.nio.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.orm.jpa.hibernate.SpringImplicitNamingStrategy;
import org.springframework.boot.orm.jpa.hibernate.SpringPhysicalNamingStrategy;
import org.springframework.context.annotation.*;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.persistence.EntityManagerFactory;


@Conditional(IsTesting.class)
@Configuration
@EnableJpaRepositories(basePackages = {
        "me.zhengjie.modules.system.repository",
        "me.zhengjie.modules.mnt.repository",
        "me.zhengjie.modules.quartz.repository"
})
@PropertySource("jpa.properties")
@EnableTransactionManagement
public class JpaTestConfig {

    @Autowired
    private Environment env;

//    when using h2
    @Bean
    public DriverManagerDataSource dataSource() {
        final DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName(env.getProperty("jdbc.driverClassName"));
        dataSource.setUrl(env.getProperty("jdbc.url"));
        dataSource.setUsername(env.getProperty("jdbc.user"));
        dataSource.setPassword(env.getProperty("jdbc.pass"));

        return dataSource;
    }


    @Bean                                                    // real datasource DruidDataSource dataSource
    public LocalContainerEntityManagerFactoryBean entityManagerFactory(DriverManagerDataSource dataSource) {
        final LocalContainerEntityManagerFactoryBean em = new LocalContainerEntityManagerFactoryBean();
        em.setDataSource(dataSource);
        em.setPackagesToScan(
                "me.zhengjie.modules.system.domain",
                "me.zhengjie.modules.mnt.domain",
                "me.zhengjie.modules.quartz.domain");

        em.setJpaVendorAdapter(new HibernateJpaVendorAdapter());

//        using real datasource
//        final Properties hibernateProperties = new Properties();
//        hibernateProperties.put("hibernate.implicit_naming_strategy", SpringImplicitNamingStrategy.class.getName());
//        hibernateProperties.put("hibernate.physical_naming_strategy", SpringPhysicalNamingStrategy.class.getName());
//        em.setJpaProperties(hibernateProperties);

//        using h2
        em.setJpaProperties(additionalProperties());

        return em;
    }

//    when using h2
    @Bean
    JpaTransactionManager transactionManager(EntityManagerFactory entityManagerFactory) {
        JpaTransactionManager transactionManager = new JpaTransactionManager();
        transactionManager.setEntityManagerFactory(entityManagerFactory);
        return transactionManager;
    }

//    when using h2
    final Properties additionalProperties() {
        final Properties hibernateProperties = new Properties();

        hibernateProperties.put("hibernate.implicit_naming_strategy", SpringImplicitNamingStrategy.class.getName());
        hibernateProperties.put("hibernate.physical_naming_strategy", SpringPhysicalNamingStrategy.class.getName());
        hibernateProperties.setProperty("hibernate.hbm2ddl.auto", env.getProperty("hibernate.hbm2ddl.auto"));
        hibernateProperties.setProperty("hibernate.dialect", env.getProperty("hibernate.dialect"));
        hibernateProperties.setProperty("hibernate.show_sql", env.getProperty("hibernate.show_sql"));
        hibernateProperties.setProperty("hibernate.format_sql", env.getProperty("hibernate.format_sql"));

        hibernateProperties.setProperty("hibernate.cache.use_second_level_cache", env.getProperty("hibernate.cache.use_second_level_cache"));
        hibernateProperties.setProperty("hibernate.cache.use_query_cache", env.getProperty("hibernate.cache.use_query_cache"));

        return hibernateProperties;
    }
}

```

</details>


## used in

### (whole app) EladminSystemApplicationTests

```java

import me.zhengjie.modules.system.domain.User;
import me.zhengjie.modules.system.repository.UserRepository;
import me.zhengjie.modules.system.service.JobService;
import me.zhengjie.modules.system.service.UserService;
import me.zhengjie.modules.system.service.dto.UserDto;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest(classes = {AppRun.class},webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class EladminSystemApplicationTests {


    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserService userService;


    @Test
    public void queryTest(){
//        List<User> all = userRepository.findAll();
        UserDto byId = userService.findById(1);
        List<User> all = userRepository.findAll();
        int a = 1;
    }

    @Test
    public void contextLoads() {

    }

    public static void main(String[] args) {
    }
}

```



### JpaTest.java


<details>
  <summary>JpaTest.java</summary>

```java

import io.jsonwebtoken.lang.Assert;
import me.zhengjie.config.JpaUnitTest;
import me.zhengjie.config.JpaConfig;
import me.zhengjie.modules.security.config.ConfigBeanConfiguration;
import me.zhengjie.modules.security.service.UserCacheManager;
import me.zhengjie.modules.system.repository.UserRepository;
import me.zhengjie.modules.system.service.impl.UserServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;

import java.util.Objects;

@ComponentScan(basePackages = {
        "me.zhengjie.modules.system.service.mapstruct",
        "me.zhengjie.modules.system.service",
        "me.zhengjie.modules.system.repository"
})
@Import(
{
        JpaConfig.class,
        ConfigBeanConfiguration.class,
        UserCacheManager.class,
        UserServiceImpl.class
}
)
public class JpaTest extends JpaUnitTest {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserServiceImpl userService;

    @Test
    public void validate(){

        Assert.isTrue(Objects.equals(userService.joeyTest(), "joey test"));
        Assert.notNull(userRepository,"userRepository is null");
        Assert.notNull(userService,"userService is null");
        int a= 1;
    }

}

```

</details>


### UserServiceTest.java

```java


import io.jsonwebtoken.lang.Assert;
import me.zhengjie.config.BaseJpaUnitTest;
import me.zhengjie.modules.system.domain.*;
import me.zhengjie.modules.system.repository.*;
import me.zhengjie.modules.system.service.impl.*;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Import;

import java.sql.Timestamp;
import java.util.*;

import static org.junit.jupiter.api.Assertions.*;
import static me.zhengjie.test.RandomUtils.*;


@Import({
        UserServiceImpl.class,
        DeptServiceImpl.class,
        JobServiceImpl.class,
        MenuServiceImpl.class,
        RoleServiceImpl.class
})
public class UserServiceTest extends BaseJpaUnitTest {


    @Autowired
    private UserServiceImpl userService;

    @Autowired
    private JobServiceImpl jobService;

    @Autowired
    private MenuServiceImpl menuService;

    @Autowired
    private DeptServiceImpl deptService;

    @Autowired
    private RoleServiceImpl roleService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private RoleRepository roleRepository;

    @Autowired
    private JobRepository jobRepository;

    @Autowired
    private DeptRepository deptRepository;

    @Autowired
    private MenuRepository menuRepository;

    @Test
    public void validate(){
        Assert.notNull(userService);

        Assert.isTrue(userService.check());
    }


    @Test
    public void jobTest(){

        Job job = randomPojo(Job.class, o -> {
            o.setId(1L);
        });


        Job save = jobRepository.save(job);

        Optional<Job> byId = jobRepository.findById(save.getId());


        Assert.notNull(byId);
        Assert.notNull(byId.get());

    }


    @Test
    public void deptTest() throws InterruptedException {
        Dept dept = new Dept();
        dept.setId(1L);
        dept.setEnabled(true);

        Dept save = deptRepository.save(dept);

        Thread.sleep(1000);

        Optional<Dept> byId = deptRepository.findById(save.getId());

        Assert.notNull(byId);
        Assert.notNull(byId.get());
    }


    @Test
    public void menuTest(){
        Menu menu = new Menu();
        menu.setComponent(randomString());
//        menu.setId(1L);

        Menu save = menuRepository.save(menu);

        Optional<Menu> byId = menuRepository.findById(save.getId());

        Assert.notNull(byId);
        Assert.notNull(byId.get());

    }


    @Test
    public void roleTest(){
        Role role = new Role();
        role.setId(1L);

        Role save = roleRepository.save(role);

        Optional<Role> byId = roleRepository.findById(save.getId());

        Assert.notNull(byId);
        Assert.notNull(byId.get());


    }

    @Test
    public void userServiceTest() throws InterruptedException {

        Job job = randomPojo(Job.class, o -> {
            o.setId(1L);
        });
        jobRepository.save(job);

        Dept dept = new Dept();
        dept.setId(1L);
        dept.setEnabled(true);
        deptRepository.save(dept);


        Menu menu = new Menu();
        menu.setComponent(randomString());
        menuRepository.save(menu);

        Role role = new Role();
        role.setId(1L);
        role.setMenus(new HashSet<Menu>(){{add(menu);}});
        role.setDepts(new HashSet(){{add(dept);}});

        roleRepository.save(role);

        Menu menu1 = menuRepository.findById(menu.getId()).get();
        menu1.setRoles(new HashSet(){{add(role);}});
        menuRepository.save(menu1);

        Dept dept1 = deptRepository.findById(dept.getId()).get();
        dept1.setRoles(new HashSet(){{add(role);}});
        deptRepository.save(dept1);


        User user = new User();
        user.setCreateTime(new Timestamp(randomDate().getTime()));
        user.setUpdateTime(new Timestamp(randomDate().getTime()));
        user.setUsername(randomString());
        user.setEmail(randomEmail());
        user.setPhone(randomString(11));
        user.setGender("男");
        user.setDept(dept);
        user.setJobs(new HashSet(){{add(job);}});
        user.setRoles(new HashSet(){{add(role);}});
        user.setId(1L);

        userRepository.save(user);

        Role role1 = roleRepository.findById(role.getId()).get();
        role1.setUsers(new HashSet(){{add(user);}});
        roleRepository.save(role1);


        Optional<User> user1 = userRepository.findById(user.getId());
        User finalUser = user1.get();

        Assert.notNull(finalUser);


        Job job1 = jobRepository.findById(job.getId()).get();
        Dept dept2 = deptRepository.findById(dept1.getId()).get();
        Menu menu2 = menuRepository.findById(menu1.getId()).get();
        Role role2 = roleRepository.findById(role1.getId()).get();

        Job j = new ArrayList<Job>(finalUser.getJobs()).get(0);
        Role r = new ArrayList<Role>(finalUser.getRoles()).get(0);
        Menu m = new ArrayList<Menu>(r.getMenus()).get(0);
        Dept d = finalUser.getDept();

        assertEquals(j.getId(), job1.getId());
        assertEquals(d.getId(), dept2.getId());
        assertEquals(m.getId(), menu2.getId());
        assertEquals(r.getId(), role2.getId());
    }
}

```