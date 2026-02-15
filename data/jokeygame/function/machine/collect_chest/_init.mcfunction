# 注册id
scoreboard players operation @s machine_id_jk = binding machine_id_jk
# 收集箱
# 需要读取 yaw_facing int 0~3，超过范围会取余数，对应南西北东
# 本质是打蜡铜箱子+marker
execute if score yaw_facing int matches 0 run setblock ~ ~ ~ waxed_copper_chest[type=single,facing=south]
execute if score yaw_facing int matches 1 run setblock ~ ~ ~ waxed_copper_chest[type=single,facing=west]
execute if score yaw_facing int matches 2 run setblock ~ ~ ~ waxed_copper_chest[type=single,facing=north]
execute if score yaw_facing int matches 3 run setblock ~ ~ ~ waxed_copper_chest[type=single,facing=east]
