
https://www.iocoder.cn/Spring-Boot/Sentinel

## 2. traffic control

<details>
<summary>dependencies</summary>

```xml
<?xml version="1.0" encoding="UTF-8"?>
<project xmlns="http://maven.apache.org/POM/4.0.0"
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <parent>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-parent</artifactId>
        <version>2.7.7</version>
        <relativePath/> <!-- lookup parent from repository -->
    </parent>
    <modelVersion>4.0.0</modelVersion>

    <artifactId>lab-46-sentinel-demo</artifactId>

    <dependencies>
        <!-- 实现对 SpringMVC 的自动化配置 -->
        <dependency>
            <groupId>org.springframework.boot</groupId>
            <artifactId>spring-boot-starter-web</artifactId>
        </dependency>

        <!-- Sentinel 核心库 -->
        <dependency>
            <groupId>com.alibaba.csp</groupId>
            <artifactId>sentinel-core</artifactId>
            <version>1.7.2</version>
        </dependency>
        <!-- Sentinel 接入控制台 -->
        <dependency>
            <groupId>com.alibaba.csp</groupId>
            <artifactId>sentinel-transport-simple-http</artifactId>
            <version>1.7.2</version>
        </dependency>
        <!-- Sentinel 对 SpringMVC 的支持 -->
        <dependency>
            <groupId>com.alibaba.csp</groupId>
            <artifactId>sentinel-spring-webmvc-adapter</artifactId>
            <version>1.7.2</version>
        </dependency>
        <!-- Sentinel 对【热点参数限流】的支持 -->
        <dependency>
            <groupId>com.alibaba.csp</groupId>
            <artifactId>sentinel-parameter-flow-control</artifactId>
            <version>1.7.2</version>
        </dependency>
        <!-- Sentinel 对 Spring AOP 的拓展 -->
        <dependency>
            <groupId>com.alibaba.csp</groupId>
            <artifactId>sentinel-annotation-aspectj</artifactId>
            <version>1.7.2</version>
        </dependency>
    </dependencies>

</project>

```


</details>



<details>
<summary>sentinel config</summary>

```java
@Configuration
public class SentinelConfiguration {

    @Bean
    public SentinelResourceAspect sentinelResourceAspect() {
        return new SentinelResourceAspect();
    }

}

```

```java

@Configuration
public class SpringMvcConfiguration implements WebMvcConfigurer {

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // Add Sentinel interceptor
//        addSentinelWebTotalInterceptor(registry);
        addSentinelWebInterceptor(registry);
    }

    private void addSentinelWebInterceptor(InterceptorRegistry registry) {
        // 创建 SentinelWebMvcConfig 对象
        SentinelWebMvcConfig config = new SentinelWebMvcConfig();
        config.setHttpMethodSpecify(true); // 是否包含请求方法。即基于 URL 创建的资源，是否包含 Method。
        // config.setBlockExceptionHandler(new DefaultBlockExceptionHandler()); // 设置 BlockException 处理器。
//        config.setOriginParser(new RequestOriginParser() { // 设置请求来源解析器。用于黑白名单控制功能。
//
//            @Override
//            public String parseOrigin(HttpServletRequest request) {
//                // 从 Header 中，获得请求来源
//                String origin = request.getHeader("s-user");
//                // 如果为空，给一个默认的
//                if (StringUtils.isEmpty(origin)) {
//                    origin = "default";
//                }
//                return origin;
//            }
//
//        });

        // 添加 SentinelWebInterceptor 拦截器
        registry.addInterceptor(new SentinelWebInterceptor(config)).addPathPatterns("/**");
    }

    private void addSentinelWebTotalInterceptor(InterceptorRegistry registry) {
        // 创建 SentinelWebMvcTotalConfig 对象
        SentinelWebMvcTotalConfig config = new SentinelWebMvcTotalConfig();

        // 添加 SentinelWebTotalInterceptor 拦截器
        registry.addInterceptor(new SentinelWebTotalInterceptor(config)).addPathPatterns("/**");
    }

}

```



</details>



<details>
<summary>controller</summary>

```java

@RestController
@RequestMapping("/demo")
public class DemoController {

    @GetMapping("/echo")
    public String echo() {
        return "echo";
    }

    @GetMapping("/test")
    public String test() {
        return "test";
    }

    @GetMapping("/sleep")
    public String sleep() throws InterruptedException {
        Thread.sleep(100L);
        return "sleep";
    }

    // 测试热点参数限流
    @GetMapping("/product_info")
    @SentinelResource("demo_product_info_hot")
    public String productInfo(Integer id) {
        return "商品编号：" + id;
    }

    // 手动使用 Sentinel 客户端 API
    @GetMapping("/entry_demo")
    public String entryDemo() {
        Entry entry = null;
        try {
            // 访问资源
            entry = SphU.entry("entry_demo");

            // ... 执行业务逻辑

            return "执行成功";
        } catch (BlockException ex) {
            return "被拒绝";
        } finally {
            // 释放资源
            if (entry != null) {
                entry.exit();
            }
        }
    }

    // 测试 @SentinelResource 注解
    @GetMapping("/annotations_demo")
    @SentinelResource(value = "annotations_demo_resource",
            blockHandler = "blockHandler",
            fallback = "fallback")
    public String annotationsDemo(@RequestParam(required = false) Integer id) throws InterruptedException {
        if (id == null) {
            throw new IllegalArgumentException("id 参数不允许为空");
        }
        return "success...";
    }

    // BlockHandler 处理函数，参数最后多一个 BlockException，其余与原函数一致.
    public String blockHandler(Integer id, BlockException ex) {
        return "block：" + ex.getClass().getSimpleName();
    }

    // Fallback 处理函数，函数签名与原函数一致或加一个 Throwable 类型的参数.
    public String fallback(Integer id, Throwable throwable) {
        return "fallback：" + throwable.getMessage();
    }

}

```


</details>


<details>
<summary>exception handling</summary>

```java
@ControllerAdvice(basePackages = "cn.iocoder.springboot.lab46.sentineldemo.controller")
public class GlobalExceptionHandler {

    @ResponseBody
    @ExceptionHandler(value = BlockException.class)
    public String blockExceptionHandler(BlockException blockException) {
        return "请求过于频繁";
    }

}

```


</details>