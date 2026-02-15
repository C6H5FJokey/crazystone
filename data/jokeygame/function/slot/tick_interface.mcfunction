# 检查破坏
execute if block ^ ^ ^-0.5 #air run function jokeygame:slot/_del
# 更新每一个机器的tick，挖掘除外，其另算
scoreboard players operation @s cur_machine_tick_jk += @s add_machine_tick_jk
# 主副插槽注册表
execute if entity @s[tag=main_slot_jk] run function jokeygame:slot/main_slot/tick_implement
execute if entity @s[tag=common_slot_jk] run function jokeygame:slot/common_slot/tick_implement
# 插槽功能注册表
execute if entity @s[tag=bamboo_slot_jk] run function jokeygame:slot/bamboo_slot/tick_implement
execute if entity @s[tag=pipe_slot_jk] run function jokeygame:slot/pipe_slot/tick_implement
execute if entity @s[tag=mine_slot_jk] run function jokeygame:slot/mine_slot/tick_implement
# 无功能放最后
execute if entity @s[tag=empty_slot_jk] run function jokeygame:slot/empty_slot/tick_implement