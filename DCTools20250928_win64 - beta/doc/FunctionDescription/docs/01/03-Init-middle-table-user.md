# 初始化配置中间表-User视图

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

