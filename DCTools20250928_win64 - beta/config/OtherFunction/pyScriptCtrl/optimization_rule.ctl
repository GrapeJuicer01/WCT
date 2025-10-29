firstStringReplace:
    REGEXP:
        BOTH:
            \s*\=\s*: "="
            \s*\>\=\s*: ">="
            \s*\>\s*: ">"
            \s*\<\=\s*: "<="
            \s*\<\s*: "<"
            \s*\!\=\s*: "!="
            \s*\<\>\s*: "<>"
            \s*\*\s*: "*"
            \s*\-\s*: "-"
            \s*\+\s*: "+"
            \s*,\s*: ","
            \s*/\s*: "/"
        OnlyOcs:
            Allowance\s*\=\s*Allowance\s*\*\s*11/10: "Allowance=Allowance*110/100"
    USUAL:
        BOTH:
            "( ": "("
            " )": ")"
        OnlyWeb:
            "res=(-1)*recharge_amount": "res=recharge_amount*-1"
            "RechargeAmount=-1*RechargeAmount": "RechargeAmount=RechargeAmount*-1"
            "r.event.GetAttr(": "r.event.GetAttrEx("
            "ACM_Dynamic<=12": "ACM_Dynamic<13"
            "amount=month*30000000": "amount=month*30000000+0"
            "r.event.GetAttrEx(208)": "r.event.GetAttrEx(PROD_STATE)"
            "r.event.GetAttrEx(102)": "r.event.GetAttrEx(CYCLE_BEGIN_TIME)"
            "r.event.GetAttrEx(103)": "r.event.GetAttrEx(CYCLE_END_TIME)"
            "r.event.GetAttrEx(206)": "r.event.GetAttrEx(COMPLETED_DATE)"
            "r.event.GetAttrEx(ACCT_ID)": "r.event.GetAttrEx(211)"
        OnlyOcs:
            "r.event.GetAttrEx(970)": "r.event.GetAttrEx(PRICE_PLAN_INST_STATE)"
            "amount2=maxAmount-(total_data*amount_factor)": "amount2=maxAmount-amount1"
            "(PP_INST==0 and ACM_MSP<=3)": "(PP_INST==0 and ACM_COUNT<4)"
            "'PRICE_PLAN_ID=828041|": "'PRICE_PLAN_ID='+'828041'+'|"

funcParam2VarParam:
    #函数的某个或某些常量实参改成变量实参,需指定函数名(全名)，第几个参数，变量名，变量类型，是否只用于前台（可选，默认规则适用于前后台）,
    #where参数可配置条件，指定第几个参数等于多少时规则才生效(目前只支持第几个参数等于多少的条件)，可不配置
    1GetSubsAcmValueByAll: #关键字，可以随便取名，只要名字不重复
        FuncName: GetSubsAcmValueByAll
        Num: 1    #参数个数从1开始计数
        VarName: acmResId
        VarType: N   #N:number, F:float, C:char
        OnlyWeb: A   #Y:yes, N:no, A: all
    2GetBalValueByAcctId: #关键字，可以随便取名，只要名字不重复
        FuncName: GetBalValueByAcctId
        Num: 2    #参数个数从1开始计数
        VarName: Acct_Res_Id
        VarType: N   #N:number, F:float, C:char
        OnlyWeb: A   #Y:yes, N:no, A: all
    3SetAttrList: #关键字，可以随便取名，只要名字不重复
        FuncName: SetAttrList
        Num: 2    #参数个数从1开始计数
        VarName: param978
        VarType: C   #N:number, F:float, C:char
        OnlyWeb: A   #Y:yes, N:no, A: all
        Where: 1=978
    4GetSubsUppInstEffExpTime: #关键字，可以随便取名，只要名字不重复
        FuncName: GetSubsUppInstEffExpTime
        Num: 1    #参数个数从1开始计数
        VarName: price_plan_id
        VarType: N   #N:number, F:float, C:char
        OnlyWeb: A   #Y:yes, N:no, A: all
    5GetValueByAttrList: #关键字，可以随便取名，只要名字不重复
        FuncName: GetValueByAttrList
        Num: 2    #参数个数从1开始计数
        VarName: attrCode
        VarType: C   #N:number, F:float, C:char
        OnlyWeb: A   #Y:yes, N:no, A: all
    6AddDay: #关键字，可以随便取名，只要名字不重复
        FuncName: AddDay
        Num: 2    #参数个数从1开始计数
        VarName: extendDays
        VarType: N   #N:number, F:float, C:char
        OnlyWeb: A   #Y:yes, N:no, A: all
        CatalogName: OP
    7AddMonths: #关键字，可以随便取名，只要名字不重复
        FuncName: AddMonths
        Num: 2    #参数个数从1开始计数
        VarName: extendMonths
        VarType: N   #N:number, F:float, C:char
        OnlyWeb: A   #Y:yes, N:no, A: all
    8SetBenefitRuleCodeByName: #关键字，可以随便取名，只要名字不重复
        FuncName: SetBenefitRuleCodeByName
        Num: 2    #参数个数从1开始计数
        VarName: resultAttrId
        VarType: N   #N:number, F:float, C:char
        OnlyWeb: A   #Y:yes, N:no, A: all
    9SetBenefitRuleCodeByName: #关键字，可以随便取名，只要名字不重复
        FuncName: SetBenefitRuleCodeByName
        Num: 1    #参数个数从1开始计数
        VarName: Benefit_Code
        VarType: N   #N:number, F:float, C:char
        OnlyWeb: A   #Y:yes, N:no, A: all
    10SetAttr: #关键字，可以随便取名，只要名字不重复
        FuncName: SetAttr
        Num: 2    #参数个数从1开始计数
        VarName: reserve
        VarType: N   #N:number, F:float, C:char
        OnlyWeb: N   #Y:yes, N:no, A: all
        Where: 1=1324
        CatalogName: RE_PRICE_PLAN
    11GetSubsAcmValueByDay: #关键字，可以随便取名，只要名字不重复
        FuncName: GetSubsAcmValueByDay
        Num: 1    #参数个数从1开始计数
        VarName: acmResId
        VarType: N   #N:number, F:float, C:char
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: UE_ACM
    12GetAcctAcmCycleValue: #关键字，可以随便取名，只要名字不重复
        FuncName: GetAcctAcmCycleValue
        Num: 2    #参数个数从1开始计数
        VarName: acmResId
        VarType: N   #N:number, F:float, C:char
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: DP_RULE


