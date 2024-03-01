# build-0-maven.md

## cn mirror

<https://blog.csdn.net/qq_38217990/article/details/129257106>

`apache-maven-3.6.3\conf\settings.xml`
```xml
<mirrors>
    <!-- mirror
     | Specifies a repository mirror site to use instead of a given repository. The repository that
     | this mirror serves has an ID that matches the mirrorOf element of this mirror. IDs are used
     | for inheritance and direct lookup purposes, and must be unique across the set of mirrors.
     |
    <mirror>
      <id>mirrorId</id>
      <mirrorOf>repositoryId</mirrorOf>
      <name>Human Readable Name for this Mirror.</name>
      <url>http://my.repository.com/repo/path</url>
    </mirror>
     -->
    <mirror>
        <id>tencent-cloud</id>
        <mirrorOf>central</mirrorOf>
        <name>Tencent Cloud Mirror.</name>
        <url>http://mirrors.cloud.tencent.com/nexus/repository/maven-public/</url>
    </mirror>

    <mirror>
        <id>aliyun</id>
        <mirrorOf>central</mirrorOf>
        <name>Aliyun Mirror.</name>
        <url>http://maven.aliyun.com/nexus/content/groups/public/</url>
    </mirror>

    <mirror>
        <id>repo2</id>
        <mirrorOf>central</mirrorOf>
        <name>Human Readable Name for this Mirror.</name>
        <url>http://repo2.maven.org/maven2/</url>
    </mirror>

    <mirror>
        <id>ui</id>
        <mirrorOf>central</mirrorOf>
        <name>Human Readable Name for this Mirror.</name>
        <url>http://uk.maven.org/maven2/</url>
    </mirror>

    <mirror>
        <id>jboss-public-repository-group</id>
        <mirrorOf>central</mirrorOf>
        <name>JBoss Public Repository Group</name>
        <url>http://repository.jboss.org/nexus/content/groups/public</url>
    </mirror>

    <mirror>
        <id>repo1</id>
        <mirrorOf>central</mirrorOf>
        <name>Human Readable Name for this Mirror.</name>
        <url>http://repo1.maven.org/maven2/</url>
    </mirror>
  </mirrors>
```

