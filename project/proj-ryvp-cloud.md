# proj-ryvp-cloud.md

## Dependencies management

related to Maven Dependencies management   
see also [0-build-maven.md](0-build-maven.md)

[spring framework dependencies](https://mvnrepository.com/artifact/org.springframework)


## Module structure

- yudao-dependencies
- yudao-framework`(packed components and configs with spring style)`
  - yudao-spring-boot-starter-xxx
- yudao-gateway
- yudao-module-xxx`business components`

## starter-security

- config
  - YudaoSecurityRpcAutoConfiguration 
    - `for feign`, added interceptor to append logined user for per request
  - YudaoWebSecurityConfigurerAdapter
    - configs for web security

## Login

issuing `refresh token` and `access token`

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
  
  