# 初始化配置中间表-DEV视图

标签（空格分隔）： 未分类

Last Update : 20200623

## 输入
配置中间表初始化的所有脚本
> config->init->%DataBase -> %cvbsVersion
>
> config->init->%DataBase -> initDefault.yaml
 - config->init->%DataBase -> %cvbsVersion -> init_project.yaml
 - config->init->%DataBase -> %cvbsVersion -> check.yaml
 - 除了上面2个文件是要求的， 其他的文件可以随意增加。 任意的文件名，格式同上即可

    
## 输出 
 - 数据库的表创建
 - 数据库的存储过程创建
 
## 所有条目
  - 其实就是拷贝别的版本下的脚本进入本版本中，参考的是配置后检查的脚本拷贝功能


init下配置文件的要求
--
 要求
 ---
 1. create的表的名字一定要大写
 2. 一定要有create_list, 格式强制如下，列表分别是：topic，版本，类型（table, procedure）：
    1. VALUE_LIST是关键字，不能变，但是可以整个节点都没有；
    2. BAL_TYPE就是列名
    3. TYPE是关键字，有2个取值： sql, list
    4. SOURCE这个也是关键字，取值，要么是一段sql，要么是直接的值列表
 
 ```angular2html
create_list:
    DC_CONFIG_BASIC_BALANCE_INFO:
        - BASIC
        - V20190705
        - table
        - VALUE_LIST:
            BAL_TYPE:
                TYPE: sql
                SOURCE: select  LOOKUP_NAME from CPC.CBEC_DOMAIN_DATA where DOMAIN_TYPE_CODE='BAL_TYPE'
            IS_CURRENCY:
                TYPE: list
                SOURCE: Y,N
            REFILLABLE:
                TYPE: list
                SOURCE: Y,L,N,M
            UNIT_TYPE:
                TYPE: list
                SOURCE: Second,Byte,Occurrence
            PACK_INNER:
                TYPE: list
                SOURCE: Y,N
            EXCLUDE_PACK_INNER:
                TYPE: list
                SOURCE: Y,N
 ```
 3. DC_comm_table这个表的Version字段就是设计这个表的时间，建议每次更新表结构都手动更新一下对应的insert语句
 4. 目前建议所有的字段为Varchar2，Number这两种类型，拒绝Data这种。其他类型再具体看
 -----------------------------------
 建议
 ---
 1. 建议所有的表名节点，全部大写