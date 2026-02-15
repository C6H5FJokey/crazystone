# 检测破坏 (1为需要破坏，0不需要)
# 先输入binding machine_id_jk
# 全局设置clear，用于设置是否掉落器械，1时不掉落
scoreboard players operation binding machine_id_jk = @s machine_id_jk
execute if function jokeygame:machine/bamboo_generator/_check_broken run function jokeygame:machine/bamboo_generator/_del
# 检测tick
execute if score @s cur_machine_tick_jk >= @s machine_tick_jk run function jokeygame:machine/bamboo_generator/_main
execute if score @s cur_machine_tick_jk >= @s machine_tick_jk run scoreboard players set @s cur_machine_tick_jk 0