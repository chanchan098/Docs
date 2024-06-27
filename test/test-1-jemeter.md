
# Testing 

## Output html

`jmeter -n -t /path/to/your/testplan.jmx -l /path/to/results.jtl -e -o /path/to/html/report/output/directory`

- -n：非 GUI 模式运行测试计划。
- -t：指定要运行的 JMeter 测试计划文件路径。
- -l：指定要保存测试结果数据的 .jtl 文件路径。
- -e：指示 JMeter 在测试结束后生成 HTML 报告。
- -o：指定用于存放生成的 HTML 报告的目录路径。


# 3. Elements of a Test Plan

- [doc](https://jmeter.apache.org/usermanual/test_plan.html)

## Test plan
- If you have selected a file in your test listeners, this data will be written to file.
- The consequence is that the file will grow huge quickly, and JMeter's performance will suffer.  
  This option should be off if you are doing **stress-testing** (it is off by default).

### 3.1 Thread Group
- Thread group elements are the beginning points of any test plan.

### 3.2 Controllers

#### Samplers

#### Logic controllers

### 3.3 Listeners

Listeners provide access to the information JMeter gathers about the test cases while JMeter runs.  

### 3.4 Timers

specify a delay by adding one of the available timers to your Thread Group.

### 3.7 Pre-Processor Elements

executes some action prior to a Sampler Request being made.

### 3.8 Post-Processor Elements

executes some action after a Sampler Request has been made.

# 6. Building a Database Test Plan

https://jmeter.apache.org/usermanual/build-db-test-plan.html

## Download and place `connector`

https://mvnrepository.com/artifact/mysql/mysql-connector-java/8.0.30

to `apache-jmeter-5.6.3\lib\ext`

## reset mysql password

0. stop mysql service
1. perform command `mysqld --console --skip-grant-tables --shared-memory`, keep it opened
2. login again by `mysql -uroot -p`, no pwd.
3. set pwd to null, `UPDATE mysql.user SET authentication_string='' WHERE user='root';`
4. end up the `skip-grant-tables` cmd window
5. start mysql service and login `mysql -uroot -p`
6. set new pwd, `use mysql ;ALTER user root@'localhost' identified by 'root';`