renameVarName:
    1RES_ACM2ACM_COUNT:
        oldName: RES_ACM
        newName: ACM_COUNT
        OnlyWeb: Y
    2ACM_Dynamic2ACM_COUNT:
        oldName: ACM_Dynamic
        newName: ACM_COUNT
        OnlyWeb: Y
    3ACM50K_ID2acmResId:
        oldName: ACM50K_ID
        newName: acmResId
        OnlyWeb: Y
    4ACM50K2ACM_COUNT:
        oldName: ACM50K
        newName: ACM_COUNT
        OnlyWeb: Y
    5ACM20K_ID2acmResId:
        oldName: ACM20K_ID
        newName: acmResId
        OnlyWeb: Y
    6ACM20K2ACM_COUNT:
        oldName: ACM20K
        newName: ACM_COUNT
        OnlyWeb: Y
    7PRICE_PLAN_ID2PP_ID:
        oldName: PRICE_PLAN_ID
        newName: PP_ID
        OnlyWeb: Y
        #CatalogName: OTC_ACM
    8price_plan_id2PP_ID:
        oldName: price_plan_id
        newName: PP_ID
        OnlyWeb: Y
        #CatalogName: OTC_ACM
    9price_plan_id22PP_ID2:
        oldName: price_plan_id2
        newName: PP_ID2
        OnlyWeb: Y
        #CatalogName: OTC_ACM
    10ACM2ACM_COUNT:
        oldName: ACM
        newName: ACM_COUNT
        OnlyWeb: Y
    11recharge_amount2RechargeAmount:
        oldName: recharge_amount
        newName: RechargeAmount
        OnlyWeb: Y
    12ACM_PLAN2ACM_COUNT:
        oldName: ACM_PLAN
        newName: ACM_COUNT
        OnlyWeb: Y
    13ACM_Redeem2ACM_COUNT:
        oldName: ACM_Redeem
        newName: ACM_COUNT
        OnlyWeb: Y
    14ACM_1stTopUp2ACM_COUNT:
        oldName: ACM_1stTopUp
        newName: ACM_COUNT
        OnlyWeb: Y
    15ACMChangeMDN2ACM_COUNT:
        oldName: ACMChangeMDN
        newName: ACM_COUNT
        OnlyWeb: Y
    16Topup_Times2ACM_COUNT:
        oldName: Topup_Times
        newName: ACM_COUNT
        OnlyWeb: Y
    17ACM_MSP2ACM_COUNT:
        oldName: ACM_MSP
        newName: ACM_COUNT
        OnlyWeb: Y
    18ACM_TOP2ACM_COUNT:
        oldName: ACM_TOP
        newName: ACM_COUNT
        OnlyWeb: Y
    19ACM_TopUp2ACM_COUNT:
        oldName: ACM_TopUp
        newName: ACM_COUNT
        OnlyWeb: Y
    20ACM_FTU2ACM_COUNT:
        oldName: ACM_FTU
        newName: ACM_COUNT
        OnlyWeb: Y
    21ACM_REDEM2ACM_COUNT:
        oldName: ACM_REDEM
        newName: ACM_COUNT
        OnlyWeb: Y
    22ACM_PUAS2ACM_COUNT:
        oldName: ACM_PUAS
        newName: ACM_COUNT
        OnlyWeb: Y
    23ACM_PUAS_AMOUNT2ACM_COUNT:
        oldName: ACM_PUAS_AMOUNT
        newName: ACM_COUNT
        OnlyWeb: Y
    24ACM_2ndRDM2ACM_COUNT:
        oldName: ACM_2ndRDM
        newName: ACM_COUNT
        OnlyWeb: Y
    25ACM_RDM2ACM_COUNT:
        oldName: ACM_RDM
        newName: ACM_COUNT
        OnlyWeb: Y
    26ACM_Benefit2ACM_COUNT:
        oldName: ACM_Benefit
        newName: ACM_COUNT
        OnlyWeb: Y
    27ACM_CASHBACK_TOPUP2ACM_COUNT:
        oldName: ACM_CASHBACK_TOPUP
        newName: ACM_COUNT
        OnlyWeb: Y
    28ACM_1sttopup_xiaomi2ACM_COUNT:
        oldName: ACM_1sttopup_xiaomi
        newName: ACM_COUNT
        OnlyWeb: Y
    29ACM_BosKu2ACM_COUNT:
        oldName: ACM_BosKu
        newName: ACM_COUNT
        OnlyWeb: Y
    30DuaEmpatDays2extendDays:
        oldName: DuaEmpatDays
        newName: extendDays
        OnlyWeb: Y
    31DuaEmpatJam2period:
        oldName: DuaEmpatJam
        newName: period
        OnlyWeb: Y
    32Tigaenam2extendDays:
        oldName: Tigaenam
        newName: extendDays
        OnlyWeb: Y
    33TigaenamHari2period:
        oldName: TigaenamHari
        newName: period
        OnlyWeb: Y
    34DuaEmpatHour2extendDays:
        oldName: DuaEmpatHour
        newName: extendDays
        OnlyWeb: Y
    35ActivationDay2period:
        oldName: ActivationDay
        newName: period
        OnlyWeb: Y
    36BEGIN_TIME2CurrentTime:
        oldName: BEGIN_TIME
        newName: CurrentTime
        OnlyWeb: Y
    37BEGIN_TIME_HOUR2CurrentTime_Zero:
        oldName: BEGIN_TIME_HOUR
        newName: CurrentTime_Zero
        OnlyWeb: Y
    38VALIDITY_DAYS2NewExpDate:
        oldName: VALIDITY_DAYS
        newName: NewExpDate
        OnlyWeb: Y
    39prebal2balance:
        oldName: prebal
        newName: balance
        OnlyWeb: Y
    40acct_bal2balance:
        oldName: acct_bal
        newName: balance
        OnlyWeb: Y
    41current_bonus2balance:
        oldName: current_bonus
        newName: balance
        OnlyWeb: Y
    42Pre_bal2balance:
        oldName: Pre_bal
        newName: balance
        OnlyWeb: Y
    43TT_BALANCE2balance:
        oldName: TT_BALANCE
        newName: balance
        OnlyWeb: Y
    44balance22balance:
        oldName: balance2
        newName: balance
        OnlyWeb: Y
    45CurrentBenefit2balance:
        oldName: CurrentBenefit
        newName: balance
        OnlyWeb: Y
    46ACCT_ID2acctId:
        oldName: ACCT_ID
        newName: acctId
        OnlyWeb: Y
    47acct_id2acctId:
        oldName: acct_id
        newName: acctId
        OnlyWeb: Y
    48AcctId2acctId:
        oldName: AcctId
        newName: acctId
        OnlyWeb: Y
    49AcctID2acctId:
        oldName: AcctID
        newName: acctId
        OnlyWeb: Y
    50makeup_fee2percent:
        oldName: makeup_fee
        newName: percent
        OnlyWeb: N
        CatalogName: UP_RULE
    51ACM_Dynamic2ACM_COUNT:
        oldName: ACM_Dynamic
        newName: ACM_COUNT
        OnlyWeb: N
        CatalogName: RE_ACM
    52Resource_Id2acmResId:
        oldName: Resource_Id
        newName: acmResId
        OnlyWeb: N
        CatalogName: RE_ACM
    53ACM_PUAS2ACM_COUNT:
        oldName: ACM_PUAS
        newName: ACM_COUNT
        OnlyWeb: N
        CatalogName: RE_ACM
    54ACM_1862ACM_COUNT:
        oldName: ACM_186
        newName: ACM_COUNT
        OnlyWeb: N
        CatalogName: RE_ACM
    55current_time2CurrentTime:
        oldName: current_time
        newName: CurrentTime
        OnlyWeb: N
        CatalogName: RE_BENEFIT
    56BEGIN_TIME2CurrentTime:
        oldName: BEGIN_TIME
        newName: CurrentTime
        OnlyWeb: N
        CatalogName: RE_BENEFIT
    57CURRENT_TIME2CurrentTime:
        oldName: CURRENT_TIME
        newName: CurrentTime
        OnlyWeb: N
        CatalogName: RE_BENEFIT
    58ACCT_ID2acctId:
        oldName: ACCT_ID
        newName: AcctId
        OnlyWeb: N
        CatalogName: RE_BENEFIT
    59SUBS_UPP_INST_COMPT_DATE2completed_date_ipp:
        oldName: SUBS_UPP_INST_COMPT_DATE
        newName: completed_date_ipp
        OnlyWeb: N
        CatalogName: RE_BENEFIT
    60ACM_MSP2ACM_COUNT:
        oldName: ACM_MSP
        newName: ACM_COUNT
        OnlyWeb: N
        CatalogName: RE_BENEFIT
    61ACM2ACM_COUNT:
        oldName: ACM
        newName: ACM_COUNT
        OnlyWeb: N
        CatalogName: RE_BENEFIT
    62ACM_Benefit2ACM_COUNT:
        oldName: ACM_Benefit
        newName: ACM_COUNT
        OnlyWeb: N
        CatalogName: RE_BENEFIT
    63ACM20K2ACM_COUNT:
        oldName: ACM20K
        newName: ACM_COUNT
        OnlyWeb: N
        CatalogName: RE_BENEFIT
    64ACM50K2ACM_COUNT:
        oldName: ACM50K
        newName: ACM_COUNT
        OnlyWeb: N
        CatalogName: RE_BENEFIT
    65ACM_Topup2ACM_COUNT:
        oldName: ACM_Topup
        newName: ACM_COUNT
        OnlyWeb: N
        CatalogName: RE_BENEFIT
    66acct_id2AcctId:
        oldName: acct_id
        newName: AcctId
        OnlyWeb: N
        CatalogName: RE_BENEFIT
    67PRICE_PLAN_ID2PP_ID:
        oldName: PRICE_PLAN_ID
        newName: PP_ID
        OnlyWeb: N
        CatalogName: RE_BENEFIT
    68data_unit2total_data:
        oldName: data_unit
        newName: total_data
        OnlyWeb: N
        CatalogName: RE_BENEFIT
    69ACCT_RES_ID2Acct_Res_Id:
        oldName: ACCT_RES_ID
        newName: Acct_Res_Id
        OnlyWeb: N
        CatalogName: RE_BENEFIT
    70days2ExtendDay:
        oldName: days
        newName: ExtendDay
        OnlyWeb: N
        CatalogName: RE_BENEFIT
    71MMB2Discount:
        oldName: MMB
        newName: Discount
        OnlyWeb: N
        CatalogName: DP_RULE
    72Allowance2Discount:
        oldName: Allowance
        newName: Discount
        OnlyWeb: N
        CatalogName: DP_RULE
    73pp_str2IPP_ID:
        oldName: pp_str
        newName: IPP_ID
        OnlyWeb: Y
        CatalogName: OTC_BENEFIT


