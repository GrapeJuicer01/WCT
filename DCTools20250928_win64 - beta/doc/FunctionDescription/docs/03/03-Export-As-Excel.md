# 导出配置数据为Excel格式

标签（空格分隔）： 未分类

Last Update : 20200623

## 主界面
![导出生成Excel文件](doc/FunctionDescription/img/03/02_导出生成Excel文件.png)

## 基本功能说明
将配置好的数据，导出成各种Excel文件，供其他人直接审阅

## 输入
- 数据库里业务配置数据
- 写好的查询脚本
    
## 输出 
按照脚本，生成的excel文件
> config->dataconfiguration->ExportToFile->%DataBase -> %cvbsVersion


## 功能详细说明
- 部分导出
   1. 先点击"获取文件列表"按钮；
   2. 在文件名列表中，选择需要导出的文件；如果选择好文件，就直接点击"导出选中的内容"按钮，那就会把这个文件下的所有的允许的Topic进行遍历导出；
   3. 在Topic列表中，选择需要导出的Topic；如果选择好Topic，就直接点击"导出选中的内容"按钮，那就会把这个文件下的所有的Title进行遍历导出；
   4. 在Title列表中，选择需要导出的Title

- 全部导出
   1. 会将配置目录下的所有的文件进行遍历，全部导出
