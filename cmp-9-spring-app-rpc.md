# cmp-9-spring-app-rpc.md

# OpenFeign (spring boot)

[tutorial ](https://www.iocoder.cn/Spring-Boot/Feign/)

## Basic use 

### Service side

- Define a service to expose
  ```java 
    @RestController
    @RequestMapping("/user")
    public class UserController {

    @GetMapping("/get") // 获得指定用户
    public UserResponse get(@RequestParam("id") Integer id) {
        return new UserResponse().setId(id)
                .setName("昵称：" + id).setGender(id % 2 == 0 ? 1 : 2);
    }
  ```
  
### Caller side  
1. Create Feign client
    ```java 
    public interface UserServiceFeignClient {
        @RequestLine("GET /user/get?id={id}")
        UserResponse get(@Param("id") Integer id);
    }
    ```

2. Create configs to service
    ```java 
        @Bean
        public UserServiceFeignClient userServiceFeignClient() {
            return Feign.builder()
                    .encoder(new GsonEncoder())
                    .decoder(new GsonDecoder())
                    .target(UserServiceFeignClient.class, "http://127.0.0.1:18080"); // 目标地址
        }
    ```

3. Used in caller controller
   ```java 
    @Autowired
    private UserServiceFeignClient userServiceFeignClient;

    @GetMapping("/test01")
    public UserResponse test01() {
        return userServiceFeignClient.get(1);
    }
   ```


<details>
<summary>dp</summary>

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <parent>
        <artifactId>lab-58</artifactId>
        <groupId>cn.iocoder.springboot.labs</groupId>
        <version>1.0-SNAPSHOT</version>
    </parent>
    <modelVersion>4.0.0</modelVersion>

    <artifactId>lab-58-feign-demo</artifactId>

    <properties>
        <maven.compiler.target>1.8</maven.compiler.target>
        <maven.compiler.source>1.8</maven.compiler.source>
        <spring.boot.version>2.2.4.RELEASE</spring.boot.version>
    </properties>

    <dependencyManagement>
        <dependencies>
            <dependency>
                <groupId>org.springframework.boot</groupId>
                <artifactId>spring-boot-starter-parent</artifactId>
                <version>${spring.boot.version}</version>
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

        <!-- 引入 Feign 相关依赖 -->
        <dependency>
            <groupId>io.github.openfeign</groupId>
            <artifactId>feign-core</artifactId>
            <version>11.0</version>
        </dependency>
        <!-- 引入 Feign GSON 拓展的依赖 -->
        <dependency>
            <groupId>io.github.openfeign</groupId>
            <artifactId>feign-gson</artifactId>
            <version>11.0</version>
        </dependency>
    </dependencies>

</project>
```

</details>

## Use spring mvc contract

1. Define a service and use spring mvc annotation. 
   ```java
   public interface UserServiceFeignClient02 {

    // 获得用户详情
    @GetMapping("/user/get")
    UserResponse get(@RequestParam("id") Integer id);

    @GetMapping("/user/list")
    List<UserResponse> list(@RequestParam("name") String name,
                            @RequestParam("gender") Integer gender);

    @PostMapping(value = "/user/add", consumes = "application/json")
    Integer add(@RequestBody UserAddRequest request);

    }
   ```

2. Add contract config to Feign client
   ```java 
    @Bean
    public UserServiceFeignClient02 userServiceFeignClient02() {
        return Feign.builder()
                .encoder(new GsonEncoder())
                .decoder(new GsonDecoder())
                .contract(new SpringContract())
                .target(UserServiceFeignClient02.class, "http://127.0.0.1:18080"); // 目标地址
    }
   ```



## Decoder and encoder

# OpenFeign (spring cloud)

[tutorial ](https://www.iocoder.cn/Spring-Cloud/Feign/?self)

## Service side

0. Configure spring cloud 
   ```yml
    spring:
        application:
            name: demo-provider # Spring 应用名
        cloud:
            nacos:
            # Nacos 作为注册中心的配置项，对应 NacosDiscoveryProperties 配置类
            discovery:
                server-addr: 127.0.0.1:8848 # Nacos 服务器地址

    server:
        port: ${random.int[10000,19999]}  # 服务器端口。默认为 8080
   ```

1. Define a service
   ```java 
    @RestController
    public class ProviderController {
        private Logger logger = LoggerFactory.getLogger(ProviderController.class);

        @Value("${server.port}")
        private Integer serverPort;

        @GetMapping("/echo")
        public String echo(String name) throws InterruptedException {
            Thread.sleep(100L);            
            logger.info("[echo][被调用啦 name({})]", name);
            return serverPort + "-provider:" + name;
        }
    }
   ```

### Dependencies
<details>
<summary>dp</summary>

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <parent>
        <artifactId>labx-01</artifactId>
        <groupId>cn.iocoder.springboot.labs</groupId>
        <version>1.0-SNAPSHOT</version>
    </parent>
    <modelVersion>4.0.0</modelVersion>

    <artifactId>labx-03-sc-feign-demo01-provider</artifactId>

    <properties>
        <spring.boot.version>2.2.4.RELEASE</spring.boot.version>
        <spring.cloud.version>Hoxton.SR1</spring.cloud.version>
        <spring.cloud.alibaba.version>2.2.0.RELEASE</spring.cloud.alibaba.version>
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
            <dependency>
                <groupId>com.alibaba.cloud</groupId>
                <artifactId>spring-cloud-alibaba-dependencies</artifactId>
                <version>${spring.cloud.alibaba.version}</version>
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

        <!-- 引入 Spring Cloud Alibaba Nacos Discovery 相关依赖，将 Nacos 作为注册中心，并实现对其的自动配置 -->
        <dependency>
            <groupId>com.alibaba.cloud</groupId>
            <artifactId>spring-cloud-starter-alibaba-nacos-discovery</artifactId>
        </dependency>
    </dependencies>

</project>
```

</details>

## Caller side

0. Configure spring cloud
   ```yaml
    spring:
        application:
            name: demo-consumer # Spring 应用名
        cloud:
            nacos:
            # Nacos 作为注册中心的配置项，对应 NacosDiscoveryProperties 配置类
            discovery:
                server-addr: 127.0.0.1:8848 # Nacos 服务器地址

    server:
        port: 28080 # 服务器端口。默认为 8080
   ```

1. Define provider client
   ```java 
    @FeignClient(name = "demo-provider")
    public interface DemoProviderFeignClient {
        @GetMapping("/echo")
        String echo(@RequestParam("name") String name);
    }
   ```

2. Call via Feign client
   ```java
    @RestController
    public class ConsumerController {

        @Autowired
        private DemoProviderFeignClient demoProviderFeignClient;

        @GetMapping("/hello0")two
        public String hello0(String name) {
            String response = demoProviderFeignClient.echo(name);
            return "consumer:" + response;
        }
    }
   ```
### Dependencies
<details>
<summary>dp</summary>

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <parent>
        <artifactId>labx-01</artifactId>
        <groupId>cn.iocoder.springboot.labs</groupId>
        <version>1.0-SNAPSHOT</version>
    </parent>
    <modelVersion>4.0.0</modelVersion>

    <artifactId>labx-03-sc-feign-demo01-consumer</artifactId>

    <properties>
        <spring.boot.version>2.2.4.RELEASE</spring.boot.version>
        <spring.cloud.version>Hoxton.SR1</spring.cloud.version>
        <spring.cloud.alibaba.version>2.2.0.RELEASE</spring.cloud.alibaba.version>
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
            <dependency>
                <groupId>com.alibaba.cloud</groupId>
                <artifactId>spring-cloud-alibaba-dependencies</artifactId>
                <version>${spring.cloud.alibaba.version}</version>
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

        <!-- 引入 Spring Cloud Alibaba Nacos Discovery 相关依赖，将 Nacos 作为注册中心，并实现对其的自动配置 -->
        <dependency>
            <groupId>com.alibaba.cloud</groupId>
            <artifactId>spring-cloud-starter-alibaba-nacos-discovery</artifactId>
        </dependency>

        <!-- 引入 Spring Cloud OpenFeign 相关依赖，使用 OpenFeign 提供声明式调用，并实现对其的自动配置 -->
        <dependency>
            <groupId>org.springframework.cloud</groupId>
            <artifactId>spring-cloud-starter-openfeign</artifactId>
        </dependency>
    </dependencies>

</project>
```

</details>