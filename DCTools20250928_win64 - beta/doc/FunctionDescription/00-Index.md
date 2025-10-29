# 数据配置工具功能说明

标签（空格分隔）： 简单的功能说明 

LastUpdate: 20200623

索引
---
<a href="#快速指南">快速指南</a>

<a href="#功能全列表">功能全列表</a>

<a href="#主界面">主界面图片</a>

---

<a name="快速指南">快速指南</a>
-
1. 修改comm.cfg的配置文件中的
    + cvBSVersion: V81
    + ProjectID: A002（参考AllProject.yaml）
    + Database: 值从备注中获取；目前支持"Oracle", "Mysql", "Udal", "Drds"
2. 如果是Oracle数据库，修改tnsnames.ora文件，增加自己特定的TNS
3. 打开软件，运行DCTools.exe，进行对应的功能操作；


<a name="功能全列表">功能全列表</a>
-
### 一、初始化:
   1. 登录数据库
   2. [内部检查功能](doc/FunctionDescription/docs/01/02-before-inter-check.md)
   3. [初始化配置中间表](doc/FunctionDescription/docs/02/03-Init-middle-table.md)
   4. 清空日志
   5. 日志另存为
### 二、配置中间表:
   1. [检查配置中间表的数据](doc/FunctionDescription/docs/02/01-Middle-data-check.md)
   2. 导出生成配置模板
   3. 从Excel导入到配置中间表
   
### 三、数据配置：
   1. [数据配置](doc/FunctionDescription/docs/03/01-Data-config.md)
   2. [检查系统中的配置好的数据](doc/FunctionDescription/docs/03/02-After-Data-Check.md)
   3. [导出部分配置好的数据为Excel](doc/FunctionDescription/docs/03/03-Export-As-Excel.md)
   4. 配置回滚（功能未开发）
   
### 四、数据发布：
   1. [导出数据生成文件](doc/FunctionDescription/docs/04/01-Tables-Export.md)
   2. [导入数据文件](doc/FunctionDescription/docs/04/02-Tables-Import.md)
   3. 增量导出
   
### 五、其他功能：
   1. Python优化
   2. 导出分拣成xml文件
   3. 导入分拣
   4. 静态数据统计比较
   5. 序列管理
   6. DCC编码解析
   7. CDR编码解析
   
### 六、About：
   1. [寻求技术支持](doc/FunctionDescription/docs/06/01-Find-Support.md)

<a name="主界面">主界面</a>
-
### Windows版本的工具主界面
![DCTools主界面Window](http://gitlab.iwhalecloud.com/DC/DCTools/-/blob/master/doc/FunctionDescription/img/00/01-主界面.png)
