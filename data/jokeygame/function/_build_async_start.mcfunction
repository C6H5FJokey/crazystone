#jokeygame:_build_async_start
# 开始构造游戏实例

# vp_joiner观看游戏实例构造过程（如果区块过多，性能压力较大，该片段可删除！）
gamemode spectator @a[tag=vp_joiner]
execute as @e[tag=math_marker,limit=1] run function jokeygame:watch_build

# 生成chunk_loader构造器
data modify storage vp_core:io input set from storage vp_core:class chunk_loader_plate
execute store result score temp_size int run data get storage vp_core:io field_size
execute store result score temp_height int run data get storage vp_core:io field_height
execute store result storage vp_core:io input.field_size int 1 run scoreboard players add temp_size int 1
execute store result storage vp_core:io input.field_height int 1 run scoreboard players add temp_height int 1
data modify storage vp_core:io input.field_center set from storage vp_core:io field_center
function vp_core:constructors/chunk_loader/_new

# 生成area_clear构造器
data modify storage vp_core:io input set from storage vp_core:class area_clear_plate
execute store result score temp_size int run data get storage vp_core:io field_size
execute store result score temp_height int run data get storage vp_core:io field_height
execute store result storage vp_core:io input.field_size int 1 run scoreboard players add temp_size int 1
execute store result storage vp_core:io input.field_height int 1 run scoreboard players add temp_height int 1
data modify storage vp_core:io input.field_center set from storage vp_core:io field_center
function vp_core:constructors/area_clear/_new

# 生成structure_builder构造器
data modify storage vp_core:io input set from storage vp_core:class structure_builder_plate
data modify storage vp_core:io input.field_size set from storage vp_core:io field_size
data modify storage vp_core:io input.field_height set from storage vp_core:io field_height
data modify storage vp_core:io input.field_center set from storage vp_core:io field_center
data modify storage vp_core:io input.structure_prefix set value "jokeygame:"
function vp_core:constructors/structure_builder/_new

# 生成barrier_builder构造器
data modify storage vp_core:io input set from storage vp_core:class barrier_builder_plate
data modify storage vp_core:io input.field_size set from storage vp_core:io field_size
data modify storage vp_core:io input.field_height set from storage vp_core:io field_height
data modify storage vp_core:io input.field_center set from storage vp_core:io field_center
function vp_core:constructors/barrier_builder/_new

# 生成player_setup构造器
data modify storage vp_core:io input set from storage vp_core:class player_setup_plate
data modify storage vp_core:io input.player_set_func set value "jokeygame:_set_player"
function vp_core:constructors/player_setup/_new

# 生成player_teleport构造器
data modify storage vp_core:io input set from storage vp_core:class player_setup_plate
function jokeygame:_get_tp_points
data modify storage vp_core:io input.tp_points set from storage jokeygame:io result
function vp_core:constructors/player_teleport/_new

# 调用构造主程序
schedule function jokeygame:_build_async_main 1t replace