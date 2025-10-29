# 配置中间表检查--DEV视图
Last Update : 20200701

## 编写好sql以后必须要做
使用菜单：初始化-> InternalCheck功能，进行全部检查

## 配置文件目录
> config->middleTable->DataCheck->%DataBase -> %cvbsVersion

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