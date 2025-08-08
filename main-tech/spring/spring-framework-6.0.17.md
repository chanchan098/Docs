- [-Core Technologies](#-core-technologies)
- [Introduction to the Spring IoC Container and Beans](#introduction-to-the-spring-ioc-container-and-beans)
- [Container Overview](#container-overview)
  - [Configuration Metadata](#configuration-metadata)
- [Bean Overview](#bean-overview)
- [Annotation-based Container Configuration](#annotation-based-container-configuration)
- [Java-based Container Configuration](#java-based-container-configuration)
  - [Basic Concepts: @Bean and @Configuration](#basic-concepts-bean-and-configuration)
- [Java Bean Validation](#java-bean-validation)
  - [Configuring Custom Constraints](#configuring-custom-constraints)
- [Spring Expression Language (SpEL)](#spring-expression-language-spel)
- [-Aspect Oriented Programming with Spring](#-aspect-oriented-programming-with-spring)
- [AOP Concepts](#aop-concepts)
- [-@AspectJ support](#-aspectj-support)
- [Enabling @AspectJ Support](#enabling-aspectj-support)
- [Declaring an Aspect](#declaring-an-aspect)
- [Declaring a Pointcut](#declaring-a-pointcut)
- [Declaring Advice](#declaring-advice)
- [Introductions](#introductions)
- [An AOP Example](#an-aop-example)
- [-E-@AspectJ support](#-e-aspectj-support)
- [Proxying Mechanisms](#proxying-mechanisms)
  - [Understanding AOP Proxies](#understanding-aop-proxies)
- [-E-Aspect Oriented Programming with Spring](#-e-aspect-oriented-programming-with-spring)
- [Advantages of the Spring Framework’s Transaction Support Model](#advantages-of-the-spring-frameworks-transaction-support-model)
  - [Global Transactions](#global-transactions)
  - [Local Transactions](#local-transactions)
- [Understanding the Spring Framework Transaction Abstraction](#understanding-the-spring-framework-transaction-abstraction)
- [Understanding the Spring Framework’s Declarative Transaction Implementation](#understanding-the-spring-frameworks-declarative-transaction-implementation)
- [Using `@Transactional`](#using-transactional)
- [Transaction Propagation](#transaction-propagation)
- [Understanding PROPAGATION\_REQUIRED](#understanding-propagation_required)
- [Understanding PROPAGATION\_REQUIRES\_NEW](#understanding-propagation_requires_new)
- [Understanding PROPAGATION\_NESTED](#understanding-propagation_nested)
- [-E-Transaction Management](#-e-transaction-management)
- [-E-Core Technologies](#-e-core-technologies)
- [-------------------------------------------------------](#-------------------------------------------------------)
- [-Web on Servlet Stack](#-web-on-servlet-stack)
- [Spring Web MVC](#spring-web-mvc)
- [-DispatcherServlet](#-dispatcherservlet)
- [Context Hierarchy](#context-hierarchy)
- [Interception](#interception)
- [-E-DispatcherServlet](#-e-dispatcherservlet)
- [-Annotated Controllers](#-annotated-controllers)
- [Declaration(xml means)](#declarationxml-means)
- [Request Mapping](#request-mapping)
  - [Explicit Registrations](#explicit-registrations)
- [-Handler Methods](#-handler-methods)
- [Method Arguments](#method-arguments)
- [Model](#model)
- [-E-Handler Methods](#-e-handler-methods)
- [Exceptions](#exceptions)
- [-E-Annotated Controllers](#-e-annotated-controllers)
- [-MVC Config](#-mvc-config)
- [Message Converters](#message-converters)
- [MVC Config API](#mvc-config-api)
- [-E-MVC Config](#-e-mvc-config)
- [-Testing](#-testing)
- [TestContext Framework Support Classes](#testcontext-framework-support-classes)


[api](https://docs.spring.io/spring-framework/docs/6.0.17/javadoc-api/index.html)

[doc](https://docs.spring.io/spring-framework/reference/6.0/overview.html)

## -Core Technologies

## Introduction to the Spring IoC Container and Beans

https://docs.spring.io/spring-framework/reference/6.0/core/beans/introduction.html

**IoC**  

Dependency injection (DI) is a specialized form of IoC.  

whereby objects define their *dependencies* (that is, the other objects they work with)  
only through constructor arguments, arguments to a factory method,  
or properties that are set on the object instance after it is constructed or returned from a factory method.  

The IoC container then **injects** those dependencies when it creates the bean.  

This process is fundamentally the inverse of the bean itself.

<span style='font-size: 16px;font-weight: 500'>Bean factory</span>  
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

*Core Technologies/The IoC Container*

## Bean Overview

https://docs.spring.io/spring-framework/reference/6.0/core/beans/definition.html


## Annotation-based Container Configuration

https://docs.spring.io/spring-framework/reference/6.0/core/beans/annotation-config.html

which relies on `bytecode metadata` for wiring up components 


## Java-based Container Configuration

https://docs.spring.io/spring-framework/reference/6.0/core/beans/java.html

### Basic Concepts: @Bean and @Configuration


## Java Bean Validation

https://docs.spring.io/spring-framework/reference/6.0/core/validation/beanvalidation.html

- [tutorial](https://www.iocoder.cn/Spring-Boot/Validation/?fuck)
- [spec](https://beanvalidation.org/)
- [Hibernate Validator](https://hibernate.org/validator/)

### Configuring Custom Constraints



## Spring Expression Language (SpEL)

https://docs.spring.io/spring-framework/reference/6.0/core/expressions.html

is a powerful expression language that supports querying and manipulating an object graph at runtime.



## -Aspect Oriented Programming with Spring

[docs](https://docs.spring.io/spring-framework/reference/core/aop.html)

The key unit of modularity in AOP is the aspect.  

Aspects enable the modularization of concerns (such as transaction management) that cut across multiple types and objects.  

## AOP Concepts

https://docs.spring.io/spring-framework/reference/6.0/core/aop/introduction-defn.html

[Spring style](https://www.baeldung.com/spring-aop)

[AspectJ style](https://www.baeldung.com/aspectj)

- Aspect:  
  A modularization of a concern that cuts across multiple classes.
  
- Join point:  
  In Spring AOP, a join point always represents *a method execution*.

- Advice:  
  Action taken by an aspect at a particular join point.

- Pointcut:  
  A predicate that matches join points. Advice is associated with a pointcut expression and runs at any join point matched by the pointcut (for example, the execution of a method with a certain name).   
  ```java
    @Pointcut("@annotation(preAuthenticated)")
    public void preAuthenticated() {}

    @Around("preAuthenticated()")
    @Around("@annotation(preAuthenticated)")
  ```

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

- Before advice:  
Advice that runs before a join point but that does not have the ability to prevent execution flow proceeding to the join point (unless it throws an exception).

- After returning advice:  
Advice to be run after a join point completes normally (for example, if a method returns without throwing an exception).

- After throwing advice:  
Advice to be run if a method exits by throwing an exception.

- After (finally) advice:  
Advice to be run regardless of the means by which a join point exits (normal or exceptional return).

- Around advice:  
Advice that surrounds a join point such as a method invocation.  
  This is the most powerful kind of advice.  
  Around advice can perform custom behavior before and after the method invocation.  
  It is also responsible for choosing whether to proceed to the join point or to shortcut the advised method execution by returning its own return value or throwing an exception.

<span style='font-size: 16px;font-weight: 500'>Examples</span>  

- [PreAuthenticatedAspect.java](https://github.com/YunaiV/ruoyi-vue-pro/blob/v2.2.0(jdk17/21)/yudao-framework/yudao-spring-boot-starter-security/src/main/java/cn/iocoder/yudao/framework/security/core/aop/PreAuthenticatedAspect.java)
- [IdempotentAspect.java](https://github1s.com/YunaiV/ruoyi-vue-pro/blob/v2.2.0(jdk17/21)/yudao-framework/yudao-spring-boot-starter-protection/src/main/java/cn/iocoder/yudao/framework/idempotent/core/aop/IdempotentAspect.java)

<br/>

As a label
```java
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Inherited
@Documented
public @interface PreAuthenticated {
}
```


```java
@Aspect
@Slf4j
public class PreAuthenticatedAspect {

    //@advice type(predicate)            
    // point cut
    @Around("@annotation(preAuthenticated)")
    // @Around("preAuthenticated()")
    public Object around(ProceedingJoinPoint joinPoint, PreAuthenticated preAuthenticated) throws Throwable {
        if (SecurityFrameworkUtils.getLoginUser() == null) {
            throw exception(UNAUTHORIZED);
        }
        return joinPoint.proceed();
    }
}
```

```java
@PreAuthenticated
public CommonResult<Boolean> takeCoupon(@Valid @RequestBody AppCouponTakeReqVO reqVO) {}
```


<span style='font-size: 16px;font-weight: 500'>Example-spring style</span>  

```java
public class SampleAdder {
    public int add(int a, int b) {
        return a + b;
    }
}

public class AdderAfterReturnAspect {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    public void afterReturn(Object returnValue) throws Throwable {
        logger.info("value return was {}",  returnValue);
    }
}

```

```xml
<bean id="sampleAdder" class="org.baeldung.logger.SampleAdder" />
<bean id="doAfterReturningAspect" 
  class="org.baeldung.logger.AdderAfterReturnAspect" />
<aop:config>
    <aop:aspect id="aspects" ref="doAfterReturningAspect">
       <aop:pointcut id="pointCutAfterReturning" expression=
         "execution(* org.baeldung.logger.SampleAdder+.*(..))"/>
       <aop:after-returning method="afterReturn"
         returning="returnValue" pointcut-ref="pointCutAfterReturning"/>
    </aop:aspect>
</aop:config>
```

## -@AspectJ support

https://docs.spring.io/spring-framework/reference/6.0/core/aop/ataspectj.html

`@AspectJ` refers to a style of declaring aspects as regular Java classes annotated with annotations. 

## Enabling @AspectJ Support

automatic support by spring boot.

## Declaring an Aspect

```
package com.xyz;

import org.aspectj.lang.annotation.Aspect;

@Aspect
public class NotVeryUsefulAspect {
}
```

## Declaring a Pointcut

you can think of a pointcut as matching the execution of methods on Spring beans. 

## Declaring Advice

Advice is associated with a pointcut expression and runs before, after, or around method executions matched by the pointcut.  

## Introductions

Introductions (known as inter-type declarations in AspectJ) enable an aspect to declare that advised objects implement *a given interface*, and to provide `an implementation` of that interface on behalf of those objects.

## An AOP Example

## -E-@AspectJ support

## Proxying Mechanisms

https://docs.spring.io/spring-framework/reference/6.0/core/aop/proxying.html

### Understanding AOP Proxies


## -E-Aspect Oriented Programming with Spring


## Advantages of the Spring Framework’s Transaction Support Model

https://docs.spring.io/spring-framework/reference/6.0/data-access/transaction/motivation.html

### Global Transactions

Global transactions let you work with multiple transactional resources, typically relational databases and message queues.  
Managed by JTA, which is a cumbersome API.

### Local Transactions

Local transactions are resource-specific, such as a transaction associated with a JDBC connection.  
It cannot help ensure correctness across multiple resources.

## Understanding the Spring Framework Transaction Abstraction

[docs](https://docs.spring.io/spring-framework/reference/6.0/data-access/transaction/strategies.html)


imperative transaction management by `org.springframework.transaction.PlatformTransactionManager`  
reactive transaction management by `org.springframework.transaction.ReactiveTransactionManager`

<span style='font-size: 16px;font-weight: 500'>a service provider interface (SPI)</span>  
```java
public interface PlatformTransactionManager extends TransactionManager {

	TransactionStatus getTransaction(TransactionDefinition definition) throws TransactionException;

	void commit(TransactionStatus status) throws TransactionException;

	void rollback(TransactionStatus status) throws TransactionException;
}
```


## Understanding the Spring Framework’s Declarative Transaction Implementation

[doc ](https://docs.spring.io/spring-framework/reference/6.0/data-access/transaction/declarative/tx-decl-explained.html)

Spring Framework’s declarative transaction support are that this support is enabled via AOP proxies and that the transactional advice is driven by metadata (currently XML- or annotation-based).  
The combination of AOP with transactional metadata <mark>yields</mark> an AOP proxy that uses a `TransactionInterceptor` in conjunction with an appropriate `TransactionManager` implementation to drive transactions around method invocations.

![alt](https://docs.spring.io/spring-framework/reference/6.0/_images/tx.png)


*Data Access/Transaction Management/Declarative Transaction Management*

## Using `@Transactional`

## Transaction Propagation


https://docs.spring.io/spring-framework/docs/6.0.17/javadoc-api/org/springframework/transaction/annotation/Propagation.html


## Understanding PROPAGATION_REQUIRED

![alt](https://docs.spring.io/spring-framework/reference/6.0/_images/tx_prop_required.png)

PROPAGATION_REQUIRED enforces a physical transaction, either locally for the current scope if no transaction exists yet or participating in an existing 'outer' transaction defined for a larger scope.

## Understanding PROPAGATION_REQUIRES_NEW

![alt](https://docs.spring.io/spring-framework/reference/6.0/_images/tx_prop_requires_new.png)

PROPAGATION_REQUIRES_NEW, in contrast to PROPAGATION_REQUIRED, always uses an independent physical transaction for each affected transaction scope, never participating in an existing transaction for an outer scope.

## Understanding PROPAGATION_NESTED

PROPAGATION_NESTED uses a single physical transaction with multiple savepoints that it can roll back to. 

## -E-Transaction Management

## -E-Core Technologies

## -------------------------------------------------------

## -Web on Servlet Stack

## Spring Web MVC

[doc](https://docs.spring.io/spring-framework/reference/6.0/web.html)  



## -DispatcherServlet 

https://docs.spring.io/spring-framework/reference/6.0/web/webmvc/mvc-servlet.html

[process progress](https://blog.csdn.net/anying5823/article/details/106308360)

<span style='font-size: 16px;font-weight: 500'>Spring MVC</span>  
is designed around the front controller pattern  
where a central Servlet, the DispatcherServlet, provides a shared algorithm for request processing,  
while actual work is performed by configurable delegate components.  

<span style='font-size: 16px;font-weight: 500'>DispatcherServlet</span>  
the DispatcherServlet uses Spring configuration to discover `the delegate components` it needs for request  
mapping, view resolution, exception handling, and more.

<span style='font-size: 16px;font-weight: 500'>From [DispatcherServlet api](https://docs.spring.io/spring-framework/docs/current/javadoc-api/org/springframework/web/servlet/DispatcherServlet.html)</span>  
Central dispatcher for `HTTP request handlers/controllers`,  
e.g. for web UI controllers or HTTP-based remote service exporters.  
Dispatches to registered handlers for processing *a web request*, providing convenient *mapping* and *exception handling* facilities.

functionality:  
- check out api

## Context Hierarchy

## Interception

https://docs.spring.io/spring-framework/reference/6.0/web/webmvc/mvc-servlet/handlermapping-interceptor.html

ResponseBodyAdvice 

## -E-DispatcherServlet 

## -Annotated Controllers

https://docs.spring.io/spring-framework/reference/6.0/web/webmvc/mvc-controller.html

## Declaration(xml means)

## Request Mapping 

You can use the `@RequestMapping` annotation to map requests to controllers methods.  
It has various attributes to match by URL, HTTP method, request parameters, headers, and media types.


### Explicit Registrations

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


## -Handler Methods

`@RequestMapping` handler methods have a flexible signature and can choose from a range of supported  
controller method arguments and return values.

*[Web on Servlet Stack/Spring Web MVC/MVC Config/Message Converters](https://docs.spring.io/spring-framework/reference/6.0/web/webmvc/mvc-config/message-converters.html)*

## Method Arguments

[check out table](https://docs.spring.io/spring-framework/reference/6.0/web/webmvc/mvc-controller/ann-methods/arguments.html)

## Model



## -E-Handler Methods

## Exceptions

`@Controller` and `@ControllerAdvice` classes can have `@ExceptionHandler` methods to handle exceptions from controller methods, as the following example shows:


https://docs.spring.io/spring-framework/reference/6.0/web/webmvc/mvc-servlet/exceptionhandlers.html


[@ExceptionHandler](https://docs.spring.io/spring-framework/reference/6.0/web/webmvc/mvc-controller/ann-exceptionhandler.html)


## -E-Annotated Controllers

## -MVC Config

## Message Converters

In a Spring Boot application, the `WebMvcAutoConfiguration` adds any `HttpMessageConverter` beans it detects, in addition to default converters.

[Web on Servlet Stack/Spring Web MVC/MVC Config/MVC Config API](https://docs.spring.io/spring-framework/reference/6.0/web/webmvc/mvc-config/customize.html)
## MVC Config API

to customize mvc configs

## -E-MVC Config

## -Testing

*Spring TestContext Framework\*

## TestContext Framework Support Classes

https://docs.spring.io/spring-framework/reference/testing/testcontext-framework/support-classes.html
