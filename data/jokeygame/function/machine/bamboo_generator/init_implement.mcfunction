# 先检查能不能放
scoreboard players set res int 0
execute unless function jokeygame:machine/bamboo_generator/_place_check run scoreboard players set res int 1
execute if score res int matches 1 at @p[tag=place_player_temp_jk] run loot spawn ~ ~ ~ loot jokeygame:machine/bamboo_generator
execute if score res int matches 1 run kill @s
execute if score res int matches 1 run return fail
# 需要读取 yaw_facing int 0~3，超过范围会取余数，对应南西北东
# 需要读取 pitch_facing int 0~2，超过范围会取余数，对应平视，向下看，向上看。
# 输入的是玩家的facing，需要转换为方块的facing
scoreboard players operation pitch_facing int *= -1 int
scoreboard players operation pitch_facing int %= 3 int
# 优化，如果玩家是低头放的，机器的面向方向应该和玩家相同
execute unless score pitch_facing int matches 1 run scoreboard players add yaw_facing int 2
scoreboard players operation yaw_facing int %= 4 int
# 获取本实例id
scoreboard players operation binding machine_id_jk = global machine_id_jk
execute align xyz positioned ~0.5 ~0.5 ~0.5 summon item_display run function jokeygame:machine/bamboo_generator/_init
scoreboard players add global machine_id_jk 1