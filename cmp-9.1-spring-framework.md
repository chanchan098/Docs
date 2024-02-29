# The IoC Container

## Introduction to the Spring IoC Container and Beans

**IoC**  

Dependency injection (DI) is a specialized form of IoC.  

whereby objects define their *dependencies* (that is, the other objects they work with)  
only through constructor arguments, arguments to a factory method,  
or properties that are set on the object instance after it is constructed or returned from a factory method.  

The IoC container then **injects** those dependencies when it creates the bean.  

This process is fundamentally the inverse of the bean itself.

**Bean factory**  

provides the configuration framework and basic functionality, and the `ApplicationContext` adds more enterprise-specific functionality.

---

*In Spring, the objects that form the backbone of your application and that are managed by the Spring IoC container are called beans.* 


## Container Overview

[docs](https://docs.spring.io/spring-framework/reference/core/beans/basics.html)

The `org.springframework.context.ApplicationContext` interface represents the **Spring IoC container** and is responsible for *instantiating*, *configuring*, and *assembling* the beans.  

The container gets its *instructions* on what objects to instantiate, configure, and assemble by *reading configuration metadata*.  
The configuration metadata is represented in `XML`, `Java annotations`, or `Java code`.

![alt](https://docs.spring.io/spring-framework/reference/_images/container-magic.png)

### Configuration Metadata

This configuration metadata represents how you, as an application developer, tell the Spring container *to instantiate, configure, and assemble* the objects in your application.

For information about using other forms of metadata with the Spring container, see:

- [Annotation-based configuration](https://docs.spring.io/spring-framework/reference/core/beans/annotation-config.html): define beans using annotation-based configuration metadata.

- [Java-based configuration](https://docs.spring.io/spring-framework/reference/core/beans/java.html): define beans external to your application classes by using Java rather than XML files. To use these features, see the @Configuration, @Bean, @Import, and @DependsOn annotations.

## Bean Overview

## Annotation-based Container Configuration

which relies on `bytecode metadata` for wiring up components 


# Aspect Oriented Programming with Spring

[docs](https://docs.spring.io/spring-framework/reference/core/aop.html)

The key unit of modularity in AOP is the aspect.  

Aspects enable the modularization of concerns (such as transaction management) that cut across multiple types and objects.  

## AOP Concepts

- Aspect: A modularization of a concern that cuts across multiple classes.
  
- Join point: A point during the execution of a program, such as the execution of a method or the handling of an exception. In Spring AOP, a join point always represents *a method execution*.

- Advice: Action taken by an aspect at a particular join point.

- Pointcut: A predicate that matches join points.

- Introduction: Declaring additional methods or fields on behalf of a type. 

- Target object: An object being advised by one or more aspects.

- AOP proxy: An object created by the AOP framework in order to implement the aspect contracts (advice method executions and so on).

- Weaving: linking aspects with other application types or objects to create an advised object. 


**Types of advice**

- Before advice: Advice that runs before a join point but that does not have the ability to prevent execution flow proceeding to the join point (unless it throws an exception).

- After returning advice: Advice to be run after a join point completes normally (for example, if a method returns without throwing an exception).

- After throwing advice: Advice to be run if a method exits by throwing an exception.

- After (finally) advice: Advice to be run regardless of the means by which a join point exits (normal or exceptional return).

- Around advice: Advice that surrounds a join point such as a method invocation.  
  This is the most powerful kind of advice.  
  Around advice can perform custom behavior before and after the method invocation.  
  It is also responsible for choosing whether to proceed to the join point or to shortcut the advised method execution by returning its own return value or throwing an exception.