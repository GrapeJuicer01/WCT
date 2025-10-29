createSql: None

selectSql:
    ORIG_PYTHON_SCRIPT_DATA:
        #获取所有的python脚本，存入中间表中
        "select * from dc_python_templet_detail_total"

    scriptInfo:
        #从中间表获取要分析的数据
        #"select a.catalog_name, a.script_templet_id, a.rule_script from dc_python_templet_detail a where script_templet_id in (8361135376) order by a.catalog_name, a.script_templet_id"
        "select a.catalog_name, a.script_templet_id, a.rule_script from dc_python_templet_detail a order by a.catalog_name, a.script_templet_id"
    scriptTempletInfo:
        #模板列表，表名可变，但字段不能变
        #"select a.catalog_name, a.script_templet_id, a.script_templet_name, a.new_templet_tail from dc_python_templet_done a where script_templet_id in (161533, 161532, 193119, 114161) and catalog_name in ('OTC_BENEFIT', 'OP')"
        "select a.catalog_name, a.script_templet_id, a.script_templet_name, a.templet_tail from dc_python_templet_done a where a.script_templet_name is not null and a.flag = 1"

    pythonTempletVarDetail:
        "select var_name, var_value, data_type from dc_python_templet_var_detail where catalog_name = :catalog_name and script_templet_id = :script_templet_id"

    pythonTempletMapping:
        #"select a.catalog_name, a.script_templet_id, a.script_id from dc_python_templet_merge a, dc_python_templet_done b where a.catalog_name = b.catalog_name and a.script_templet_id=b.script_templet_id and b.script_templet_id in (11829) and b.catalog_name in ('OTC_BENEFIT')"
        "select a.catalog_name, a.script_templet_id, a.script_id from dc_python_templet_merge a, dc_python_templet_done b where a.catalog_name = b.catalog_name and a.script_templet_id=b.script_templet_id and b.script_templet_name is not null and b.flag = 1"

updateSql:
    DELETE:
        scriptParamDetail:
            "delete from dc_python_script_param_detail a where a.catalog_name = :catalog_name and a.script_templet_id = :script_templet_id and a.script_id = :script_id"
    INSERT:
        #变量的顺序一定要和取变量值的顺序一致，否则数据会乱
        pythonTempletDetail:
            "insert  /*+ append */into dc_python_templet_detail(catalog_name, script_templet_id, script_templet_name, rule_script)
            values(:catalog_name, :script_templet_id, :script_templet_name, :rule_script)"
        pythonTempletVarDetail:
            "insert  /*+ append */into dc_python_templet_var_detail(catalog_name, script_templet_id, var_name, var_value, data_type, var_value_ext)
            values(:catalog_name, :script_templet_id, :var_name, :var_value, :data_type, :var_value_ext)"
        pythonTempletFuncNameDetail:
            "insert  /*+ append */into dc_python_templet_func_detail(catalog_name, script_templet_id, func_name, remark)
            values(:catalog_name, :script_templet_id, :func_name, :remark)"
        pythonTempletAttrDetail:
            "insert  /*+ append */into dc_python_templet_attr_detail(catalog_name, script_templet_id, attr_id, remark)
            values(:catalog_name, :script_templet_id, :attr_id, :remark)"
        pythonTempletMd5:
            "insert  /*+ append */into dc_python_templet_md5(catalog_name, script_templet_id, templet_tail, md5_script, rule_script, md5)
            values(:catalog_name, :script_templet_id, :templet_tail, :md5_script, :rule_script, :md5)"
        pythonTempletMerge:
            "insert  /*+ append */into dc_python_templet_merge(md5, CATALOG_NAME, TEMPLET_COUNT, SCRIPT_TEMPLET_ID, SCRIPT_ID)
            values(:md5, :CATALOG_NAME, :TEMPLET_COUNT, :SCRIPT_TEMPLET_ID, :SCRIPT_ID)"
        scriptParamDetail:
            "insert  /*+ append */into dc_python_script_param_detail(catalog_name, script_templet_id, script_id, script_templet_name, script_content, script_param, templet_tail, content_md5)
            values(:catalog_name, :script_templet_id, :script_id, :script_templet_name, :script_content, :script_param, :templet_tail, :content_md5)"

    UPDATE:
        SqlUpdate:
            2changeNegtiveVal:
                "update dc_python_templet_var_detail a
                   set a.var_value = -1
                 where a.catalog_name = 'OTC_ACM'
                   and a.var_name = 'negtiveVal'
                   and a.script_templet_id in
                       (select b.script_id
                          from dc_python_templet_merge b
                         where b.catalog_name = a.catalog_name
                           and b.script_templet_id in
                               (select c.script_templet_id
                                  from dc_python_templet_merge c
                                 where c.script_id = 3018
                                   and c.catalog_name = a.catalog_name))"
