reLoadOrigData: N   #是否重新获取原始数据到中间表dc_python_templet_detail中，如果为Y会先清空所有的中间表
cleanTable: N    #是否需要清空所有中间表，不会清空中间表dc_python_templet_detail
MidTableList:
    #中间表的表名
    - dc_python_templet_detail    #保存原始数据的中间表放在所有其它中间表的前面
    - dc_python_templet_md5
    - dc_python_templet_merge
    - dc_python_templet_var_detail
    - dc_python_script_param_detail
    - dc_python_templet_func_detail

#测试开关，如果为Y则会将处理前的脚本和处理后的脚本都输出到文件中
TestFlag:
    TestFlag = Y

CatalogNameTepe:
    #配置哪些是前台的python，哪些是后台的python
    web: ['OP','OTC_BENEFIT', 'OTC_ACM']
    ocs: ['UP_RULE', 'RP', 'UE_ACM', 'RE_ACM', 'UE_BENEFIT', 'RE_BENEFIT', 'RE_PRICE_PLAN', 'SORT_RULE', 'DP_RULE']

RuleControl:
    #配置规则执行的先后顺序
    - firstStringReplace
    - firstSpecialStringReplace
    - funcParam2VarParam
    - renameVarName
    - addLineCode
    - addVarName
    - secondStringReplace
    - secondSpecialStringReplace
    - deleteVarName
    - clearNoUseVar

saveImportFlag: Y

templetFilePath: /ztesoft/app/r13/template/