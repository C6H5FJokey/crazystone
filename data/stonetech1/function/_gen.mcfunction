#stonetech1:_gen
# 根据临时对象生成大厅实例
# 占用chunk_area模块
# 输出structure_builder实例，tick执行构造器的main函数
# 输出chunk_area实例, entity @e[tag=result,limit=1], load_func为main函数, 持有标签vp_hall_area

# 生成structure_builder构造器
data modify storage vp_core:io input set from storage vp_core:class structure_builder_plate
data modify storage vp_core:io input.field_size set from storage vp_core:io hall_size
data modify storage vp_core:io input.field_height set from storage vp_core:io hall_height
data modify storage vp_core:io input.field_center set from storage vp_core:io hall_center
data modify storage vp_core:io input.structure_prefix set from storage vp_core:io hall_prefix
function vp_core:constructors/structure_builder/_new
tag @e[tag=result,limit=1] add hall_structure_builder

# 设置chunk_area临时对象
data modify storage vp_core:io area_info set value {}
execute store result score x_min int run data get storage vp_core:io hall_center[0]
execute store result score y_min int run data get storage vp_core:io hall_center[2]
scoreboard players operation x_max int = x_min int
scoreboard players operation y_max int = y_min int
execute store result score temp_s int run data get storage vp_core:io hall_size 24
scoreboard players operation x_min int -= temp_s int
scoreboard players operation y_min int -= temp_s int
scoreboard players operation x_max int += temp_s int
scoreboard players operation y_max int += temp_s int
scoreboard players operation area_value int = temp_s int
scoreboard players operation area_value int *= 2 int
scoreboard players operation area_value int *= area_value int
# 产生区块加载任务
execute as @e[tag=math_marker,limit=1] run function vp_core:utils/chunk_area/_temp_load
data modify entity @e[tag=result,limit=1] data.area_info.load_func set value "stonetech1:gen_structure"
tag @e[tag=result,limit=1] add vp_hall_area
data modify storage vp_core:io hall_area_uuid set from entity @e[tag=result,limit=1] UUID