

https://github.com/elunez/eladmin-mp

https://www.baeldung.com/spring-jpa-test-in-memory-database

# jpa-testing

## trying trickies

### from scratch to top.
### log

# jpa test config

## yaml and properties (in `test` folder)


<details>
<summary>application-unit-test.yml</summary>

```yaml
my-test:
  testing: true

#配置数据源

spring:
  datasource:
    druid:
      db-type: com.alibaba.druid.pool.DruidDataSource
      driverClassName: net.sf.log4jdbc.sql.jdbcapi.DriverSpy
      url: jdbc:log4jdbc:mysql://${DB_HOST:localhost}:${DB_PORT:3306}/${DB_NAME:eladmin}?serverTimezone=Asia/Shanghai&characterEncoding=utf8&useSSL=false
      username: ${DB_USER:root}
      password: ${DB_PWD:123456}
      # 初始连接数
      initial-size: 5
      # 最小连接数
      min-idle: 15
      # 最大连接数
      max-active: 30
      # 超时时间(以秒数为单位)
      remove-abandoned-timeout: 180
      # 获取连接超时时间
      max-wait: 3000
      # 连接有效性检测时间
      time-between-eviction-runs-millis: 60000
      # 连接在池中最小生存的时间
      min-evictable-idle-time-millis: 300000
      # 连接在池中最大生存的时间
      max-evictable-idle-time-millis: 900000
      # 指明连接是否被空闲连接回收器(如果有)进行检验.如果检测失败,则连接将被从池中去除
      test-while-idle: true
      # 指明是否在从池中取出连接前进行检验,如果检验失败, 则从池中去除连接并尝试取出另一个
      test-on-borrow: true
      # 是否在归还到池中前进行检验
      test-on-return: false
      # 检测连接是否有效
      validation-query: select 1
      # 配置监控统计
      webStatFilter:
        enabled: true
      stat-view-servlet:
        enabled: true
        url-pattern: /druid/*
        reset-enable: false
      filter:
        stat:
          enabled: true
          # 记录慢SQL
          log-slow-sql: true
          slow-sql-millis: 1000
          merge-sql: true
        wall:
          config:
            multi-statement-allow: true

# 登录相关配置
login:
  #  是否限制单用户登录
  single-login: false
  # Redis用户登录缓存配置
  user-cache:
    # 存活时间/秒
    idle-time: 21600
  #  验证码
  login-code:
    #  验证码类型配置 查看 LoginProperties 类
    code-type: arithmetic
    #  登录图形验证码有效时间/分钟
    expiration: 2
    #  验证码高度
    width: 111
    #  验证码宽度
    height: 36
    # 内容长度
    length: 2
    # 字体名称，为空则使用默认字体
    font-name:
    # 字体大小
    font-size: 25

#jwt
jwt-test:
  header: Authorization
  # 令牌前缀
  token-start-with: Bearer
  # 必须使用最少88位的Base64对该令牌进行编码
  base64-secret: ZmQ0ZGI5NjQ0MDQwY2I4MjMxY2Y3ZmI3MjdhN2ZmMjNhODViOTg1ZGE0NTBjMGM4NDA5NzYxMjdjOWMwYWRmZTBlZjlhNGY3ZTg4Y2U3YTE1ODVkZDU5Y2Y3OGYwZWE1NzUzNWQ2YjFjZDc0NGMxZWU2MmQ3MjY1NzJmNTE0MzI=
  # 令牌过期时间 此处单位/毫秒 ，默认4小时，可在此网站生成 https://www.convertworld.com/zh-hans/time/milliseconds.html
  token-validity-in-seconds: 14400000
  # 在线用户key
  online-key: "online-token:"
  # 验证码
  code-key: "captcha-code:"
  # token 续期检查时间范围（默认30分钟，单位毫秒），在token即将过期的一段时间内用户操作了，则给用户的token续期
  detect: 1800000
  # 续期时间范围，默认1小时，单位毫秒
  renew: 3600000

#是否允许生成代码，生产环境设置为false
generator:
  enabled: true

#是否开启 swagger-ui
swagger:
  enabled: true

# 文件存储路径
file:
  mac:
    path: ~/file/
    avatar: ~/avatar/
  linux:
    path: /home/eladmin/file/
    avatar: /home/eladmin/avatar/
  windows:
    path: C:\eladmin\file\
    avatar: C:\eladmin\avatar\
  # 文件大小 /M
  maxSize: 100
  avatarMaxSize: 5

```

</details>


<details>
<summary>jpa.properties</summary>


```properties
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



</details>

## IsTesting.java (conditional loading resource, in `code` folder)

<details>
<summary>IsTesting.java</summary>

```java
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

</details>

## JpaTestConfig.java (config repos to use in test, in `code` folder)

<details>
<summary>JpaTestConfig.java</summary>

```java

import java.util.Properties;

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
        final Properties hibernateProperties = new Properties();
        hibernateProperties.put("hibernate.implicit_naming_strategy", SpringImplicitNamingStrategy.class.getName());
        hibernateProperties.put("hibernate.physical_naming_strategy", SpringPhysicalNamingStrategy.class.getName());
        em.setJpaProperties(hibernateProperties);

//        using h2
//        em.setJpaProperties(additionalProperties());

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

## TestConfiguration.java (beans to use in test, in `code` folder)

<details>
<summary>TestConfiguration.java</summary>

```java
import me.zhengjie.config.FileProperties;
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

    @Bean
    @ConfigurationProperties(prefix = "jwt-test")
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
</details>

## BaseJpaUnitTest.java (load application context, resource restricted, in `code` folder)

<details>
<summary>BaseJpaUnitTest.java</summary>

```java
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;
import org.springframework.test.context.ActiveProfiles;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.NONE,
        classes = BaseJpaUnitTest.Application.class)
@ActiveProfiles(profiles = {
//        "unit-test-default",//copied default
        "unit-test",
})
public class BaseJpaUnitTest {
    @ComponentScan(basePackages = {
            "me.zhengjie.modules.system.service.mapstruct",
    })
    @EnableAutoConfiguration
    @Import({
            JpaTestConfig.class,
            TestConfiguration.class,
//            FileProperties.class,
//            RedisUtils.class,
//            TokenProvider.class,
//            UserCacheManager.class,
//            ConfigBeanConfiguration.class,
//            OnlineUserService.class
    })
    public static class Application {
    }
}
```

</details>

## Example


### JpaTest.java (jpa-specific test)

```java

import io.jsonwebtoken.lang.Assert;
import me.zhengjie.config.test.BaseJpaUnitTest;
import me.zhengjie.modules.system.domain.User;
import me.zhengjie.modules.system.repository.UserRepository;
import me.zhengjie.modules.system.service.impl.UserServiceImpl;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Import;

import java.util.List;

@Import({
        UserServiceImpl.class
})
public class JpaTest extends BaseJpaUnitTest {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private UserServiceImpl userService;


    @Test
    public void validate(){
        Assert.notNull(userService);
        Assert.notNull(userRepository);

        Assert.isTrue(userService.check());
    }


    @Test
    public void queryUser(){
        List<User> all = userRepository.findAll();
        System.out.printf("size is %d",all.size());
        int a= 1;
    }

}

```

### (whole app) EladminSystemApplicationTests

<details>
<summary>code</summary>

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

</details>