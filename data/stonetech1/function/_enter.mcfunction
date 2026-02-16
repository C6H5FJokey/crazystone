#stonetech1:_enter
# 进入大厅
# 传入玩家为执行者

function vp_core:_reset_player
execute store result score temp_x int run data get storage vp_core:io hall_center[0] 10
execute store result score temp_y int run data get storage vp_core:io hall_center[1] 10
execute store result score temp_z int run data get storage vp_core:io hall_center[2] 10
execute store result score temp_dx int run data get storage vp_core:io hall_spawn[0] 10
execute store result score temp_dy int run data get storage vp_core:io hall_spawn[1] 10
execute store result score temp_dz int run data get storage vp_core:io hall_spawn[2] 10
execute store result storage math:io xyz[0] double 0.1 run scoreboard players operation temp_x int += temp_dx int
execute store result storage math:io xyz[1] double 0.1 run scoreboard players operation temp_y int += temp_dy int
execute store result storage math:io xyz[2] double 0.1 run scoreboard players operation temp_z int += temp_dz int
data modify entity @e[tag=math_marker,limit=1] Pos set from storage math:io xyz
execute at @e[tag=math_marker,limit=1] run tp @s ~ ~ ~
execute at @s run spawnpoint @s ~ ~ ~
# 标签设置
function vp_core:player_types/waiter/_be

# 死亡/复活设置
function vp_core:player_space/_get
data modify storage vp_core:io result.death_func set value "stonetech1:death_func"
data modify storage vp_core:io result.respawn_func set value "stonetech1:respawn_func"
function vp_core:player_space/_store