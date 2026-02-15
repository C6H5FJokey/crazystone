# 注册id
scoreboard players operation @s machine_id_jk = binding machine_id_jk
# 刷石机的item_display构造
setblock ~ ~ ~ barrier
data merge entity @s {item: {count: 1, id:"minecraft:dispenser"}, Tags:["machine_jk", "cobblestone_generator_jk"],\
    transformation: {left_rotation: [0.0f, 0.0f, 0.0f, 1.0f], right_rotation: [0.0f, 0.0f, 0.0f, 1.0f], scale: [1.001f, 1.001f, 1.001f], translation: [0.0f, 0.0f, 0.0f]}}
# 需要读取 yaw_facing int 0~3，超过范围会取余数，对应南西北东
# 需要读取 pitch_facing int 0~2，超过范围会取余数，对应平视，向下看，向上看。
execute if score yaw_facing int matches 0 at @s run rotate @s 0 ~
execute if score yaw_facing int matches 1 at @s run rotate @s 90 ~
execute if score yaw_facing int matches 2 at @s run rotate @s -180 ~
execute if score yaw_facing int matches 3 at @s run rotate @s -90 ~
execute if score pitch_facing int matches 0 at @s run rotate @s ~ 0
execute if score pitch_facing int matches 1 at @s run rotate @s ~ 90
execute if score pitch_facing int matches 2 at @s run rotate @s ~ -90
# 设置插槽，如果平视设置在顶部，否则设置在侧面的顶部
# facing （0≤值≤5）当前物品展示框面对的方向。从0到5分别对应下上北南西东，如果超过值域则对6取余并取绝对值后对应方向。
execute if score pitch_facing int matches 1 if score yaw_facing int matches 0 run scoreboard players set facing int 3
execute if score pitch_facing int matches 1 if score yaw_facing int matches 1 run scoreboard players set facing int 4
execute if score pitch_facing int matches 1 if score yaw_facing int matches 2 run scoreboard players set facing int 2
execute if score pitch_facing int matches 1 if score yaw_facing int matches 3 run scoreboard players set facing int 5
execute if score pitch_facing int matches 2 if score yaw_facing int matches 0 run scoreboard players set facing int 2
execute if score pitch_facing int matches 2 if score yaw_facing int matches 1 run scoreboard players set facing int 5
execute if score pitch_facing int matches 2 if score yaw_facing int matches 2 run scoreboard players set facing int 3
execute if score pitch_facing int matches 2 if score yaw_facing int matches 3 run scoreboard players set facing int 4
execute if score pitch_facing int matches 0 run scoreboard players set facing int 1
scoreboard players operation slot_init type_id_jk = main_slot type_id_jk
scoreboard players set invisible int 0
execute at @s positioned ^ ^1 ^ run function jokeygame:slot/init_interface
# 设置触发功能需要的tick
scoreboard players operation @s machine_tick_jk = cobblestone_generator_basic_cd_jk machine_tick_jk