addLineCode:
    #在特定的某一行前(后)面加一行代码
    1RechargeAmount:
        #3.如果script_detail中存在r.event.GetBillingCycleEndTime或者GetBillingCycleBeginTime，且前面不存在GetBillingCycleInfo行
        #3.1.在最先出现r.event.GetBillingCycleEndTime或GetBillingCycleBeginTime的前一行拼接r.event.GetBillingCycleInfo()行
        Cond: RechargeAmount\s*\=\s*r\.event\.GetAttrEx\(73\)\.AsInteger\(\)
        exCond: RechargeAmount\s*\=\s*RechargeAmount\s*\*\s*\-1
        Before: N  #Y: 在特定行的上一行加一行; N:在特定行的下一行加一行, F:在首行加一行
        IsReg: Y #条件是否为正则表达式，Y：是;N:否
        LineCode: RechargeAmount=RechargeAmount*1
        OnlyWeb: Y   #Y:yes, N:no, A: all

addVarName:
    #依据配置条件，将条件表达式、常量赋值、赋值语句中的常量改成变量
    #变量值在配置MatchRule时要用括号()括起来,不要使用|(或)符，如果需要可以配置两条规则
    1minRecharge:
        VarName: minRecharge
        MatchRule: "[ \\(]RechargeAmount\\s*\\>\\=\\s*(\\d+)[ \\)]"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char
        OnlyWeb: A   #Y:yes, N:no, A: all
    2maxAcm:
        VarName: maxAcm
        MatchRule: "[ \\(]ACM_COUNT\\d*\\s*\\<\\s*(\\d+)[ \\)]"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char
        OnlyWeb: A   #Y:yes, N:no, A: all
    3negtiveVal:
        VarName: negtiveVal
        MatchRule: RechargeAmount\s*\=\s*RechargeAmount\s*\*\s*(-?1)
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char
        OnlyWeb: A   #Y:yes, N:no, A: all
    4rechargeList:
        VarName: rechargeList
        MatchRule: "[ \\(]RechargeAmount\\s*\\=\\=\\s*(\\d+)[ \\)]"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char
        OnlyWeb: A   #Y:yes, N:no, A: all
        VarTypeChangeFlag: L
    5maxRecharge:
        VarName: maxRecharge
        MatchRule: "[ \\(]RechargeAmount\\s*\\<\\s*(\\d+)[ \\)]"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char
        OnlyWeb: A   #Y:yes, N:no, A: all
    6PP_ID:
        VarName: PP_ID
        MatchRule: "PP_ID\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char
        OnlyWeb: Y   #Y:yes, N:no, A: all
    7realCharge:
        VarName: realCharge
        MatchRule: "Total_Charge\\=(-?\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char
        OnlyWeb: Y   #Y:yes, N:no, A: all
    8billNumFee:
        VarName: billNumFee
        MatchRule: "(\\d+)\\*bill_num"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char
        OnlyWeb: Y   #Y:yes, N:no, A: all
    9billFormatNum:
        VarName: billFormatNum
        MatchRule: "bill_format_id\\=\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char
        OnlyWeb: Y   #Y:yes, N:no, A: all
    10chargeFee:
        VarName: chargeFee
        MatchRule: "fee\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char
        OnlyWeb: Y   #Y:yes, N:no, A: all
    11prodSpecIdList:
        VarName: prodSpecIdList
        MatchRule: "Prod_Spec_id not in (\\[[0-9, ]+\\])"
        Num: 1 #第几个括号里的字符
        VarType: L  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
    12chargeAmount:
        VarName: chargeAmount
        MatchRule: "amount\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
    13paymentId:
        VarName: paymentId
        MatchRule: "PMI\\=\\=('\\d+')"
        Num: 1 #第几个括号里的字符
        VarType: C  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
    14maxDays:
        VarName: maxDays
        MatchRule: "A\\<(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
    15basicCharge:
        VarName: basicCharge
        MatchRule: "amount\\=A\\*(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
    16bankId:
        VarName: bankId
        MatchRule: "bank_id\\=\\=('\\d+')"
        Num: 1 #第几个括号里的字符
        VarType: C  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
    17objList:
        VarName: objList
        MatchRule: "obj\\=\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        VarTypeChangeFlag: L
    18objList:
        VarName: objList
        MatchRule: "obj in (\\[.+\\])"
        Num: 1 #第几个括号里的字符
        VarType: L  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
    19Flag:
        VarName: flagList
        MatchRule: "Flag\\=\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        #CatalogName: OP
        VarTypeChangeFlag: L
    20res:
        VarName: resChargeList
        MatchRule: "res\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OP
        VarTypeChangeFlag: L
    21contactChannelID:
        VarName: channelId
        MatchRule: "contactChannelID\\=\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OP
    22contactChannelID:
        VarName: channelId
        MatchRule: "contactChannelID\\<\\>(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OP
    23Amount:
        VarName: chargeAmount
        MatchRule: "Amount\\=(-?\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        #CatalogName: OP
    24iNeedValue:
        VarName: needValue
        MatchRule: "iNeedValue\\=(-?\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OP
    25mmb_period:
        VarName: iPeriod
        MatchRule: "mmb_period\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OP
    26total_unit:
        VarName: totalUnit
        MatchRule: "total_unit\\<\\>(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OP
    27basicAmount:
        VarName: basicAmount
        MatchRule: "amount\\=month\\*(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OP
    28extendAmount:
        VarName: extendAmount
        MatchRule: "amount\\=month\\*basicAmount\\+(\\d+\\-\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OP
    29extendAmount:
        VarName: extendAmount
        MatchRule: "amount\\=month\\*basicAmount\\+(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OP
    30charge:
        VarName: chargeAmount
        MatchRule: "charge\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OP
    31Charge:
        VarName: chargeAmount
        MatchRule: "Charge\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OP
    32TransferAmount:
        VarName: maxTransferAmount
        MatchRule: "TransferAmount\\<(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        #CatalogName: OP
    33Total_Charge:
        VarName: maxCharge
        MatchRule: "Total_Charge\\<(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OP
    34ipp_id:
        VarName: ipp_id
        MatchRule: "ipp_id\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OP
    35period:
        VarName: iPeriod
        MatchRule: "period\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OP
    36month:
        VarName: agreedMonth
        MatchRule: "month\\=(\\d+)-X"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OP
    37main_prod_id:
        VarName: mainProdId
        MatchRule: "main_prod_id\\=\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
    38Days:
        VarName: extendDays
        MatchRule: "Days\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OTC_BENEFIT
    39AddDays:
        VarName: extendDays
        MatchRule: "AddDays\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OTC_BENEFIT
    40amount:
        VarName: chargeAmount
        MatchRule: "amount\\=(-?\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OTC_BENEFIT
    41Benefit_Code:
        VarName: benefitResultCode
        MatchRule: "Benefit_Code\\=('\\w+')"
        Num: 1 #第几个括号里的字符
        VarType: C  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OTC_BENEFIT
    42TT_BALANCE:
        VarName: maxAmount
        MatchRule: "TT_BALANCE\\<\\=(-\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OTC_BENEFIT
    43balance:
        VarName: maxAmount
        MatchRule: "balance\\<(-\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OTC_BENEFIT
    44TotRechargeAmount:
        VarName: rechargeAmountList
        MatchRule: "TotRechargeAmount\\<(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OTC_BENEFIT
        VarTypeChangeFlag: L
    45TotRechargeAmount:
        VarName: benefitAmountList
        MatchRule: "TotRechargeAmount\\*(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OTC_BENEFIT
        VarTypeChangeFlag: L
    46Ramount:
        VarName: ramountList
        MatchRule: "Ramount\\=(\\[.+\\])"
        Num: 1 #第几个括号里的字符
        VarType: L  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OTC_BENEFIT
    47TotRechargeAmount:
        VarName: rechargeAmountCheck
        MatchRule: "TotRechargeAmount\\=\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OTC_BENEFIT
    48AmountVS:
        VarName: rechargeAmountVS
        MatchRule: "AmountVS\\<(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OTC_BENEFIT
    49TransferAmount:
        VarName: benefitAmount
        MatchRule: "TransferAmount\\*(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OTC_BENEFIT
    50RechargeAmount:
        VarName: rechargeAmountCheck
        MatchRule: "RechargeAmount\\<\\>(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OTC_BENEFIT
    51ACM_Benefit:
        VarName: acmBenefit
        MatchRule: "ACM_Benefit\\<(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OTC_BENEFIT
    52FreeBytes:
        VarName: freeDatas
        MatchRule: "FreeBytes\\=(-\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OTC_BENEFIT
    53RechargeAmount:
        VarName: maxRechargeAmount
        MatchRule: "RechargeAmount\\<\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OTC_BENEFIT
    54AmountVS:
        VarName: benefitAmount
        MatchRule: "AmountVS\\*(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OTC_BENEFIT
    55Acct_Res_Id:
        VarName: acctResId
        MatchRule: "Acct_Res_Id\\=\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OTC_BENEFIT
    56minDays:
        VarName: minDays
        MatchRule: "A\\>\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
    57basicBonus:
        VarName: basicBonus
        MatchRule: "(-\\d+)\\*Active_Bonus"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
    58ACM_VoucherPaket:
        VarName: acmVoucher
        MatchRule: "ACM_VoucherPaket\\<(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
    59minDays:
        VarName: minDays
        MatchRule: "(\\d+)\\<\\=A"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
    60balance:
        VarName: remainBalance
        MatchRule: "balance\\>(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: RE_PRICE_PLAN
    61reserve:
        VarName: basicReserv
        MatchRule: "reserve\\=(\\d+)\\*reserve"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: RE_PRICE_PLAN
    62minAcm:
        VarName: minAcm
        MatchRule: "Acm\\>\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: UE_ACM
    63durCharge:
        VarName: durCharge
        MatchRule: "charge\\=dur\\*(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: UE_ACM
    64recCharge:
        VarName: recCharge
        MatchRule: "price_cycle\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: RP
    65minAcm:
        VarName: minAcm
        MatchRule: "ACM_PLAN\\>\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: RP
    66maxAcm:
        VarName: maxAcm
        MatchRule: "ACM_COUNT\\<\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: RE_ACM
    67Acct_Res_Id:
        VarName: acctResId
        MatchRule: "Acct_Res_Id\\=\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: RE_BENEFIT
    67maxAcm:
        VarName: maxAcm
        MatchRule: "ACM_COUNT\\d*\\<\\=?(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: RE_BENEFIT
    68initData:
        VarName: initData
        MatchRule: "total_data\\=(\\d+\\*\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: RE_BENEFIT
    69initData:
        VarName: initData
        MatchRule: "total_data\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: RE_BENEFIT
    70initVoice:
        VarName: initVoice
        MatchRule: "total_voice\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: RE_BENEFIT
    71initSMS:
        VarName: initSMS
        MatchRule: "total_sms\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: RE_BENEFIT
    72bonusAmount:
        VarName: bonusAmount
        MatchRule: "amount\\=(\\-\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: RE_BENEFIT
    73promEndTime:
        VarName: promEndTime
        MatchRule: "CurrentTime\\[0\\:8\\]\\<('\\d+')"
        Num: 1 #第几个括号里的字符
        VarType: C  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: RE_BENEFIT
    74promBeginTime:
        VarName: promBeginTime
        MatchRule: "CurrentTime\\[0\\:8\\]\\>\\=('\\d+')"
        Num: 1 #第几个括号里的字符
        VarType: C  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: RE_BENEFIT
    75pricePlanId:
        VarName: pricePlanId
        MatchRule: "IPP_ID\\=('\\d+')"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: RE_BENEFIT
    76pricePlanId:
        VarName: pricePlanId
        MatchRule: "PRICE_PLAN_ID\\='\\+('\\d+')\\+'"
        Num: 1 #第几个括号里的字符
        VarType: C  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: RE_BENEFIT
    77extendDays:
        VarName: initDays
        MatchRule: "days\\=(1)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: RE_BENEFIT
    78periodDays:
        VarName: periodDays
        MatchRule: "PERIOD_DAYS\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: RE_BENEFIT
    79minAcm:
        VarName: minAcm
        MatchRule: "acm\\>(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: DP_RULE
    80discRes:
        VarName: discRes
        MatchRule: "res\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: DP_RULE
    81prodSpecId:
        VarName: prodSpecId
        MatchRule: "Prod_Spec_Id\\=\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: DP_RULE
    82prodSpecId:
        VarName: prodSpecId
        MatchRule: "Prod_Spec_Id\\!\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: DP_RULE
    83prodSpecId:
        VarName: prodSpecIdList
        MatchRule: "Prod_Spec_id\\s+in\\s+(\\[.+\\])"
        Num: 1 #第几个括号里的字符
        VarType: L  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: DP_RULE
    84discAmount:
        VarName: discAmount
        MatchRule: "MMB\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: DP_RULE
        VarTypeChangeFlag: L
    84discAmount:
        VarName: discAmount
        MatchRule: "Discount\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: DP_RULE
        VarTypeChangeFlag: L
    85discAmount:
        VarName: discAmount
        MatchRule: "MMB_Charge\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: DP_RULE
        VarTypeChangeFlag: L
    86maxDays:
        VarName: maxDays
        MatchRule: "A\\<(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: DP_RULE
        VarTypeChangeFlag: L
    87Discount:
        VarName: Discount
        MatchRule: "Total_Charge\\>\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: DP_RULE
        #VarTypeChangeFlag: L
    88IPPID:
        VarName: IPPID
        MatchRule: "\\(i\\=\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: DP_RULE
        VarTypeChangeFlag: L
    89percent:
        VarName: percent
        MatchRule: "Total_Charge\\*(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: DP_RULE
        #VarTypeChangeFlag: L
    90maxAcm:
        VarName: maxAcm
        MatchRule: "acm\\<\\=?(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        #CatalogName: DP_RULE
        #VarTypeChangeFlag: L
    91percent:
        VarName: percent
        MatchRule: "Total_Charge_OffNet\\*(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: DP_RULE
        #VarTypeChangeFlag: L
    92billCharge:
        VarName: billCharge
        MatchRule: "Paper_Bill_Charge\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: DP_RULE
        #VarTypeChangeFlag: L
    93pricePlanId:
        VarName: pricePlanId
        MatchRule: "PRICE_PLAN_ID\\=(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: DP_RULE
    94Total_Charge:
        VarName: maxCharge
        MatchRule: "Total_Charge\\<(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: DP_RULE
    95percent:
        VarName: percent
        MatchRule: "\\=Discount\\*(\\d+)/"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: DP_RULE
    96ratePrice:
        VarName: ratePrice
        MatchRule: "res\\s*\\=\\s*(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: UP_RULE
    97acmValueList:
        VarName: acmValueList
        MatchRule: "[ \\(]ACM\\s*\\=\\=\\s*(\\d+)[ \\)]"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: RP
        VarTypeChangeFlag: L
    98acmValueList:
        VarName: acmValueList
        MatchRule: "[ \\(]ACM_COUNT\\s*\\=\\=\\s*(\\d+)[ \\)]"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: RE_BENEFIT
        VarTypeChangeFlag: L
    99discAmount:
        VarName: discAmount
        MatchRule: "Discount_Charge\\=\\-1\\*(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: DP_RULE
        #VarTypeChangeFlag: L
    100IPP_ID:
        VarName: IPP_ID
        MatchRule: "r\\.event\\.InsertAsynCall\\(155,'987\\='\\+('\\d+')\\+'.+"
        Num: 1 #第几个括号里的字符
        VarType: C  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OTC_BENEFIT
    101IPP_ID:
        VarName: IPP_ID
        MatchRule: "r\\.event\\.InsertAsynCall\\(10001,'PRICE_PLAN_ID\\='\\+('\\d+')\\+'.+"
        Num: 1 #第几个括号里的字符
        VarType: C  #N:number, F:float, C:char, L: list
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: RE_BENEFIT
    102AcctResIdList:
        VarName: acctResIdList
        MatchRule: "Acct_res_id_list\\=(\\[[0-9, '\\n]+\\])"
        Num: 1 #第几个括号里的字符
        VarType: L  #N:number, F:float, C:char, L: list
        MultiLineFlag: Y
        OnlyWeb: N   #Y:yes, N:no, A: all
        CatalogName: RE_PRICE_PLAN
    103chargeAmount:
        VarName: chargeAmount
        MatchRule: "^\\s*amount\\=D\\*(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char
        OnlyWeb: Y   #Y:yes, N:no, A: all
    104minAcm:
        VarName: minAcm
        MatchRule: "ACM_COUNT\\d*\\>(\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
    105minActiveDays:
        VarName: minActiveDays
        MatchRule: "\\(ActiveDays\\>(\\d+)\\)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
    106bonusAmount:
        VarName: bonusAmount
        MatchRule: "Bonus\\=(\\-\\d+)"
        Num: 1 #第几个括号里的字符
        VarType: N  #N:number, F:float, C:char, L: list
        OnlyWeb: Y   #Y:yes, N:no, A: all
        CatalogName: OTC_BENEFIT

