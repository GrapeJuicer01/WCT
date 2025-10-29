V90

| Topic | Title | 描述  | Comments |
| - | :- | - | - |
| BadData | Balance Type not related to consume type | 帐本没有与消费类型关联，说明没有使用到 | A009 |
| BadData | Event exists in price but not in sort rule | 资费里面有事件，但是分拣中没有输出对应的事件 | comm |
| BadData | SortRule_OutputRe_No_Reserve | 分拣分拣出了事件，但是在预留规则中没有配置预留 | comm |
| BadData | Tariff plan not relate offer | tariff plan没有与 OFFER 关联 | A009 |
| ErrorData | Event exists in sort rule but not in price | 检查资费里配置的事件，分拣没有输出 | comm |
| ErrorData | Individual price plan Do not relate to tariff plan | 个性化资费计划没有关联tariff plan | comm |
| ErrorData | OTC/Rent_exists_res_not_use_in_usage_price | 检查租费或者OTC里的余额类型，在使用费里没有使用 | A003 |
| ErrorData | Recurring benefit account not used in price | 租费赠送的帐本，未在使用费里使用 | comm |
| ErrorData | Usage_price_used_res_type_not_exists_in_OTC&Rent | 检查在使用费里用到的赠送余额类型，租费或者OTC没有赠送| A003|
| ErrorData | Workflow use Assign error | 检查分拣里使用Assign函数时，是否存在把一个属性值直接Assign给另外一个属性，或者使用Assign赋予值时，忘记填参数了| comm |
| ErrorData | Zone Same zone value exists in different zone | 在一个ZoneMap中，一个value出现在不同的zone_item下面 | comm|
| WarningData | Charging Workflow use the condition != | V9分拣里使用 ！= 不等于时，如果属性值为空，也会满足条件，需要单独拿出来确认 | comm |


