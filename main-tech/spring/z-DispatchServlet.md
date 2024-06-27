
# [DispatcherServlet](https://docs.spring.io/spring-framework/docs/6.0.17/javadoc-api/org/springframework/web/servlet/DispatcherServlet.html)

##  Hierarchy

```plantuml
@startuml

interface Servlet
interface ServletConfig
interface Serializable

Servlet <|.. GenericServlet
ServletConfig <|.. GenericServlet
Serializable <|.. GenericServlet
GenericServlet <|-- HttpServlet

interface Aware
interface EnvironmentAware
interface EnvironmentCapable
interface ApplicationContextAware

Aware <|-- EnvironmentAware
Aware <|-- EnvironmentCapable
Aware <|-- ApplicationContextAware

EnvironmentAware <|.. HttpServletBean
EnvironmentCapable <|.. HttpServletBean
HttpServlet <|-- HttpServletBean


ApplicationContextAware <|.. FrameworkServlet
HttpServletBean <|-- FrameworkServlet
FrameworkServlet <|-- DispatcherServlet

@enduml
```
<span style='font-size: 15px;'>**FrameworkServlet**</span>  
Base servlet for Spring's web framework. Provides integration with a Spring application context, in a JavaBean-based overall solution.


<span style='font-size: 15px;'>**HttpServlet**</span>  
Simple extension of HttpServlet which treats its config parameters (init-param entries within the servlet tag in web.xml) as bean properties.


<span style='font-size: 15px;'>**Aware**</span>  
A marker superinterface indicating that a bean is eligible to be notified by the Spring container of a particular framework object through a callback-style method.  
The actual method signature is determined by individual subinterfaces but should typically consist of just one void-returning method that accepts a single argument.


## doDispatch(,)

```mermaid
sequenceDiagram
    activate DispatcherServlet
    DispatcherServlet->>DispatcherServlet: getHandler(processedRequest)
    loop every HandlerMapping
        DispatcherServlet->>HandlerMapping: getHandler(request)
    end
    deactivate DispatcherServlet
```


### RequestMappingHandlerMapping.getHandler(request)

```mermaid
sequenceDiagram
    
    DispatcherServlet->>AbstractHandlerMapping: getHandler(request)

    activate AbstractHandlerMapping
    AbstractHandlerMapping->>AbstractHandlerMapping: getHandlerInternal(request)
    
    AbstractHandlerMapping->>RequestMappingInfoHandlerMapping: getHandlerInternal(request)
    deactivate AbstractHandlerMapping

    activate RequestMappingInfoHandlerMapping
    RequestMappingInfoHandlerMapping->>AbstractHandlerMethodMapping: getHandlerInternal(request)
    deactivate RequestMappingInfoHandlerMapping

    activate AbstractHandlerMethodMapping
    AbstractHandlerMethodMapping->>AbstractHandlerMethodMapping: lookupHandlerMethod(lookupPath, request)
    AbstractHandlerMethodMapping->>AbstractHandlerMethodMapping: getMappingsByDirectPath(String urlPath)
    deactivate AbstractHandlerMethodMapping
    
```


## RequestMappingHandlerMapping
```plantuml
@startuml

interface Aware
interface ApplicationContextAware
interface ServletContextAware
interface BeanNameAware
interface MatchableHandlerMapping
interface InitializingBean

abstract ApplicationObjectSupport
abstract WebApplicationObjectSupport
abstract AbstractHandlerMapping
abstract "AbstractHandlerMethodMapping<T>"
abstract RequestMappingInfoHandlerMapping

Aware <|-- ApplicationContextAware
Aware <|-- ServletContextAware
Aware <|-- BeanNameAware

ServletContextAware <|.. WebApplicationObjectSupport
ApplicationContextAware <|.. ApplicationObjectSupport

ApplicationObjectSupport <|-- WebApplicationObjectSupport
WebApplicationObjectSupport <|-- AbstractHandlerMapping
BeanNameAware <|.. AbstractHandlerMapping
HandlerMapping <|.. AbstractHandlerMapping


InitializingBean <|.. "AbstractHandlerMethodMapping<T>"
AbstractHandlerMapping <|.. "AbstractHandlerMethodMapping<T>"


HandlerMapping <|-- MatchableHandlerMapping
MatchableHandlerMapping <|.. RequestMappingHandlerMapping

"AbstractHandlerMethodMapping<T>" <|-- RequestMappingInfoHandlerMapping

RequestMappingInfoHandlerMapping <|-- RequestMappingHandlerMapping

@enduml
```