secondStringReplace:
    REGEXP:
        BOTH:
            \(\s*RechargeAmount\s*\>\=\s*minRecharge\s+and\s+ACM_COUNT\s*\<\s*maxAcm\s*\): (ACM_COUNT < maxAcm and RechargeAmount >= minRecharge)
            (RechargeAmount\=\=rechargeList\[\d+\]\s+or\s+){1,}RechargeAmount\=\=rechargeList\[\d+\]: RechargeAmount in rechargeList
            r\.event\.SetBenefitRuleCodeByName: "#r.event.SetBenefitRuleCodeByName"
            r\.event\.ClearAttrValue: "#r.event.ClearAttrValue"
            (ACM\=\=acmValueList\[\d+\]\s+or\s+){1,}ACM\=\=acmValueList\[\d+\]: ACM in acmValueList
            (ACM_COUNT\=\=acmValueList\[\d+\]\s+or\s+){1,}ACM_COUNT\=\=acmValueList\[\d+\]: ACM_COUNT in acmValueList
        OnlyWeb:
            r\.event\.GetAttrEx\(3\): r.event.GetAttrEx(EVENT_BEGIN_TIME)

    USUAL:
        OnlyWeb:
            "PP_ID=PP_ID": "#PP_ID=PP_ID"
            "ipp_id=ipp_id": "#ipp_id=ipp_id"
            #没有业务意义，先注释掉
            "r.SetResult(0)": "#r.SetResult(0)"


