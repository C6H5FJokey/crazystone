#jokeygame:_reg
# 注册jokeygame到vp_core

function jokeygame:_zero
# 设置模块基本信息
data modify storage vp_core:io game_namespace set value "jokeygame"
data modify storage vp_core:io game_prefix set value "jokeygame:"
data modify storage vp_core:io game_name set value {text:"赤石科技",color:"grey"}
data modify storage vp_core:io game_desc set value [\
	{text:"疯狂的石头",color:"dark_red"},\
]
data modify storage vp_core:io game_display set value {\
	item_icon:{id:"minecraft:stone",count:1b},\
	head_pic:{id:"minecraft:structure_void",count:1b,components:{"minecraft:item_model":""}},\
}
data modify storage vp_core:io version_range set value [0,10000]
data modify storage vp_core:io game_state set value "preparing"
data modify storage vp_core:io field_size set value 3
data modify storage vp_core:io field_height set value 1
data modify storage vp_core:io field_center set value [86.0d,21.0d,139.0d]
# 将模块基本信息导出为数据模板
function jokeygame:_model

# 将数据模板注入到vp_core
data modify storage vp_core:class list_games append from storage jokeygame:io result