# maven.md

# -User Centre/Getting Started Guide

*User Centre/Getting Started Guide*
# Naming Conventions

- **groupId** uniquely identifies your project across all projects.
  -  A group ID should follow Java's package name rules. 
  -  This means it starts with a reversed domain name you control. 
  -  For example, `org.apache.maven`, `org.apache.commons`.
  -  **subject groupId**       
      -  You can create as many subgroups as you want. A good way to determine the granularity of the groupId is to use the project structure. That is, if the current project is a multiple module project, it should append a new identifier to the parent's groupId.  
      -  For example,org.apache.maven, org.apache.maven.plugins, org.apache.maven.reporting            
- **artifactId** is the name of the jar without version.
- **version**

*User Centre/Getting Started Guide*
# The Build Lifecycle

## Build Lifecycle Basics

three built-in build lifecycles:
- The `default` lifecycle handles your project deployment,  
- the `clean` lifecycle handles project cleaning,  
- the `site` lifecycle handles the creation of your project's web site.

## 📖A Build Lifecycle is Made Up of Phases

[doc](https://maven.apache.org/guides/introduction/introduction-to-the-lifecycle.html#a-build-lifecycle-is-made-up-of-phases)

## A Build Phase is Made Up of Plugin Goals

A plugin goal represents a specific task (finer than a build phase) which contributes to the building and managing of a project. It may be bound to zero or more build phases.



# The POM

## What is a POM?

<u>A Project Object Model or POM is the fundamental unit of work in Maven. It is an XML file that contains information about the project and configuration details used by Maven to build the project.</u>

<span style='font-size: 15px;'>**default values for most projects:**</span>  
- `target` is the build directory
- `src/main/java` is the source directory
- `src/test/java` is the test source directory
- ...



## 📖 Super POM

## Minimal POM

- `project` root
- `modelVersion` - should be set to 4.0.0
- `groupId` - the id of the project's group.
- `artifactId` - the id of the artifact (project)
- `version` - the version of the artifact under the specified group

```xml
<project>
  <modelVersion>4.0.0</modelVersion>
 
  <groupId>com.mycompany.app</groupId>
  <artifactId>my-app</artifactId>
  <version>1</version>
</project>
```

## 📝to be continued 

## Project Inheritance

*User Centre/Getting Started Guide*
# Profiles



*User Centre/Getting Started Guide*
# Dependency Mechanism

## Dependency Management


[doc](https://maven.apache.org/guides/introduction/introduction-to-dependency-mechanism.html#dependency-management)

is a mechanism for centralizing dependency information.

explained inheritance relationship.  
see also doc


### Importing Dependencies

projects can import managed dependencies from other projects.

Project B:
```xml
<project>
  <modelVersion>4.0.0</modelVersion>
  <groupId>maven</groupId>
  <artifactId>B</artifactId>
  <packaging>pom</packaging>
  <name>B</name>
  <version>1.0</version>
 
  <dependencyManagement>
    <dependencies>
      <dependency>
        <groupId>maven</groupId>
        <artifactId>A</artifactId>
        <version>1.0</version>
        <type>pom</type>
        <scope>import</scope>
      </dependency>
      <dependency>
        <groupId>test</groupId>
        <artifactId>d</artifactId>
        <version>1.0</version>
      </dependency>
    </dependencies>
  </dependencyManagement>
 
  <dependencies>
    <dependency>
      <groupId>test</groupId>
      <artifactId>a</artifactId>
      <version>1.0</version>
      <scope>runtime</scope>
    </dependency>
    <dependency>
      <groupId>test</groupId>
      <artifactId>c</artifactId>
      <scope>runtime</scope>
    </dependency>
  </dependencies>
</project>
```

*All of A's managed dependencies* would be incorporated into B except for d since it is defined in this POM.

check out `yudao-dependencies/pom.xml`
```xml
<dependencyManagement>
    ...
    <dependencies>
        <!-- 统一依赖管理 -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-dependencies</artifactId>
            <version>${spring.boot.version}</version>
            <type>pom</type>
            <scope>import</scope>
        </dependency>
    </dependencies>
    ...
</dependencyManagement>
```

# cn mirror

<https://blog.csdn.net/qq_38217990/article/details/129257106>

`apache-maven-3.6.3\conf\settings.xml`
```xml
<mirrors>
    <!-- mirror
     | Specifies a repository mirror site to use instead of a given repository. The repository that
     | this mirror serves has an ID that matches the mirrorOf element of this mirror. IDs are used
     | for inheritance and direct lookup purposes, and must be unique across the set of mirrors.
     |
    <mirror>
      <id>mirrorId</id>
      <mirrorOf>repositoryId</mirrorOf>
      <name>Human Readable Name for this Mirror.</name>
      <url>http://my.repository.com/repo/path</url>
    </mirror>
     -->
    <mirror>
        <id>tencent-cloud</id>
        <mirrorOf>central</mirrorOf>
        <name>Tencent Cloud Mirror.</name>
        <url>http://mirrors.cloud.tencent.com/nexus/repository/maven-public/</url>
    </mirror>

    <mirror>
        <id>aliyun</id>
        <mirrorOf>central</mirrorOf>
        <name>Aliyun Mirror.</name>
        <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
    </mirror>

    <mirror>
        <id>repo2</id>
        <mirrorOf>central</mirrorOf>
        <name>Human Readable Name for this Mirror.</name>
        <url>http://repo2.maven.org/maven2/</url>
    </mirror>

    <mirror>
        <id>ui</id>
        <mirrorOf>central</mirrorOf>
        <name>Human Readable Name for this Mirror.</name>
        <url>http://uk.maven.org/maven2/</url>
    </mirror>

    <mirror>
        <id>jboss-public-repository-group</id>
        <mirrorOf>central</mirrorOf>
        <name>JBoss Public Repository Group</name>
        <url>http://repository.jboss.org/nexus/content/groups/public</url>
    </mirror>

    <mirror>
        <id>repo1</id>
        <mirrorOf>central</mirrorOf>
        <name>Human Readable Name for this Mirror.</name>
        <url>http://repo1.maven.org/maven2/</url>
    </mirror>
  </mirrors>
```

