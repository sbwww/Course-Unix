# Unix

## 1. 基础

### 1.1. 安全性

- 用户管理
- 系统结构保护
- 文件权限管理

### 1.2. 发展节点

- 1960s 雏形
  - 汇编
- 1978 第 7 版
  - 绝大多数 C 语言，小部分汇编
- 1980s 商业化
  - 版本繁多
- 1988 标准化
  - 统一

### 1.3. 开源

- 定义
  - 使用
  - 阅读源码
  - 分发拷贝
  - 改进
- 典型成果
  - Linux

## 2. 命令

### 2.1. 格式

- ```shell
  Command [-options] [arguments]
  ```

### 2.2. 常见

- ls
  - `ls -a` 列出所有文件
  - `ls -l` 列出文件详细信息
  - `ls -R` 递归列出子目录的文件
- cat
  - `cat file` 显示文件内容
  - `cat a b` 先显示 a 再显示 b
  - `cat a b > c` 将 a 与 b 内容连接，写入新文件 c
  - `cat > a` 标准输入（键盘）内容写入新文件 a
- chmod
  - `chmod ugo +rwx file`
    - u 属主，g 同组用户，o 其他用户
    - r 读，w 写，x 执行
  - `chmod 777 file`
    - 每一个数字表示一组权限
      - u = 7
        - r = 1
        - w = 1
        - x = 1
      - g = 7
      - o = 7
- cd
  - `cd ..` 上一级目录
- rm
  - `rm file` 删除 file
  - `rm -r dire` 递归删除 dire 目录中的文件

### 2.3. 目录操作

- mkdir
- rmdir

### 2.4. 文件操作

- find
  `find [dir] [expression]`
  - `[expression]`
    - `-name filename` 按文件名，e.g., `-name "*.c|*.cpp"`
    - `-type [d or f]` 按类型，d 为目录，f 为普通文件
    - `-atime` 按访问时间，e.g., `-atime +14` 两周前访问
    - `-mtime` 按修改时间
    - `-exec Cmd { } \;` 对找到的文件执行 Cmd 的命令
  - `[dir]` 查找目录
- grep
  `grep [options] pattern file`
  - `pattern` 正则表达式模式
  - `[options]`
    - `-i` 不区分大小写
    - `-v` 显示不匹配的
    - `-c` 显示匹配的行数
    - `-n` 显示行号

## 3. 文本文件

### 3.1. vi

- `vi filename` 进入 vi 编辑的命令行方式
- 命令行方式
  - 移动光标
    - `h` 左
    - `j` 下
    - `k` 上
    - `l` 右
  - 编辑操作
    - `x` 删除字符
    - `u` 撤销操作
  - 模式切换
    - `i` 进入插入编辑方式
    - `:` 进入末行命令方式
- 插入编辑方式
  - 模式切换
    - ESC 键退回命令行方式
- 末行命令方式
  - `:wq` 保存退出
  - `:q` 退出

## 4. Shell

### 4.1. 标准流

- 文件描述符
  - 0 标准输入 -> 键盘
  - 1 标准输出 -> 显示器
  - 2 标准错误 -> 显示器
- 重定向
  - \< 输入重定向
  - \> 输出重定向

### 4.2. **B**ourne

- 标准 UNIX 的 Shell
- \$

### 4.3. **C**

- 与 C 语言相似
- \%

### 4.4. **K**orn

- B Shell 的扩展
  - B Shell 开发可以直接在 K Shell 运行
- \$

## 5. Shell 程序设计

### 5.1. 变量

- `${var}` 变量的值
  - `echo $var`
    - 结果为 `a`
- `' '` 纯字符串
  - `echo 'var=$var'`
    - 结果为 `var=$var`
- `" "` 字符串，并且解释特殊字符
  - `echo "var=$var"`
    - 结果为 `var=a`
- `` ` ` `` 命令执行结果的值
  - `` echo `expr 1 + 1` ``
    - 结果为 `2`

### 5.2. test 命令

- 字符串
  - `test s` 非空测试
  - `test s1 = s2` 相等测试
- 整数
  - `test a1 -eq a2` 相等测试
  - `test a1 -gt a2` 大于测试
  - `test a1 -ge a2` 大于等于测试
- ==注意，真值是0！==

### 5.3. 条件控制

- if

  - 根据条件中的表达式判断

    - ```shell
        if [condition]
            then
        elif [condition]
            then
        else
        fi
      ```

- case

  - 根据模式判断

    - ```shell
        case word in
            pattern-1) commands;;
            pattern-2) commands;;
            *) commands;;
        esac
      ```

### 5.4. 循环

- for

  - 类似 foreach

    - ```shell
        for var in list-of-values
        do
            commands
        done
      ```

- while

  - 条件为假时停止

    - ```shell
        while [condition]
        do
            commands
        done
      ```

- until

  - 条件为真时停止

    - ```shell
        until [condition]
        do
            commands
        done
      ```

## 6. UNIX 系统编程

