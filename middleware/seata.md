## History

* seata + nacos + dubbo + mysql sample
    * seata配置，与nacos、mysql连接
    * 自行创建事务操作记录表
    * 文档提到的内容组件中确实，需要手动在nacos中添加响应配置
    * 创建响应地业务数据库和表，数据表和事务回滚记录表
    * 顺序运行账号、订单、库存，最后测试，最后手动跑异常
    * 日志中，new global branch tc、branch tc*、exception -> roll back branchs and global branch
    * tc roll back
  

* seata
    * RM TM TC 协同工作，保证分布式事务一致性。
    * AT mode
        * 写隔离，本地锁和全局锁协同使用确保一致
        * 读隔离，全局锁+SELECT ... FOR UPDATE，确保读已提交
        * 出错按表或策略回滚(afterimage != currentimage)
  
### XA pattern

- [XA](https://dtm.pub/practice/xa.html)
  - <details>
    <summary>XA pattern</summary>

    ![Diagram](https://dtm.pub/assets/xa_normal.5a0ce600.jpg)


    ![Diagram](https://dtm.pub/assets/xa_rollback.dccc3558.jpg)
    </details>

# --Overview

# What is Seata?

distributed transaction solution  

Seata will provide users with AT, TCC, SAGA, and XA transaction models to create a one-stop distributed solution

## AT Mode

### Overall mechanism

Evolution from the two phases commit protocol:

- Phase 1：commit business data and rollback log in the same local transaction, then release local lock and connection resources.
- Phase 2：
  - for commit case, do the work asynchronously and quickly.
  - for rollback case, do compensation, base on the rollback log created in the phase 1.
  

### Write isolation

- The **global lock** must be acquired before committing the local transaction of phase 1.
- If the **global lock** is not acquired, the local transaction should not be committed.
- One transaction will try to acquire the **global lock** many times if it fails to, but there is a timeout, if it's timeout, rollback local transaction and release <mark>local lock</mark> as well.

<span style='font-size: 15px;'>**For example**</span>  

Two transactions tx1 and tx2 are trying to update field m of table a. The original value of m is 1000.

tx1 starts first, begins a local transaction, acquires the local lock, do the update operation: m = 1000 - 100 = 900. tx1 must acquire the **global lock** before committing the local transaction, after that, commit local transaction and release local lock.

next, tx2 begins local transaction, acquires local lock, do the update operation: m = 900 - 100 = 800. Before tx2 can commit local transaction, it must acquire the **global lock**, but the **global lock** may be hold by tx1, so tx2 will do retry. After tx1 does the global commit and releases the **global lock**, tx2 can acquire the **global lock**, then it can commit local transaction and release local lock.

<details>
<summary>diagram</summary>

![alt](https://img.alicdn.com/tfs/TB1zaknwVY7gK0jSZKzXXaikpXa-702-521.png)

</details>

See the figure above, tx1 does the global commit in phase 2 and release the **global lock**, tx2 acquires the **global lock** and commits local transaction.

<details>
<summary>diagram2</summary>

![alt](https://img.alicdn.com/tfs/TB1xW0UwubviK0jSZFNXXaApXXa-718-521.png)

</details>


See the figure above, if tx1 wants to do the global rollback, it must acquire local lock to revert the update operation of phase 1.

However, now the local lock is held by tx2 which hopes to acquire the global lock, so tx1 fails to rollback, but it would try it many times until it's timeout for tx2 to acquire the global lock, then tx2 rollbacks local transaction and releases local lock, after that, tx1 can acquire the local lock, and do the branch rollback successfully.

Because the global lock is held by tx1 during the whole process, there isn't no problem of dirty write.

### Read isolation

<span style='font-size: 15px;'>**`SELECT FOR UPDATE`**</span>  
在并发访问数据库时，SELECT FOR UPDATE 可以作为一种悲观锁机制，防止其他事务修改当前事务正在读取的数据行。一旦执行了带有 FOR UPDATE 子句的 SELECT 查询，被选中的行就会被锁定，直到当前事务结束（提交或回滚）。

<details>
<summary>diagram</summary>

![alt](https://img.alicdn.com/tfs/TB138wuwYj1gK0jSZFuXXcrHpXa-724-521.png)

</details>

# Seata Terminology

- TC - Transaction Coordinator  
Maintain status of global and branch transactions, drive the global commit or rollback.

- TM - Transaction Manager  
Define the scope of global transaction: begin a global transaction, commit or rollback a global transaction.

- RM - Resource Manager  
Manage resources that branch transactions working on, talk to TC for registering branch transactions and reporting status of branch transactions, and drive the branch transaction commit or rollback.

# -User Doc

# Quick start

https://seata.apache.org/docs/user/quickstart

run the [springboot-seata](https://github.com/apache/incubator-seata-samples/tree/master/at-sample/springboot-seata)