firstSpecialStringReplace:
    1IPP_ID:
        #r.event.InsertAsynCall(155,'987=715027|963='+CURRENT_TIME)->r.event.InsertAsynCall(155,'987='+'715027'+'|963='+CURRENT_TIME)
        MatchRule: "r\\.event\\.InsertAsynCall\\(155,'987\\=(\\d+)\\|963\\='"
        IsReg: Y #MatchRule是否为正则表达式，Y：是;N:否
        ReplaceStr: "r.event.InsertAsynCall(155,'987='+'\\{:d}'+'|963='"
        Param: [1] #MatchRule中第几个括号中的内容，如果没有可不配置，多个参数时以','分隔，只有1个参数时也需要[]
        OnlyWeb: Y   #Y:yes, N:no, A: all 可不配置
        CatalogName: OTC_BENEFIT
    2IPP_ID:
        #r.event.InsertAsynCall(10001,'PRICE_PLAN_ID=833432|EFF_DATE='+CurrentTime+'|EXP_DATE='+NewExpDate)->(10001,'PRICE_PLAN_ID='+'833432'+'|EFF_DATE='+CurrentTime+'|EXP_DATE='+NewExpDate)
        MatchRule: "r\\.event\\.InsertAsynCall\\(10001,'PRICE_PLAN_ID\\=(\\d+)\\|EFF_DATE\\='"
        IsReg: Y #MatchRule是否为正则表达式，Y：是;N:否
        ReplaceStr: "r.event.InsertAsynCall(10001,'PRICE_PLAN_ID='+'\\{:d}'+'|EFF_DATE='"
        Param: [1] #MatchRule中第几个括号中的内容，如果没有可不配置，多个参数时以','分隔，只有1个参数时也需要[]
        OnlyWeb: N   #Y:yes, N:no, A: all 可不配置
        CatalogName: RE_BENEFIT

