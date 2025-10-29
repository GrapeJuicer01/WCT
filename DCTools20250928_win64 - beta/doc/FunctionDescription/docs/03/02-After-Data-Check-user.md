# 检查资费--User视图
Last Update : 20200628

## 输入
 - config/comm.cfg/
    - cvBSVersion
    - ProjectID
    - Database
 - config/dataconfiguration/DataCheck/%Database%/%cvBSVersion%/checkDefault.yaml
 - config/dataconfiguration/DataCheck/%Database%/%cvBSVersion%/data_check_project.yaml
 - config/dataconfiguration/DataCheck/%Database%/%cvBSVersion%/priceCheckSql.yaml
    - 这个文件是一个example文件
    - 这种文件可以随便新增，程序会遍历，但是格式有对应的要求。

## 输出
 - GUI界面上
 > 界面上只会显示Error部分，发现的问题会显示
 - DC_price_check_result_selftab这个表里的检查数据;
    - check_result的值，只要有数据不等于0 的就都是有问题的;
    > 值== -1 : 表示是代码或者sql有问题
    >
    > 值>0 : 表示检查出有问题的数据的个数（或者是一个固定的值，只是表示有问题）

## 功能详细说明

#### 检查方式：
1. 按顺序检查所有：所有文件和里面的内容
2. 按照Topic检查：按照对应的Topic，遍历所有文件进行检查
3. 按照文件，Topic，Title检查
    1. 在文件名列表中，选择需要检查的文件；如果选择好文件，就直接点击'检查选中的部分'按钮，那就会把这个文件下的所有的允许的Topic进行遍历检查；
    2. 在Topic列表中，选择需要检查的Topic；如果选择好Topic，就直接点击'检查选中的部分'按钮，那就会把这个文件下的所有的Title进行遍历检查；
    3. 在Title列表中，选择需要检查的Title

#### 导出结果
导出结果功能是将检查的结果导出成excel
1. 可以导出失败的部分
2. 可以导出所有的检查结果

#### 上一步
默认配置好的数据检查的上一步是：数据配置。点击该按钮，会显示"数据配置"界面。

#### 获取所有条目
这个功能是给使用者去直接获取这个工具中已经有的所有的检查的条目，并且根据用户的选择，将选择好的条目保存在一个新的文件中。
或者也可以定位成是脚本开发者来使用的功能

#### 关闭