# 配置中间表检查--User视图
Last Update : 20200701

## 输入
 - config/comm.cfg/
    - cvBSVersion
    - ProjectID
    - Database
 - config/middleTable/DataCheck/%Database%/middleCheckDefault.yaml
 - config/middleTable/DataCheck/%Database%/%cvBSVersion%/middleCheckProject.yaml
 - config/middleTable/DataCheck/%Database%/%cvBSVersion%/priceCheckSql.yaml
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
2. 按照文件，Topic，Title检查
    1. 在文件名列表中，选择需要检查的文件；如果选择好文件，就直接点击'检查选中的部分'按钮，那就会把这个文件下的所有的允许的Topic进行遍历检查；
    2. 在Topic列表中，选择需要检查的Topic；如果选择好Topic，就直接点击'检查选中的部分'按钮，那就会把这个文件下的所有的Title进行遍历检查；
    3. 在Title列表中，选择需要检查的Title

#### 导出结果
导出结果功能是将检查的结果导出成excel
1. 可以导出失败的部分
2. 可以导出所有的检查结果

#### 上一步
默认中间表数据检查的上一步是：从Excel导入数据库。点击该按钮，会显示"从Excel导入数据库"功能界面。

#### 下一步/数据配置
默认中间表数据检查的下一步是：数据配置。 点击该按钮，会直接显示"数据配置"功能界面
#### 关闭