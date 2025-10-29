# 内部配置脚本配置文件检查

标签（空格分隔）： 未分类

Last Update : 20200623

## 主界面
![内部脚本全部检查](doc/FunctionDescription/img/01/02-内部脚本检查.png)

## 基本功能说明
扫描所有的配置文件，配置脚本，保证程序运行的时候的正确性；把之前发现过的错误，导致程序异常，功能错误的问题提前发现，提前规避。

## 输入
所有的配置脚本，配置文件
> config目录和子目录下所有的脚本
    
## 输出 
1. 数据库表：
select * from DC_PRICE_CHECK_RESULT_SELFTAB where check_topic='before_check';
   + 可以检查check_result这个字段
      - 如果为0 是表示正常的。没有问题；
      - 如果有-1 表示sql有问题，或者功能有问题；
      - 如果>0 表示检查出问题了，数值如果为999，只是表示有问题。
2. 界面输出，检查结果；只有有问题的数据才会在界面上显示。
   + 只需要检查Error的内容；


## 功能详细说明：目前的检查内容
1. 检查"配置好的数据检查"对应的脚本：
   + 检查sql中的注释的规范性：不能有 '#'、 '--'、 '；'
   + 检查Title是否有重复的情况
   + 检查文件checkDefault.yaml中的内容，必须有：export_result
   + 检查文件checkDefault.yaml中的内容，必须有：check_title_all_list
   + 检查checkDefault.yaml中的check_title_all_list里面的格式和正确性
   + 检查sql语句中是否有"'%" 而且不是"'%%" 这样的；检查是"%'"这样，而且不是"%%'" 这样的
   + 检查sql语句中是否有"%"" 而且不是"%%"" 这样的；检查是"%""这样，而且不是"%%"" 这样的
   + 检查Topic是否合法，是否在允许的列表之内（其实是担心拼写错误）

2. 检查"数据配置"功能对应的脚本：
   + 检查data_config目录中的文件reserve_table和dst_table不能重复
   + 检查data_config目录中的文件正常都应该有mid_table和dst_table
   + 检查sql中不能有';'
   + 检查sql语句中是否有"'%" 而且不是"'%%" 这样的；检查是"%'"这样，而且不是"%%'" 这样的
   + 检查sql语句中是否有"%"" 而且不是"%%"" 这样的；检查是"%""这样，而且不是"%%"" 这样的

3. 检查"检查中间表的数据"对应的脚本：
   + 检查sql中的注释的规范性：不能有 '#'、 '--'、 '；'
   + 检查Title是否有重复的情况
   + 检查文件middleCheckDefault.yaml中的内容, 必须有必须有export_result

4. 检查"数据初始化"功能对应的脚本：
   + 检查是否有create_list这个Topic
   + 检查create 下的列和create_list的长度是否一致
   + 检查create 中的内容，是否在create_list中都有
   + 检查create_list中的内容，在create中都有
   + 检查create_list的第三个值，必须是self.my_dao_deal.database_entity_list中的一个
   + 检查create_list的第一个值，Topic，必须是大写
   + 检查数据初始化的Title不是DC_开头的，命名规范的要求
   + 检查数据初始化的create_list中的value_list中的字段的相关检查
      - 是否在对应的表的创建语句中都有对应的字段
      - create_list的第4个字段如果不是value_list也需要报错
      - 检查列名是否在创建的表中是否存在
      - 列名需要大写
      - 列名下的内容需要是字典形式
      - 列名下必须有2个字段，'TYPE'和'SOURCE'字段
      - TYPE的取值目前只有2个，一个是list，一个是sql
   + 检查数据初始化的配置文件的create的内容正确性
      - 检查create中comments中的实体是否存在，存在修改遗漏的情况，comments一个不存在的列
      - 检查topic是否在create的语句中存在，存在topic名和crete名不一致的情况
      - 检查所有的create中是否有重复的Title
      - 检查sql语句中是否有"'%" 而且不是"'%%" 这样的；检查是"%'" 这样，而且不是"%%'" 这样的
      - 检查sql语句中是否有"%"" 而且不是"%%"" 这样的；检查是"%"" 这样，而且不是"%%"" 这样的
