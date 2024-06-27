# Launching on windows

- uses cmd `zkServer.cmd`, no start suffix.
- alters `dataDir` in zoo.cfg, to `dataDir=D:\\a\\b\\c`

# Welcome

<https://zookeeper.apache.org/doc/r3.9.1/index.html>

ZooKeeper is a high-performance **coordination service** for distributed applications.  
It exposes common services - such as naming, configuration management, synchronization, and group services

# Overview

<https://zookeeper.apache.org/doc/r3.9.1/zookeeperOver.html>

## ZooKeeper: A Distributed Coordination Service for Distributed Applications

ZooKeeper is a distributed, open-source coordination service for distributed applications.  

It is designed to be easy to program to, and uses a data model styled after the familiar  
directory tree structure of file systems.

## Design Goals

- **ZooKeeper is simple.**  
  ZooKeeper allows distributed processes to coordinate with each other through a shared hierarchical namespace which is organized similarly to a standard file system.

- **ZooKeeper is replicated.**  
  Like the distributed processes it coordinates, ZooKeeper itself is intended to be replicated over **a set of hosts** called an ensemble.  
  ![alt](https://zookeeper.apache.org/doc/r3.9.1/images/zkservice.jpg)  
  The client maintains a TCP connection **through which** it sends requests, gets responses, gets watch events,  
  and sends heart beats. If the TCP connection to the server breaks, the client will connect to a different  
  server.

- **ZooKeeper is ordered.**  
  ZooKeeper stamps each update with a number that reflects the order of all ZooKeeper transactions. Subsequent  
  operations can use the order to implement higher-level abstractions, such as **synchronization primitives**.

- **ZooKeeper is fast.**  
  It is especially fast in "read-dominant" workloads. ZooKeeper applications run on thousands of machines, and  
  it performs best where **reads are more common than writes**, at ratios of around 10:1.

## Data model and the hierarchical namespace

The namespace provided by ZooKeeper is much like that of **a standard file system**.  
A name is a sequence of path elements separated by a slash (/).  
Every node in ZooKeeper's namespace **is identified by a path**.  

ZooKeeper's Hierarchical Namespace  
![alt](https://zookeeper.apache.org/doc/r3.9.1/images/zknamespace.jpg)

## Nodes and ephemeral nodes

We use the term *znode* to make it clear that we are talking about ZooKeeper data nodes.  

- version number  
  Znodes maintain a stat structure that includes **version numbers** for data changes, ACL changes, and timestamps,  
  to allow cache validations and coordinated updates. Each time a znode's data changes, the version number  increases.  
  For instance, whenever a client retrieves data it also receives the version of the data.

- read and write data  
  The data stored at each znode in a namespace is read and written atomically.  
  Reads get all the data bytes associated with a znode and a write replaces all the data.  
  Each node has an Access Control List (ACL) that restricts who can do what.

- ephemeral nodes  
  ZooKeeper also has the notion of **ephemeral nodes**. These znodes exists as long as the session  
  that created the znode is active. When the session ends the znode is deleted.


## Conditional updates and watches

Clients can set **a watch** on a znode. A watch will be triggered and removed when the <u>znode changes</u>.  

- saying network broken  
  If the connection between the client and one of the ZooKeeper servers is broken, the client will receive **a local notification**.

**New in 3.6.0:** Clients can also set permanent, recursive watches on a znode that are not removed when triggered and that trigger for changes on the registered znode as well as **any children znodes** recursively.

## Guarantees
- Sequential Consistency - Updates from a client will be applied in the order that they were sent.
- Atomicity - Updates either succeed or fail. No partial results.
- Single System Image - A client will see the same view of the service regardless of the server that it connects to. i.e., a client will never see an older view of the system even if the client fails over to a different server with the same session.
- Reliability - Once an update has been applied, it will persist from that time forward until a client overwrites the update.
- Timeliness - The clients view of the system is guaranteed to be up-to-date within a certain time bound.

## Simple API

One of the design goals of ZooKeeper is providing a very simple programming interface. As a result, it supports only these operations:

- create : creates a node at a location in the tree
- delete : deletes a node
- exists : tests if a node exists at a location
- get data : reads the data from a node
- set data : writes data to a node
- get children : retrieves a list of children of a node
- sync : waits for data to be propagated

## Implementation

[link](https://zookeeper.apache.org/doc/r3.9.1/zookeeperOver.html#zkComponents)

ZooKeeper Components shows the high-level components of the ZooKeeper service. With the exception of the request processor, each of the servers that make up the ZooKeeper service replicates its own copy of each of the components.

<details>
<summary>diagram</summary>

![alt](https://zookeeper.apache.org/doc/r3.9.1/images/zkcomponents.jpg)

</details>

ZooKeeper uses a custom atomic messaging protocol. Since the messaging layer is atomic, ZooKeeper can guarantee that the local replicas never diverge. When the leader receives a write request,  
it calculates what the state of the system is when the write is to be applied and transforms this into a transaction that captures this new state.


# Examples

## As registry(labx25)

http://www.iocoder.cn/Spring-Cloud/ZooKeeper-Discovery/

### Provider 

<details>
<summary>dependencies</summary>

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <parent>
        <artifactId>labx-25</artifactId>
        <groupId>cn.iocoder.springboot.labs</groupId>
        <version>1.0-SNAPSHOT</version>
    </parent>
    <modelVersion>4.0.0</modelVersion>

    <artifactId>labx-25-sc-zookeeper-discovery-demo01-provider</artifactId>

    <properties>
        <spring.boot.version>2.2.4.RELEASE</spring.boot.version>
        <spring.cloud.version>Hoxton.SR1</spring.cloud.version>
    </properties>

    <!--
        引入 Spring Boot、Spring Cloud、Spring Cloud Alibaba 三者 BOM 文件，进行依赖版本的管理，防止不兼容。
        在 https://dwz.cn/mcLIfNKt 文章中，Spring Cloud Alibaba 开发团队推荐了三者的依赖关系
     -->
    <dependencyManagement>
        <dependencies>
            <dependency>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-starter-parent</artifactId>
                <version>${spring.boot.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
            <dependency>
                <groupId>org.springframework.cloud</groupId>
                <artifactId>spring-cloud-dependencies</artifactId>
                <version>${spring.cloud.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
        </dependencies>
    </dependencyManagement>

    <dependencies>
        <!-- 引入 SpringMVC 相关依赖，并实现对其的自动配置 -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>

        <!-- 引入 Spring Cloud Zookeeper Discovery 相关依赖，将 Zookeeper 作为注册中心，并实现对其的自动配置 -->
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-zookeeper-discovery</artifactId>
        </dependency>
    </dependencies>

</project>
```

</details>

<details>
<summary>config</summary>

```yaml
spring:
  application:
    name: demo-provider # Spring 应用名
  cloud:
    zookeeper:
      connect-string: 127.0.0.1:2181
      # Zookeeper 作为注册中心的配置项，对应 ZookeeperDiscoveryProperties 配置类
      discovery:
        root: /services # Zookeeper 数据存储的根节点，默认为 /services

server:
  port: 18080 # 服务器端口。默认为 8080

```

</details>

<details>
<summary>code</summary>

```java
@SpringBootApplication
@EnableDiscoveryClient
public class DemoProviderApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoProviderApplication.class, args);
    }

    @RestController
    static class TestController {

        @GetMapping("/echo")
        public String echo(String name) {
            return "provider:" + name;
        }

    }

}

```


</details>

### Consumer

load balancing, instance election and so on by self

<details>
<summary>dependencies</summary>

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <parent>
        <artifactId>labx-25</artifactId>
        <groupId>cn.iocoder.springboot.labs</groupId>
        <version>1.0-SNAPSHOT</version>
    </parent>
    <modelVersion>4.0.0</modelVersion>

    <artifactId>labx-25-sc-zookeeper-discovery-demo01-consumer</artifactId>

    <properties>
        <spring.boot.version>2.2.4.RELEASE</spring.boot.version>
        <spring.cloud.version>Hoxton.SR1</spring.cloud.version>
    </properties>

    <!--
        引入 Spring Boot、Spring Cloud、Spring Cloud Alibaba 三者 BOM 文件，进行依赖版本的管理，防止不兼容。
        在 https://dwz.cn/mcLIfNKt 文章中，Spring Cloud Alibaba 开发团队推荐了三者的依赖关系
     -->
    <dependencyManagement>
        <dependencies>
            <dependency>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-starter-parent</artifactId>
                <version>${spring.boot.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
            <dependency>
                <groupId>org.springframework.cloud</groupId>
                <artifactId>spring-cloud-dependencies</artifactId>
                <version>${spring.cloud.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
        </dependencies>
    </dependencyManagement>

    <dependencies>
        <!-- 引入 SpringMVC 相关依赖，并实现对其的自动配置 -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>

        <!-- 引入 Spring Cloud Zookeeper Discovery 相关依赖，将 Zookeeper 作为注册中心，并实现对其的自动配置 -->
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-zookeeper-discovery</artifactId>
        </dependency>
    </dependencies>

</project>

```


</details>


<details>
<summary>config</summary>

```yaml
spring:
  application:
    name: demo-consumer # Spring 应用名
  cloud:
    zookeeper:
      connect-string: 127.0.0.1:2181
      # Zookeeper 作为注册中心的配置项，对应 ZookeeperDiscoveryProperties 配置类
      discovery:
        root: /services # Zookeeper 数据存储的根节点，默认为 /services

server:
  port: 28080 # 服务器端口。默认为 8080

```


</details>


<details>
<summary>code</summary>

```java

@SpringBootApplication
// @EnableDiscoveryClient
public class DemoConsumerApplication {

    public static void main(String[] args) {
        SpringApplication.run(DemoConsumerApplication.class, args);
    }

    @Configuration
    public class RestTemplateConfiguration {

        @Bean
        public RestTemplate restTemplate() {
            return new RestTemplate();
        }

    }

    @RestController
    static class TestController {

        @Autowired
        private DiscoveryClient discoveryClient;
        @Autowired
        private RestTemplate restTemplate;
        @Autowired
        private LoadBalancerClient loadBalancerClient;

        @GetMapping("/hello")
        public String hello(String name) {
            // 获得服务 `demo-provider` 的一个实例
            ServiceInstance instance;
            if (true) {
                // 获取服务 `demo-provider` 对应的实例列表
                List<ServiceInstance> instances = discoveryClient.getInstances("demo-provider");
                // 选择第一个
                instance = instances.size() > 0 ? instances.get(0) : null;
            } else {
                instance = loadBalancerClient.choose("demo-provider");
            }
            // 发起调用
            if (instance == null) {
                throw new IllegalStateException("获取不到实例");
            }
            String targetUrl = instance.getUri() + "/echo?name=" + name;
            String response = restTemplate.getForObject(targetUrl, String.class);
            // 返回结果
            return "consumer:" + response;
        }

    }

}

```


</details>

## As configuration center

[text](https://www.iocoder.cn/Spring-Cloud/ZooKeeper-Config/)

### with auto-refreshing

<details>
<summary>dependencies</summary>

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <parent>
        <artifactId>labx-26</artifactId>
        <groupId>cn.iocoder.springboot.labs</groupId>
        <version>1.0-SNAPSHOT</version>
    </parent>
    <modelVersion>4.0.0</modelVersion>

    <artifactId>labx-26-sc-zookeeper-config-auto-refresh</artifactId>

    <properties>
        <maven.compiler.target>1.8</maven.compiler.target>
        <maven.compiler.source>1.8</maven.compiler.source>
        <spring.boot.version>2.2.4.RELEASE</spring.boot.version>
        <spring.cloud.version>Hoxton.SR1</spring.cloud.version>
    </properties>

    <!--
        引入 Spring Boot、Spring Cloud、Spring Cloud Alibaba 三者 BOM 文件，进行依赖版本的管理，防止不兼容。
        在 https://dwz.cn/mcLIfNKt 文章中，Spring Cloud Alibaba 开发团队推荐了三者的依赖关系
     -->
    <dependencyManagement>
        <dependencies>
            <dependency>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-starter-parent</artifactId>
                <version>${spring.boot.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
            <dependency>
                <groupId>org.springframework.cloud</groupId>
                <artifactId>spring-cloud-dependencies</artifactId>
                <version>${spring.cloud.version}</version>
                <type>pom</type>
                <scope>import</scope>
            </dependency>
        </dependencies>
    </dependencyManagement>

    <dependencies>
        <!-- 引入 SpringMVC 相关依赖，并实现对其的自动配置 -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>

        <!-- 引入 Spring Cloud Zookeeper Config 相关依赖，将 Zookeeper 作为配置中心，并实现对其的自动配置 -->
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-zookeeper-config</artifactId>
        </dependency>
    </dependencies>

</project>

```


</details>


<details>
<summary>config</summary>

```yaml
spring:
  application:
    name: demo-application

  cloud:
    zookeeper:
      connect-string: 127.0.0.1:2181
      # Zookeeper 作为配置中心的配置项，对应 ZookeeperConfigProperties 配置类
      config:
        root: /config # Zookeeper 数据存储的根节点，默认为 /config
        default-context: application # 读取 Zookeeper 配置的默认目录，默认为 application
        profile-separator: ',' # 多环境目录分隔符，默认为 ,
        watcher:
          enabled: true # 是否开启 Watch 功能，监听 Zookeeper 数据的变化。默认为 true，实现实时监听配置的更新
```


</details>


code  

<details>
<summary>Controller</summary>

```java
@RestController
@RequestMapping("/demo")
@RefreshScope // 加我加我加我！
public class DemoController {

    // ... 省略其它代码

}
```


</details>


# to be continued 