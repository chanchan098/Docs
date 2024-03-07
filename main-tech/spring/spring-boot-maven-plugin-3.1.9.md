# spring-boot-maven-plugin-3.1.9.md

# 1. Introduction

[docs](https://docs.spring.io/spring-boot/docs/3.1.9/maven-plugin/reference/htmlsingle/#introduction)


The Spring Boot Maven Plugin provides Spring Boot support in Apache Maven.  
It allows you `to package` executable jar or war archives, `run` Spring Boot applications, `generate` build information and `start` your Spring Boot application *prior to* running integration tests.

# 3. Using the Plugin

Maven users can inherit from the `spring-boot-starter-parent` project to obtain sensible defaults.  
The parent project provides the following features:
- ...
- A dependency management section, inherited from the `spring-boot-dependencies` POM, that manages the versions of common dependencies.  
  This dependency management lets you omit <version> tags for those dependencies when used in your own POM.
- ...

## 3.1. Inheriting the Starter Parent POM

```xml
<!-- Inherit defaults from Spring Boot -->
<parent>
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-starter-parent</artifactId>
	<version>3.1.9</version>
</parent>
```

## 3.2. Using Spring Boot without the Parent POM

```xml
<dependencyManagement>
    <dependencies>
        <dependency>
            <!-- Import dependency management from Spring Boot -->
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-dependencies</artifactId>
            <version>3.1.9</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>
    </dependencies>
</dependencyManagement>
```

# 5. Packaging Executable Archives