secondSpecialStringReplace:
    #特定的python中，特定的替换规则
    1GetBalValueByAcctId:
        MatchRule: (.+)\=r\.event\.GetBalValueByAcctId\(acctId,Acct_Res_Id,r\.event\.GetAttrEx\(EVENT_BEGIN_TIME\)\.AsString\(\),CurrentTime\)
        IsReg: Y #MatchRule是否为正则表达式，Y：是;N:否
        ReplaceStr: \{:d}=r.event.GetBalValueByAcctId(acctId,Acct_Res_Id,CurrentTime,CurrentTime)
        Param: [1] #MatchRule中第几个括号中的内容，如果没有可不配置，多个参数时以','分隔，只有1个参数时也需要[]
        OnlyWeb: Y   #Y:yes, N:no, A: all 可不配置
        CatalogName: OP
    2GetBalValueByAcctId:
        MatchRule: (^\s+)(.+)\=r\.event\.GetBalValueByAcctId\(acctId,Acct_Res_Id,r\.event\.GetAttrEx\(EVENT_BEGIN_TIME\)\.AsString\(\)\)
        IsReg: Y #MatchRule是否为正则表达式，Y：是;N:否
        ReplaceStr: \{:d}CurrentTime=r.event.GetAttrEx(EVENT_BEGIN_TIME).AsString()\n\{:d}\{:d}=r.event.GetBalValueByAcctId(acctId,Acct_Res_Id,CurrentTime)
        Param: [1,1,2,3] #MatchRule中第几个括号中的内容，如果没有可不配置，多个参数时以','分隔，只有1个参数时也需要[]
        OnlyWeb: Y   #Y:yes, N:no, A: all 可不配置
        CatalogName: OP
    3deleteCurrentTime:
        MatchRule: CurrentTime=r.event.GetAttr(EVENT_BEGIN_TIME).AsString()
        IsReg: N #MatchRule是否为正则表达式，Y：是;N:否
        ReplaceStr: "#CurrentTime=r.event.GetAttr(EVENT_BEGIN_TIME).AsString()"
        Param: [] #MatchRule中第几个括号中的内容，如果没有可不配置，多个参数时以','分隔，只有1个参数时也需要[]
        OnlyWeb: N   #Y:yes, N:no, A: all 可不配置
        CatalogName: RE_BENEFIT

deleteVarName:
    - ACM_COUNT
    - ACM_COUNT1
    - CurrentTime
    - AcctId
    - Subs_Id
    - subid
    - prod_state
    - contactChannelID
    - inst
    - completed_date
    - Prod_Spec_id
    - balance
    - effDate
    - EffDate
    - ExpDate
    - CurrentTime_Hour
    - CurrentTime_Zero
    - EffDate2
    - CurrentTime_Time
    - reserve
    - duration
    - eff_date
    - cycle_end_time
    - cycle_begin_time
    - price_plan_id
    - active_date
    - exp_date
    - EFF_DATE
    - EXP_DATE
    - plus_amount
    - SUBS_UPP_INST_EFF_DATE
    - SUBS_UPP_INST_EXP_DATE
    - completed_date_ipp
    - cycle_unit


sqlUpdate:
    #需在zte_sql_update_table/UPDATE标签下配置相应的标签和sql语句，支持配置多个标签，标签下支持多个update sql
    #可用于更新变量的值、删除无效变量的定义等
    UpdateTag: SqlUpdate

clearNoUseVar:
