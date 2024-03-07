# cmp-9.1-spring-framework.md

- [doc](https://docs.spring.io/spring-framework/reference/6.0/index.html)  
- [spring repo](https://mvnrepository.com/artifact/org.springframework)

# The IoC Container - Core Technologies

## Introduction to the Spring IoC Container and Beans

**IoC**  

Dependency injection (DI) is a specialized form of IoC.  

whereby objects define their *dependencies* (that is, the other objects they work with)  
only through constructor arguments, arguments to a factory method,  
or properties that are set on the object instance after it is constructed or returned from a factory method.  

The IoC container then **injects** those dependencies when it creates the bean.  

This process is fundamentally the inverse of the bean itself.

<span style='font-size: 15px;'>**Bean factory**</span>  
provides the configuration framework and basic functionality, and the `ApplicationContext` adds more enterprise-specific functionality.

---

In Spring, the objects *that form the backbone of your application and that are managed by the Spring IoC container* are called beans. 


## Container Overview

[docs](https://docs.spring.io/spring-framework/reference/core/beans/basics.html)

The `org.springframework.context.ApplicationContext` interface represents the **Spring IoC container** and is responsible for *instantiating*, *configuring*, and *assembling* the beans.  

The container gets its *instructions* on what objects to instantiate, configure, and assemble by reading *configuration metadata*.  
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

## Java-based Container Configuration


# Spring Expression Language (SpEL) - Core Technologies

is a powerful expression language that supports querying and manipulating an object graph at runtime.

# Aspect Oriented Programming with Spring - Core Technologies

[docs](https://docs.spring.io/spring-framework/reference/core/aop.html)

The key unit of modularity in AOP is the aspect.  

Aspects enable the modularization of concerns (such as transaction management) that cut across multiple types and objects.  

## AOP Concepts

- Aspect:  
  A modularization of a concern that cuts across multiple classes.
  
- Join point:  
  In Spring AOP, a join point always represents *a method execution*.

- Advice:  
  Action taken by an aspect at a particular join point.

- Pointcut:  
  A predicate that matches join points. `@Around("@annotation(preAuthenticated)")`

- Introduction:  
  Declaring additional methods or fields on behalf of a type. 

- Target object:  
  An object being advised by one or more aspects.  
  An object needed to add logic.

- AOP proxy:  
  An object created by the AOP framework in order to implement the aspect contracts (advice method executions and so on).

- Weaving:  
  linking aspects with other application types or objects to create an advised object. 


**Types of advice**

- Before advice: Advice that runs before a join point but that does not have the ability to prevent execution flow proceeding to the join point (unless it throws an exception).

- After returning advice: Advice to be run after a join point completes normally (for example, if a method returns without throwing an exception).

- After throwing advice: Advice to be run if a method exits by throwing an exception.

- After (finally) advice: Advice to be run regardless of the means by which a join point exits (normal or exceptional return).

- Around advice: Advice that surrounds a join point such as a method invocation.  
  This is the most powerful kind of advice.  
  Around advice can perform custom behavior before and after the method invocation.  
  It is also responsible for choosing whether to proceed to the join point or to shortcut the advised method execution by returning its own return value or throwing an exception.

## @AspectJ support

`@AspectJ` refers to a style of declaring aspects as regular Java classes annotated with annotations. 

## Enabling @AspectJ Support - @AspectJ support

automatic support by spring boot.

## Declaring an Aspect - @AspectJ support

```
package com.xyz;

import org.aspectj.lang.annotation.Aspect;

@Aspect
public class NotVeryUsefulAspect {
}
```

## Introductions - @AspectJ support

Introductions (known as inter-type declarations in AspectJ) enable an aspect to declare that advised objects implement *a given interface*, and to provide `an implementation` of that interface on behalf of those objects.





# Spring Web MVC - Web on Servlet Stack

[doc](https://docs.spring.io/spring-framework/reference/6.0/web.html)  

# DispatcherServlet 
- Spring Web MVC - Web on Servlet Stack

[process progress](https://blog.csdn.net/anying5823/article/details/106308360)

<span style='font-size: 15px;'>**Spring MVC**</span>  
is designed around the front controller pattern  
where a central Servlet, the DispatcherServlet, provides a shared algorithm for request processing,  
while actual work is performed by configurable delegate components. 

<span style='font-size: 15px;'>**DispatcherServlet**</span>  
the DispatcherServlet uses Spring configuration to discover `the delegate components` it needs for request  
mapping, view resolution, exception handling, and more.

<span style='font-size: 15px;'>**From [DispatcherServlet api](https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/web/servlet/DispatcherServlet.html)**</span>  
Central dispatcher for `HTTP request handlers/controllers`,  
e.g. for web UI controllers or HTTP-based remote service exporters.  
Dispatches to registered handlers for processing *a web request*, providing convenient *mapping* and *exception handling* facilities.

functionality:  
- check out api

## Context Hierarchy

# Annotated Controllers - 
Spring Web MVC - Web on Servlet Stack

Spring MVC provides an annotation-based programming model where `@Controller` and `@RestController` components use annotations to express request mappings, request input, exception handling, and more.

# Declaration(xml means) - 
Annotated Controllers - Spring Web MVC - Web on Servlet Stack

# Request Mapping - 
Annotated Controllers - Spring Web MVC - Web on Servlet Stack

You can use the `@RequestMapping` annotation to map requests to controllers methods.  
It has various attributes to match by URL, HTTP method, request parameters, headers, and media types.

## Explicit Registrations

You can programmatically register handler methods, which you can use for dynamic registrations or for advanced cases,  
such as different instances of the same handler under different URLs.  
The following example registers a handler method:

```java
@Configuration
public class MyConfig {

	@Autowired
	public void setHandlerMapping(RequestMappingHandlerMapping mapping, UserHandler handler)
			throws NoSuchMethodException {

		RequestMappingInfo info = RequestMappingInfo
				.paths("/user/{id}").methods(RequestMethod.GET).build();

		Method method = UserHandler.class.getMethod("getUser", Long.class);

		mapping.registerMapping(info, handler, method);
	}
}
```

## Handler Methods

`@RequestMapping` handler methods have a flexible signature and can choose from a range of supported  
controller method arguments and return values.

