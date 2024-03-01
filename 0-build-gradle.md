# build-0-gradle.md

## cn mirror

<https://blog.csdn.net/u013066244/article/details/113444036>

`.gralde\init.gradle`
```gradle
allprojects {
    buildscript {
        repositories {
            mavenLocal()
            maven { url 'https://maven.aliyun.com/repository/google/' }
            maven { url 'https://maven.aliyun.com/repository/public/' }
            maven { url 'https://maven.aliyun.com/repository/central' }
            maven { url 'https://maven.aliyun.com/repository/gradle-plugin' }
            maven { url 'https://jitpack.io' }
            maven { url 'https://plugins.gradle.org/m2/' }
            maven { url "https://nexus.bsdn.org/content/groups/public/" }
            mavenCentral()
        }
    }
 
    repositories {
        mavenLocal()
        maven { url 'https://maven.aliyun.com/repository/google/' }
        maven { url 'https://maven.aliyun.com/repository/public/' }
        maven { url 'https://maven.aliyun.com/repository/central' }
        maven { url 'https://maven.aliyun.com/repository/gradle-plugin' }
        maven { url 'https://jitpack.io' }
        maven { url "https://nexus.bsdn.org/content/groups/public/" }
        mavenCentral()
    }
    println "${it.name}: Aliyun maven mirror injected"
}
```
