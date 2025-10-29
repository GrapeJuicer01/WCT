# 检查资费--DEV视图
Last Update : 20200706


## 编写好sql以后必须要做
使用菜单：初始化-> InternalCheck功能，进行全部检查

## 配置文件目录
> config->dataconfiguration->DataCheck->%DataBase -> %cvbsVersion

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

## 配置文件的要求

 1. 可以有3种节点：BadData，ErrorData, WarningData
    1. ErrorData: 要求只要发现，就一定是业务的错误；要求数据从配置环境导出，这个检查结果必须为0
    2. BadData: 有垃圾数据的感觉，有问题，但是不影响功能；
       > Example：事件有资费，但是分拣没有输出。
    3. WarningData：因为一些版本的差异，这个数据有可能和之前版本不一致；
       > 例子：V9增加了一个检查检查空值的比较。在V9 变量!=1.如果变量为空，这个判断的结果是True;而V8而言，可能这个结果就会返回False，因为变量为空，所以直接范围False了
 2. 暂时定义严重等级： ErrorData > BadData > WarningData
 3. 如果一些检查脚本中有这个项目专用的值，要求放在data_check_project的对应的项目中。只有所有项目100%不用修改直接使用的语句才可以放在别的地方；
 4. 根据需要可以进行文件的增加，但是请使用priceCheckSql.yaml做为模板。格式很重要
 5. 所有的Title在编写好以后，都需要在checkDefault.yaml 的 check_title_all_list 中，增加这个条目
  ```angular2html
    AcctItem_No_Define:
        des: AcctItem_No_Define
        topic: BadData
        area: comm
 ```
> AcctItem_No_Define, 这个命名就是Title，des，用来做汉字描述，是给人看的. area,就只有comm或者项目的编号，比如A002
## 获取工具中的已有的检查条目
#### 功能说明
 1. 界面打开的时候，会根据本版本+项目已有的检查条目，暂时过滤掉。
 
 #### 界面上的功能说明
 1. 显示全部：
> 不过滤相同的条目，显示所有的检查条目
 2. 筛选条件：
> 在下面的表格中，用各种条件过滤掉一些条目
 3. 表格界面选择（点击）:
> 直接在表格中，鼠标点击，选中需要同步的条目。
 4. 清空选项：
> 清空： 所有的筛选条件 + 显示全部的选择框去掉  + 所有的表格中的选中的条目
 5. 同步到本版本：
> 根据用户在界面的表格中选中的条目，生成一个新的文件；

#### 界面截图
![获取工具中的已有的检查条目](doc/FunctionDescription/img/03/03_获取工具中的已有的检查条目.png)
 