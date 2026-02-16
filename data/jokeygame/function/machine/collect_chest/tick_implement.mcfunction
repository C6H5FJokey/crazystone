# 检测破坏 (1为需要破坏，0不需要)
# 先输入binding machine_id_jk
scoreboard players operation binding machine_id_jk = @s machine_id_jk
execute if function jokeygame:machine/collect_chest/_check_broken run function jokeygame:machine/collect_chest/_del
# 清空石头分数
scoreboard players reset @s stone_count_jk
# 检测tick
execute if score @s cur_machine_tick_jk >= @s machine_tick_jk run function jokeygame:machine/collect_chest/_main
execute if score @s cur_machine_tick_jk >= @s machine_tick_jk run scoreboard players set @s cur_machine_tick_jk 0
# 加速设置
scoreboard players operation @s machine_tick_jk = collect_chest_basic_cd_jk machine_tick_jk
execute if entity @s[tag=accelerate_machine_jk] run scoreboard players operation @s machine_tick_jk = collect_chest_acc_cd_jk machine_tick_jk
tag @s remove accelerate_machine_jk