tag @s add slot_jk
tag @s add pipe_slot_jk

scoreboard players set @s add_machine_tick_jk 1
scoreboard players set @s cur_machine_tick_jk 0
scoreboard players operation @s machine_tick_jk = pipe_slot_basic_cd_jk machine_tick_jk