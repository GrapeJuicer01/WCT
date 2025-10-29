V81

| Topic | Title | 描述  | Comments | 
| - | :- | - | - |
| BadData | AcctItem_No_Define | 检查ref_value中的账目类型在账目类型表中是否存在 | comm |
| BadData | Price_and_RatePlan_Re_NotMatch | 检查资费模板和真正的资费对应的事件不一样| comm|
| BadData | PricePlan_No_Offer | 存在有的资费计划没有对应的Offer，这个是垃圾数据，考虑删除 | comm |
| BadData | PricePlan_Re_No_Reserve | 资费中用到的事件，没有配置预留 | comm |
| BadData | PriceTemplate_One_Mapping_Multi_Re | 一个模板被多个Rate_plan所引用，但是Re_id不一样| comm |
| BadData | RatePlan_No_PriceVer | 存在RatePlan没有对应的Price_ver的数据，应该是垃圾数据，考虑删除 | comm|
| BadData | RatePlan_Priority_Error | 刚果金专用的脚本，检查算费的RatePlan的优先级和别的类型的优先级的高低 | A002 |
| BadData | SortRule_Not_Output_Re_Have_Tariff | 检查分拣没有输出事件，但是有对应的资费，这个算垃圾数据，需要清理 | comm |
| BadData | SortRule_OutputRe_No_Reserve | 分拣出了事件，但是没有预留。如果是offline的，或者短信彩信的可以不用管，语音数据的就要留意 | comm|
| BadData | Zone_same_zone_id_multiple_value | 一个Zone_item里面有多个一样的Zone_value | comm |
| ErrorData | AcctItem_No_Define | 检查所有资费计划中的资费对应的账目类型在账目类型表中是否存在，只要存在就是有问题的 |comm|
| ErrorData | OTC/Rent_exists_res_not_use_in_usage_price | 检查租费或者OTC里的余额类型，在使用费里没有使用 | comm |
| ErrorData | Price_ChargeUnit_Occurrence | 检查批价单位为次的错误，有2种。1.应该写次的，数值不等于1。 2. 应该写别的单位，不小心写成次。第2种有可能有财务上的损失 | comm|
| ErrorData | PriceIdIsSameInEvent_benefitAndAcm | event_benefit和Acm表的Price_id不能相同 |comm|
| ErrorData | PriceIdIsSameInPriceAndAcm | Price和Acm表的Price_id不能相同 | comm |
| ErrorData | PriceIdIsSameInPriceAndEvent_benefit | Price和event_benefit表的Price_id不能相同 | comm |
| ErrorData | ReReserve_Policy_No_Limit | 配置了预留，没有配置最小预留，这种数据界面是无法配置出来的，担心脚本遗漏 | comm |
| ErrorData | SortRule_OutputRe_No_Tariff | 检查分拣出了事件，但是没有资费计划对这个事件进行定价，有问题的可能性非常大 | comm |
| ErrorData | Usage_price_used_res_type_not_exists_in_OTC&Rent | 资费中使用的账本，是否都在赠送中有了，赠送需要考虑一次性和租费 | comm |
| ErrorData | Zone_Same zone value exists in different zone | 检查同一个Value在同一个ZoneMap中出现多次,需要确认后删除 | comm|
