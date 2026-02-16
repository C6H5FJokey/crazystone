#stonetech1:_del
# 根据临时对象销毁大厅实例

# 生成area_clear构造器
data modify storage vp_core:io input set from storage vp_core:class area_clear_plate
execute store result score temp_size int run data get storage vp_core:io hall_size
execute store result score temp_height int run data get storage vp_core:io hall_height
execute store result storage vp_core:io input.field_size int 1 run scoreboard players add temp_size int 1
execute store result storage vp_core:io input.field_height int 1 run scoreboard players add temp_height int 1
data modify storage vp_core:io input.field_center set from storage vp_core:io hall_center
function vp_core:constructors/area_clear/_new
execute as @e[tag=result,limit=1] run function marker_control:data/_get
data modify storage marker_control:io result.tick_func set value "vp_core:constructors/area_clear/main"
execute as @e[tag=result,limit=1] run function marker_control:data/_store
tag @e[tag=result,limit=1] add entity_ticked

# 销毁区块任务图层
data modify entity @e[tag=uuid_marker,limit=1] Thrower set from storage vp_core:io hall_area_uuid
execute as @e[tag=uuid_marker,limit=1] on origin run kill @s