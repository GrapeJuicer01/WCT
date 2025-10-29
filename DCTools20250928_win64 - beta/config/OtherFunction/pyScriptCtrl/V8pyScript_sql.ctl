createSql: None

selectSql:
    ORIG_PYTHON_SCRIPT_DATA:
        #获取所有的python脚本，存入中间表中
        "select 'OP' catalog_name, a.op_id script_templet_id, ' ' rule_script_name, a.rule_script
from op a, price b, price_ver c, rate_plan d, offer_ver ppv, offer pp
where dbms_lob.getlength(a.rule_script) > 0
  and a.op_id = b.price_id
  and b.price_ver_id = c.price_ver_id
  and c.rate_plan_id = d.rate_plan_id
  and d.OFFER_VER_ID = ppv.OFFER_VER_ID
  and ppv.offer_id = pp.offer_id
  and pp.state = 'A'
  and (ppv.exp_date > to_date('20210101', 'YYYYMMDD') or ppv.exp_date is null)
  and (c.exp_date > sysdate or c.exp_date is null)
union all
select 'RP' catalog_name, a.rp_id script_templet_id, ' ' rule_script_name, a.rule_script
from rp a, price b, price_ver c, rate_plan d, offer_ver ppv, offer pp
where dbms_lob.getlength(a.rule_script) > 0
  and a.rp_id = b.price_id
  and b.price_ver_id = c.price_ver_id
  and c.rate_plan_id = d.rate_plan_id
  and d.OFFER_VER_ID = ppv.OFFER_VER_ID
  and ppv.offer_id = pp.offer_id
  and pp.state = 'A'
  and (ppv.exp_date > to_date('20210101', 'YYYYMMDD') or ppv.exp_date is null)
  and (c.exp_date > sysdate or c.exp_date is null)
union all
select 'UP_RULE' catalog_name, a.up_id script_templet_id, ' ' rule_script_name, a.rule_script
from up_rule a, price b, price_ver c, rate_plan d, OFFER_VER ppv, offer pp
where dbms_lob.getlength(a.rule_script) > 0
  and a.up_id = b.price_id
  and b.price_ver_id = c.price_ver_id
  and c.rate_plan_id = d.rate_plan_id
  and d.OFFER_VER_ID = ppv.OFFER_VER_ID
  and ppv.offer_id = pp.offer_id
  and pp.state = 'A'
  and (ppv.exp_date > to_date('20210101', 'YYYYMMDD') or ppv.exp_date is null)
  and (c.exp_date > sysdate or c.exp_date is null)
union all
select decode(d.re_type, '1', 'UE_ACM', '3', 'OTC_ACM', 'A', 'OTC_ACM',  'RE_ACM') catalog_name, a.acm_rule_id script_templet_id, ' ' rule_script_name, a.rule_script
from acm_rule a, price_ver b, rate_plan c, re d, OFFER_VER ppv, offer pp
where a.price_ver_id = b.price_ver_id
  and b.rate_plan_id = c.rate_plan_id
  and c.re_id = d.re_id
  and dbms_lob.getlength(a.rule_script) > 0
 and d.re_type in ('3', 'A')
 and c.OFFER_VER_ID = ppv.OFFER_VER_ID
  and ppv.offer_id = pp.offer_id
 and pp.state = 'A'
 and (ppv.exp_date > to_date('20210101', 'YYYYMMDD') or ppv.exp_date is null)
 and (b.exp_date > sysdate or b.exp_date is null)
 union all
 select decode(d.re_type, '1', 'UE_BENEFIT', '3', 'OTC_BENEFIT', 'A', 'OTC_BENEFIT', 'RE_BENEFIT') catalog_name, a.price_id script_templet_id, ' ' rule_script_name, a.rule_script
 from event_benefit a, price_ver b, rate_plan c, re d, OFFER_VER ppv, offer pp
 where a.price_ver_id = b.price_ver_id
 and b.rate_plan_id = c.rate_plan_id
 and c.re_id = d.re_id
 and dbms_lob.getlength(a.rule_script) > 0
 and d.re_type in ('3', 'A')
 and c.OFFER_VER_ID = ppv.OFFER_VER_ID
  and ppv.offer_id = pp.offer_id
 and pp.state = 'A'
 and (ppv.exp_date > to_date('20210101', 'YYYYMMDD') or ppv.exp_date is null)
 and (b.exp_date > sysdate or b.exp_date is null)
 union all
 select 'RE_PRICE_PLAN' catalog_name, pp.OFFER_ID*10000+a.re_id script_templet_id, ' ' rule_script_name, a.rule_script
 from re_price_plan a, re b, OFFER_VER ppv, offer pp
 where dbms_lob.getlength(a.rule_script) > 0
 and a.re_id = b.re_id
 and a.OFFER_VER_ID = ppv.OFFER_VER_ID
  and ppv.offer_id = pp.offer_id
 and (ppv.exp_date > to_date('20210101', 'YYYYMMDD') or ppv.exp_date is null)
 and pp.state = 'A'
 union all
 select 'DP_RULE' catalog_name, a.dp_id script_templet_id, ' ' rule_script_name, a.rule_script
 from dp_rule a, dp b, OFFER_VER ppv, offer pp
 where dbms_lob.getlength(a.rule_script) > 0
 and a.dp_id = b.dp_id
 and b.OFFER_VER_ID = ppv.OFFER_VER_ID
  and ppv.offer_id = pp.offer_id
 and (ppv.exp_date > to_date('20210101', 'YYYYMMDD') or ppv.exp_date is null)
 and pp.state = 'A'"

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
