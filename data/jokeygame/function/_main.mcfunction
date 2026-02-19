# 用于标签，main为vcs_party使用的接口，单独开一个是因为模块不方便调试，这个单独拎出来并标注tick以方便调试

summon armor_stand ~ ~ ~ {Tags:["temp_as_jk"], Invisible:1b, Invulnerable:1b, Marker:1b, Silent:1b, UUID:[I;14,0,0,0]}

execute as @a run function jokeygame:player/tick
execute as @e[type=item,tag=] if items entity @s container.0 glow_item_frame[!custom_data] run kill @s
execute as @e[tag=slot_jk] at @s run function jokeygame:slot/tick_interface
execute as @e[tag=machine_jk] at @s run function jokeygame:machine/tick_interface
execute as @e[type=item,tag=] if items entity @s container.0 #jokeygame:can_place[!can_place_on] run item modify entity @s container.0 jokeygame:can_place_on
execute as @e[type=item,tag=] if items entity @s container.0 #jokeygame:tools[!can_break] run item modify entity @s container.0 jokeygame:can_break
execute as @e[type=item,tag=] if items entity @s container.0 bucket[!can_place_on] run item modify entity @s container.0 jokeygame:can_bucket

# 撤离点冒烟
execute as @e[type=marker,tag=exit_jk] at @s run particle dust{color:[1,1,1],scale:2.0} ~ ~1 ~ 0.2 0.5 0.2 0 10

# 统计石头
execute as @n[type=marker,tag=red_team_jk] at @s run scoreboard players operation @s stone_count_jk += @e[type=marker,tag=collect_chest_jk,team=red_jk] stone_count_jk
execute as @n[type=marker,tag=green_team_jk] at @s run scoreboard players operation @s stone_count_jk += @e[type=marker,tag=collect_chest_jk,team=green_jk] stone_count_jk
execute as @n[type=marker,tag=yellow_team_jk] at @s run scoreboard players operation @s stone_count_jk += @e[type=marker,tag=collect_chest_jk,team=yellow_jk] stone_count_jk
execute as @n[type=marker,tag=blue_team_jk] at @s run scoreboard players operation @s stone_count_jk += @e[type=marker,tag=collect_chest_jk,team=blue_jk] stone_count_jk

kill e-0-0-0-0