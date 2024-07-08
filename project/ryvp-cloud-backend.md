- [Dependencies management](#dependencies-management)
- [Module structure](#module-structure)
  - [starter-security](#starter-security)
- [Feature diagram](#feature-diagram)
- [Jpa Testing](#jpa-testing)
  - [0. Create module for configuration and create config files](#0-create-module-for-configuration-and-create-config-files)
  - [1. Add `dependency` and create `database object` and `repository`](#1-add-dependency-and-create-database-object-and-repository)
  - [2. Create class for loading `ApplicationContext`](#2-create-class-for-loading-applicationcontext)
  - [3. Write down testing code](#3-write-down-testing-code)
- [Third part libs](#third-part-libs)
  - [captcha](#captcha)
  - [guava](#guava)
- [Module configs](#module-configs)
- [Module common](#module-common)
  - [CommonResult](#commonresult)
  - [PageResult](#pageresult)
  - [PageParam](#pageparam)
- [Module security](#module-security)
  - [YudaoSecurityAutoConfiguration](#yudaosecurityautoconfiguration)
  - [Global permission checking](#global-permission-checking)
- [Module test](#module-test)
- [Token freshing and Login](#token-freshing-and-login)
- [Testing](#testing)
- [Data validation](#data-validation)
- [OAuth2](#oauth2)
  - [三方授权调试](#三方授权调试)



## Dependencies management

related to Maven Dependencies management   
see also [maven.md#dependency-management](../build/maven.md#dependency-management)

[spring framework dependencies](https://mvnrepository.com/artifact/org.springframework.boot/spring-boot-dependencies)


## Module structure

- yudao-dependencies`unified dependencies management, see also `[`Maven`](../build/maven.md)
- yudao-framework`components and configs packed with spring boot style `[`other staters`](https://mvnrepository.com/artifact/org.springframework.boot)
  - yudao-spring-boot-starter-xxx
    - config `with spring style`
    - core `main code`
- yudao-gateway
- yudao-module-xxx`business components`
  - yudao-module-xxx-api`exposed to other modules`
  - yudao-module-xxx-biz`business logic`
    - api`for external`
    - controller`api interfaces`
    - convert`data security`
    - dal`a.k.a data access layer`
      - dataobject`entities mapping to tables` 
      - mysql`mapper to db`
      - redis
    - framework`configs to framework` 
    - service`call mapper and do business logic`
- pom.xml `root`

### starter-security

- config
  - YudaoSecurityRpcAutoConfiguration 
    - `for feign`, added interceptor to append logined user for per request
  - YudaoWebSecurityConfigurerAdapter
    - configs for web security


## Feature diagram

```
↑↓
                                        serviceImpl              MySQL  Mongo   ES   Redis
                                            │                      │      │      │     │
                                            │                      └──────┴──────┴─────┤
                                            ↓                                          │
            user <————> controller <————> service <————> (db accessor)mapper <————> database
                                                               │
                                        ┌──────────┬───────────┼─────────────┐
                                        │          │           │             │
                                 redisTemplate  mybatis    mybatis plus   hibernate
```



## Jpa Testing

### 0. Create module for configuration and create config files

<span style='font-size: 16px;font-weight: 500'>Create module</span>  

under `yudao-framework`, create module `yudao-spring-boot-starter-jpa`

add dependencies
```xml
<dependency>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-data-jpa</artifactId>
</dependency>
```

---

<span style='font-size: 16px;font-weight: 500'>Create config class</span>  

in this moduel, package `cn.iocoder.yudao.framework.jpa.config`

<details>
<summary>JpaTestConfig.java</summary>

```java

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.orm.jpa.hibernate.SpringImplicitNamingStrategy;
import org.springframework.boot.orm.jpa.hibernate.SpringPhysicalNamingStrategy;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import javax.persistence.EntityManagerFactory;
import java.util.Properties;

@Configuration
@EnableJpaRepositories(basePackages = {
        "cn.iocoder.yudao.module.system.dal.repo",
})
@PropertySource("jpa.properties")
@EnableTransactionManagement
public class JpaTestConfig {

    @Autowired
    private Environment env;

    
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
                "cn.iocoder.yudao.module.system.dal.dataobject.user");

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

---

<span style='font-size: 16px;font-weight: 500'>Add module to `yudao-dependencies`</span>  
```xml
<dependency>
    <groupId>cn.iocoder.cloud</groupId>
    <artifactId>yudao-spring-boot-starter-jpa</artifactId>
    <version>${revision}</version>
</dependency>
```

---

<br/>

<span style='font-size: 16px;font-weight: 500'>Create jpa.properties</span>  

in `yudao-module-system/yudao-module-system-biz/src/test/resources`

<details>
<summary>jpa.properties</summary>

```properties
#====================mysql===============================
#jdbc.driverClassName=net.sf.log4jdbc.sql.jdbcapi.DriverSpy
jdbc.driverClassName=com.mysql.jdbc.Driver
#jdbc.url=jdbc:log4jdbc:mysql://localhost:3306/ruoyi-vue-pro?serverTimezone=Asia/Shanghai&characterEncoding=utf8&useSSL=false
jdbc.url=jdbc:mysql://127.0.0.1:3306/ruoyi-vue-pro?allowMultiQueries=true&useUnicode=true&useSSL=false&characterEncoding=UTF-8&serverTimezone=Asia/Shanghai&autoReconnect=true&nullCatalogMeansCurrent=true
jdbc.user=root
jdbc.pass=123456
hibernate.dialect=org.hibernate.dialect.MySQLDialect

#===================h2=============================
#jdbc.driverClassName=org.h2.Driver
#jdbc.url=jdbc:h2:mem:myDb;DB_CLOSE_DELAY=-1;NON_KEYWORDS=KEY,VALUE;MODE=MySQL
#hibernate.dialect=org.hibernate.dialect.H2Dialect
#hibernate.show_sql=false
##if hibernate has error from https://stackoverflow.com/questions/70797504/spring-data-jpa-h2-database-is-returning-ddl-error-during-table-creation
#hibernate.format_sql=true
#hibernate.hbm2ddl.auto=create
#hibernate.cache.use_second_level_cache=false
#hibernate.cache.use_query_cache=false
```


</details>



### 1. Add `dependency` and create `database object` and `repository`

in `yudao-module-system` > `yudao-module-system-biz` > `pom.xml`
```xml
<dependency>
    <groupId>cn.iocoder.cloud</groupId>
    <artifactId>yudao-spring-boot-starter-jpa</artifactId>
</dependency>
```

<span style='font-size: 16px;font-weight: 500'>Create database object</span>  

in `cn/iocoder/yudao/module/system/dal/dataobject/user`
<details>
<summary>J_AdminUserDO.java</summary>

```java
import cn.iocoder.yudao.framework.common.enums.CommonStatusEnum;
import cn.iocoder.yudao.framework.mybatis.core.dataobject.J_BaseDO;
import cn.iocoder.yudao.framework.mybatis.core.type.JsonLongSetTypeHandler;
import cn.iocoder.yudao.framework.tenant.core.db.TenantBaseDO;
import cn.iocoder.yudao.module.system.enums.common.SexEnum;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.*;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.time.LocalDateTime;
import java.util.Set;

/**
 * 管理后台的用户 DO
 *
 * @author 芋道源码
 */
@Entity
@Getter
@Setter
@Table(name="system_users")
public class J_AdminUserDO extends J_BaseDO {

    /**
     * 用户ID
     */
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    /**
     * 用户账号
     */
    @Column(name = "username")
    private String username;
    /**
     * 加密后的密码
     *
     * 因为目前使用 {@link BCryptPasswordEncoder} 加密器，所以无需自己处理 salt 盐
     */
    @Column(name = "password")
    private String password;
    /**
     * 用户昵称
     */
    @Column(name = "nickname")
    private String nickname;
    /**
     * 备注
     */
    @Column(name = "remark")
    private String remark;
    /**
     * 部门 ID
     */
    @Column(name = "dept_id")
    private Long deptId;
    /**
     * 岗位编号数组
     */
    @Column(name = "post_ids")
    private String postIds;
    /**
     * 用户邮箱
     */
    @Column(name = "email")
    private String email;
    /**
     * 手机号码
     */
    @Column(name = "mobile")
    private String mobile;
    /**
     * 用户性别
     *
     * 枚举类 {@link SexEnum}
     */
    @Column(name = "sex")
    private Integer sex;
    /**
     * 用户头像
     */
    @Column(name = "avatar")
    private String avatar;
    /**
     * 帐号状态
     *
     * 枚举 {@link CommonStatusEnum}
     */
    @Column(name = "status")
    private Integer status;
    /**
     * 最后登录IP
     */
    @Column(name = "login_ip")
    private String loginIp;
    /**
     * 最后登录时间
     */
    @Column(name = "login_date")
    private LocalDateTime loginDate;

}
```

</details>

---

<br/>

<span style='font-size: 16px;font-weight: 500'>Create repository</span>  

in `cn/iocoder/yudao/module/system/dal/repo`
<details>
<summary>UserRepository.java</summary>

```java
import cn.iocoder.yudao.module.system.dal.dataobject.user.J_AdminUserDO;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface UserRepository extends JpaRepository<J_AdminUserDO, Long>, JpaSpecificationExecutor<J_AdminUserDO> {

}
```

</details>

### 2. Create class for loading `ApplicationContext`

in `yudao-framework/yudao-spring-boot-starter-test`
<br/>

<span style='font-size: 16px;font-weight: 500'>Add dependencies to</span>  

`yudao-framework/yudao-spring-boot-starter-test` > `pom.xml`

```xml
<dependency>
    <groupId>cn.iocoder.cloud</groupId>
    <artifactId>yudao-spring-boot-starter-jpa</artifactId>
</dependency>
```

in `cn/iocoder/yudao/framework/test/core/ut`

<details>
<summary>J_BaseDbUnitTest.java</summary>

```java

import cn.iocoder.yudao.framework.datasource.config.YudaoDataSourceAutoConfiguration;
import cn.iocoder.yudao.framework.jpa.config.JpaTestConfig;
import cn.iocoder.yudao.framework.mybatis.config.YudaoMybatisAutoConfiguration;
import cn.iocoder.yudao.framework.test.config.SqlInitializationTestConfiguration;
import com.alibaba.druid.spring.boot.autoconfigure.DruidDataSourceAutoConfigure;
import com.baomidou.mybatisplus.autoconfigure.MybatisPlusAutoConfiguration;
import com.github.yulichang.autoconfigure.MybatisPlusJoinAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceTransactionManagerAutoConfiguration;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.jdbc.Sql;

/**
 * 依赖内存 DB 的单元测试
 *
 * 注意，Service 层同样适用。对于 Service 层的单元测试，我们针对自己模块的 Mapper 走的是 H2 内存数据库，针对别的模块的 Service 走的是 Mock 方法
 *
 * @author 芋道源码
 */
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.NONE, classes = J_BaseDbUnitTest.Application.class)
@ActiveProfiles("unit-test") // 设置使用 application-unit-test 配置文件
public class J_BaseDbUnitTest {

    @Import({
//            // DB 配置类
            YudaoDataSourceAutoConfiguration.class, // 自己的 DB 配置类
            DataSourceAutoConfiguration.class, // Spring DB 自动配置类
            DataSourceTransactionManagerAutoConfiguration.class, // Spring 事务自动配置类
            DruidDataSourceAutoConfigure.class, // Druid 自动配置类
            SqlInitializationTestConfiguration.class, // SQL 初始化
            // MyBatis 配置类
            YudaoMybatisAutoConfiguration.class, // 自己的 MyBatis 配置类
            MybatisPlusAutoConfiguration.class, // MyBatis 的自动配置类
            MybatisPlusJoinAutoConfiguration.class, // MyBatis 的Join配置类
            JpaTestConfig.class
    })
    public static class Application {
    }

}

```

</details>

### 3. Write down testing code

in `yudao-module-system/yudao-module-system-biz/src/test/java/cn/iocoder/yudao/module/system/service/user`

<br/>

<span style='font-size: 16px;font-weight: 500'>Create `JpaTest.java`</span>  

<details>
<summary>JpaTest.java</summary>

```java

import cn.iocoder.yudao.framework.test.core.ut.BaseDbUnitTest;
import cn.iocoder.yudao.framework.test.core.ut.J_BaseDbUnitTest;
import cn.iocoder.yudao.module.system.dal.dataobject.user.J_AdminUserDO;
import cn.iocoder.yudao.module.system.dal.repo.UserRepository;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class JpaTest extends J_BaseDbUnitTest {

    @Autowired
    private UserRepository userRepository;

    @Test
    public void launch(){
        Assertions.assertNotNull(userRepository);
    }

    @Test
    public void queryTest(){
        List<J_AdminUserDO> users = userRepository.findAll();

        System.out.println(users.size());
    }

}
```


</details>


## Third part libs

### captcha

<https://github.com/xingyuv/captcha-plus>


### guava

## Module configs

## Module common 

*yudao-framework/yudao-common*

### CommonResult

*yudao-framework/yudao-common/src/main/java/cn/iocoder/yudao/framework/common/pojo/CommonResult.java*

```java
@Data
public class CommonResult<T> implements Serializable {
    private Integer code;
    private T data;
    private String msg;
    ...
}    
```


[convert to json](../main-tech/spring/spring-framework-6.0.17.md#message-converters)

used at `UserController.java` 
```java
import static ...CommonResult.success;

public CommonResult<PageResult<UserRespVO>> getUserPage(@Valid UserPageReqVO pageReqVO) {
  ...
  return success(...)
}
```



### PageResult

```java
@Schema(description = "分页结果")
@Data
public final class PageResult<T> implements Serializable {

    @Schema(description = "数据", requiredMode = Schema.RequiredMode.REQUIRED)
    private List<T> list;

    @Schema(description = "总量", requiredMode = Schema.RequiredMode.REQUIRED)
    private Long total;

    ...
}
```

### PageParam

bean validation see also [java bean validation](../main-tech/spring/spring-framework-6.0.17.md#java-bean-validation)


```java
@Schema(description="分页参数")
@Data
public class PageParam implements Serializable {

    private static final Integer PAGE_NO = 1;
    private static final Integer PAGE_SIZE = 10;

    /**
     * 每页条数 - 不分页
     *
     * 例如说，导出接口，可以设置 {@link #pageSize} 为 -1 不分页，查询所有数据。
     */
    public static final Integer PAGE_SIZE_NONE = -1;

    @Schema(description = "页码，从 1 开始", requiredMode = Schema.RequiredMode.REQUIRED,example = "1")
    @NotNull(message = "页码不能为空")
    @Min(value = 1, message = "页码最小值为 1")
    private Integer pageNo = PAGE_NO;

    @Schema(description = "每页条数，最大值为 100", requiredMode = Schema.RequiredMode.REQUIRED, example = "10")
    @NotNull(message = "每页条数不能为空")
    @Min(value = 1, message = "每页条数最小值为 1")
    @Max(value = 100, message = "每页条数最大值为 100")
    private Integer pageSize = PAGE_SIZE;

}
```

## Module security 

https://github.com/spring-projects/spring-security-samples/tree/5.8.x

│ └ ├ ─ ┼ 

```
config
  │
  ├──── SecurityProperties  
  ├──── YudaoSecurityAutoConfiguration
  ├──── YudaoSecurityRpcAutoConfiguration
  ├──── YudaoWebSecurityConfigurerAdapter
```

### YudaoSecurityAutoConfiguration

configurations for components to use. 


### Global permission checking

*yudao-framework/yudao-spring-boot-starter-security/src/main/java/cn/iocoder/yudao/framework/security/core/service/SecurityFrameworkServiceImpl.java*

## Module test

0. check out `pom.xml`

## Token freshing and Login

`yudao-module-system/yudao-module-system-biz/src/main/java/cn/iocoder/yudao/module/system/controller/admin/auth/AuthController.java`

```

  authService +login 
          ↓        
  -createTokenAfterLoginSuccess
          ↓
  oauth2TokenService +createAccessToken
          ↓
  -createOAuth2RefreshToken
          ↓
  -createOAuth2AccessToken

```



## Testing



## Data validation

- [feral tutorial](https://www.iocoder.cn/Spring-Boot/Validation)
- [spring| java bean validation](https://docs.spring.io/spring-framework/reference/6.0/core/validation/beanvalidation.html)



## OAuth2
  
### 三方授权调试

* 授权
  * [OAuth2OpenController.java#approveOrDeny](yudao-module-system/yudao-module-system-biz/src/main/java/cn/iocoder/yudao/module/system/controller/admin/oauth2/OAuth2OpenController.java)
  * 授权页面 http://localhost/sso?client_id=default&response_type=token&auto_approve=true&redirect_uri=https%3A%2F%2Fwww.iocoder.cn
  * implicit 应用内使用
  * authorization code http://127.0.0.1:48080/admin-api/system/oauth2/token?grant_type=authorization_code&code=db5a1ffeb96d40668a9185c99f2fbab3&client_id=default&client_secret=admin123&redirect_uri=https://www.iocoder.cn
  * password http://127.0.0.1:48080/admin-api/system/oauth2/token?grant_type=password&client_id=default&username=admin&password=admin123&client_id=default&client_secret=admin123
  * refresh token http://127.0.0.1:48080/admin-api/system/oauth2/token?grant_type=refresh_token&client_id=default&client_secret=admin123&refresh_token=647cb70f09bb40938a11e03d417c397c
  * 参数参考
    * 数据表、swagger文档
    * [OAuth2OpenController.java#postAccessToken](yudao-module-system/yudao-module-system-biz/src/main/java/cn/iocoder/yudao/module/system/controller/admin/oauth2/OAuth2OpenController.java)
    * 接口参数
    * 系统文档 http://127.0.0.1:48080/doc.html#/all/%E7%AE%A1%E7%90%86%E5%90%8E%E5%8F%B0%20-%20OAuth2.0%20%E6%8E%88%E6%9D%83/postAccessToken
  * 授权范围描述(personalized)
    * resource.action
    * block:feature:action

* 没有对所有的授权范围进行限定判断，被授权三方应用默认继承某用户所有权限
  * [PermissionServiceImpl.java#hasAnyPermissions](yudao-module-system/yudao-module-system-biz/src/main/java/cn/iocoder/yudao/module/system/service/permission/PermissionServiceImpl.java)
  * [SecurityFrameworkServiceImpl.java#hasAnyScopes](yudao-framework/yudao-spring-boot-starter-security/src/main/java/cn/iocoder/yudao/framework/security/core/service/SecurityFrameworkServiceImpl.java)
* access token刷新
  * 使用refresh token，前端应用在http请求拦截器中进行
  * [OAuth2TokenServiceImpl.java#refreshAccessToken()](yudao-module-system/yudao-module-system-biz/src/main/java/cn/iocoder/yudao/module/system/service/oauth2/OAuth2TokenServiceImpl.java)
  
  