### 6.1. C 编程

- gcc
  - 编译
    - `gcc –c test1.c [test2.c ...]`
    - 将 test1.c 和 test2.c 等编译为 test1.o 和 test2.o 等
  - 链接
    - `gcc –o test test1.o [test2.o ...]`
    - 将 test1.o 和 test2.o 等连接为可执行的二进制文件 test
  - 运行
    - `./test`
  - 一步到位
    - `gcc test.c -o test && ./test`
- Makefile

  - ```makefile
    f1: f1.o f2.o f3.o
        gcc -o f1 f1.o f2.o f3.o
    ```

  - ```makefile
    f1.o: f1.c def.h
        gcc -c f1.c
    ```

  - ```makefile
    f2.o: f2.c
        gcc -c f2.c
    ```

  - ```makefile
    f3.o: f3.c
        gcc -c f3.c
    ```

  ```mermaid
  graph TB
  0((def.h)) --> 1((f1.c)) --> 2((f1.o)) --> 3((f1))
  4((f2.c)) --> 5((f2.o)) --> 3
  6((f3.c)) --> 7((f3.o)) --> 3
  ```

## 7. 文件管理系统

### 7.1. 透明存取

- 给出文件名和所在路径
- 无需了解物理结构和组织方式

### 7.2. 特殊目录

- `/usr/bin`
  - 用户命令（sh, ls 这种），二进制文件
- `/usr/sbin`
  - 系统命令（系统启停，网络管理 这种），二进制文件
- `/usr/lib`
  - 用户使用的**程序库**和系统**数据库**
- `/home`
  - 所有用户的注册目录

### 7.3. 倒树结构

### 7.4. 安装卸载

- mount
  `mount [-options] filesystem mountpoint`
  - `-options`
    - `-r` 只读
    - `-w` 可读可写
  - `filesystem` 通常是磁盘或磁盘分区的名称
- umount
  `umount [-options] filesystem`

## 8. 进程管理

### 8.1. 动态优先级

- 优先**数越大**，优先**级越低**
- 优先数
  - $P_{-pri}=P_{-cpu}/2+PUSER+P_{-nice}+NZERO$
    - 常量 $PUSER$，$NZERO$
    - $P_{-cpu}$ 最近一个时段中使用 CPU 的时间
    - $P_{-nice}$ 优先数偏置值，一般只增不减
  - 使用的 CPU 时间越长，优先数越大，优先级越低

## 9. 存储管理

### 9.1. 管理方式

- 连续分配
- 覆盖和交换
- 页面管理
  - 进程页表
    - 每个进程有一个
    - 逻辑页号和物理页号的对应
  - 请求表
    - 系统有一个
    - 各个进程的页表个数和内存中的位置
  - 存储页表
    - 系统有一个
    - 指示内存页面是否被分配
- 段式管理
  - 段号
  - 段内相对偏移量

### 9.2. 虚拟存储

- 局部性原理
  - 时间
  - 空间
- 方式
  - 段式
  - 页式
  - 段页式
- 页面置换
  - 先进先出 FIFO
  - 最近最少使用 LRU
    - 最久没有被使用过的
  - 最近未使用 NRU
    - LRU 与 FIFO 的结合
      - 在一个时间内未使用过的
  - 最不常用 LFU
    - NRU 改进版
      - NRU 随机选择一个未使用过的，LFU 进一步选择使用频率低的
  - 最佳 Optimum
    - 理想方法，难以实现
  - 时钟页面置换 Clock

### 9.3. 存储管理策略

- 交换策略
- 请求调页策略
  - 访问到不在内存的页面时，发出**缺页中断**请求

## 10. 进程通信

### 10.1. 信号 Signal

- 信号生成
  - 生成信号的事件
    - 程序错误
    - 外部事件
    - 显示请求
- 信号捕捉
  - `signal(SIG_xxx, fun())`
    - 捕获信号，并执行 `fun()`

### 10.2. UNIX 的 IPC

- 消息队列
  - 创建或指定
    `int msgget(key_t key, int msgflg)`
  - 将消息放到消息队列上
    `int msgsnd(int msgqid, const void *ptr, size_t nbytes, int msgflg)`
    - `msgqid` 消息队列描述符
      由 `msgget()` 返回
    - `ptr` 指向消息类型和字符数组的指针
    - `nbytes` 数组大小
  - 接收消息
    `int msgrcv(int msgqid, void *ptr, size_t nbytes, long type, int msgflg`
    - `type` 用户想读取的消息类型
  - 对消息队列操作
    `int msgctl(int msgqid, int cmd, struct msgid_ds *buf)`
    - `cmd`
      - `IPC-STAT`
        返回状态
      - `IPC-SET`
        改变所有者、组名、模式
      - `IPC-RMID`
        删除 `msgqid` 对应的消息队列项
  - 服务器端和客户端通信
- 共享存储区
- 信号**量**（semaphore）
  - 一种程序设计方法
  - P、V 操作
