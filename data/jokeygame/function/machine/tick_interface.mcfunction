# interface

# 暂停运行的tag
scoreboard players set res int 0
execute if entity @s[tag=pause_machine_jk] run scoreboard players set res int 1
execute if score res int matches 1 run tag @s remove pause_machine_jk
execute if score res int matches 1 run return fail
# 更新每一个机器的tick
scoreboard players add @s cur_machine_tick_jk 1
# 注册表
execute if entity @s[tag=cobblestone_generator_jk] run function jokeygame:machine/cobblestone_generator/tick_implement
execute if entity @s[tag=bamboo_generator_jk] run function jokeygame:machine/bamboo_generator/tick_implement
execute if entity @s[tag=collect_chest_jk] run function jokeygame:machine/collect_chest/tick_implement