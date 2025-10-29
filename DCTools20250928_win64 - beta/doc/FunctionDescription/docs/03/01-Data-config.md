# 数据配置具体动作

标签（空格分隔）： 未分类

Last Update : 20200623


输入
--
 - config/dataconfiguration/DataConfig/%DataBase/%cvbsVersion/configComm.yaml
 - config/dataconfiguration/DataCheck/%DataBase/%cvbsVersion/configProject.yaml
 - 以上文件是预置的文件，不能删除，内容和格式都有要求
 - 文件夹里面的文件都可以遍历，但是要求必须在configComm.yaml中做顺序编排

    
输出 
--

 - 具体的业务配置表，根据写的sql


配置文件的要求
--
> 要求
 1. Topic，有一个保留的： param_list
 2. title，有3个保留的：dst_table，mid_table，reserve_table
    >>
    2.1 dst_table: 就是目标表，要配置的目标表；
    >>
    2.2 mid_table: 就是我们自己的中间表；
    >>
    2.3 reserve_table: 表示这个表是一个域表（其实就是半域表）.这个里面的表和dst_table中不能重复
    >>
 ```angular2html
param_list:
  exampleNode: 
    parameter1:
      "1"
    parameter2:
      "2"  
 
exampleNode:
  dst_table:
    - DC_TEST001

  mid_table:
    - DC_TEST002

  reserve_table:
    DC_test003:
        "select * from DC_test003 where check_item>'1'"
          
  insert_node1:
    "insert into DC_test003 values('1','1','1')"
  insert_node2:
    - "insert into DC_test002 values('4','4','4')"
    - "insert into DC_test002 values('3','3','3')"
  insert_node3:
    - insert into DC_test003 values('3','3','3')
    
 ```
3. 每个文件中的执行的内容都是按顺序执行的，而文件的执行顺序是依赖于configComm