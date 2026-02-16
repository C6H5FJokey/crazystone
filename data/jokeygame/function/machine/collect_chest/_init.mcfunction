# 注册id
scoreboard players operation @s machine_id_jk = binding machine_id_jk
# 加tag
tag @s add machine_jk
tag @s add collect_chest_jk
# 收集箱
# 需要读取 yaw_facing int 0~3，超过范围会取余数，对应南西北东
# 本质是打蜡铜箱子+marker
execute if score yaw_facing int matches 0 at @s run rotate @s 0 ~
execute if score yaw_facing int matches 1 at @s run rotate @s 90 ~
execute if score yaw_facing int matches 2 at @s run rotate @s -180 ~
execute if score yaw_facing int matches 3 at @s run rotate @s -90 ~
execute if score yaw_facing int matches 0 run setblock ~ ~ ~ waxed_copper_chest[type=single,facing=south]
execute if score yaw_facing int matches 1 run setblock ~ ~ ~ waxed_copper_chest[type=single,facing=west]
execute if score yaw_facing int matches 2 run setblock ~ ~ ~ waxed_copper_chest[type=single,facing=north]
execute if score yaw_facing int matches 3 run setblock ~ ~ ~ waxed_copper_chest[type=single,facing=east]
# 设置插槽，为顶部
scoreboard players set facing int 1
scoreboard players operation slot_init type_id_jk = main_slot type_id_jk
scoreboard players set invisible int 0
execute at @s positioned ~ ~1 ~ run function jokeygame:slot/init_interface
scoreboard players operation @s machine_tick_jk = collect_chest_basic_cd_jk machine_tick_jk
# 确定队伍
execute if entity @p[tag=place_player_temp_jk, team=red_jk] run team join red_jk
execute if entity @p[tag=place_player_temp_jk, team=green_jk] run team join green_jk
execute if entity @p[tag=place_player_temp_jk, team=yellow_jk] run team join yellow_jk
execute if entity @p[tag=place_player_temp_jk, team=blue_jk] run team join blue_jk