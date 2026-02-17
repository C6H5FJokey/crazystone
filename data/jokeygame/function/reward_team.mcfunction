scoreboard players set temp stone_count_jk -2147483648
scoreboard players operation temp stone_count_jk > @e[type=marker, tag=team_point_jk] stone_count_jk
execute as @e[type=marker,tag=team_point_jk] run scoreboard players operation @s temp_stone_count_jk = @s stone_count_jk
scoreboard players operation @e[type=marker,tag=team_point_jk] temp_stone_count_jk -= temp stone_count_jk
execute if entity @e[type=marker, scores={temp_stone_count_jk=0}, team=red_jk] as @a[tag=vp_gamer,team=red_jk] run function jokeygame:gain_emerald
execute if entity @e[type=marker, scores={temp_stone_count_jk=0}, team=green_jk] as @a[tag=vp_gamer,team=green_jk] run function jokeygame:gain_emerald
execute if entity @e[type=marker, scores={temp_stone_count_jk=0}, team=yellow_jk] as @a[tag=vp_gamer,team=yellow_jk] run function jokeygame:gain_emerald
execute if entity @e[type=marker, scores={temp_stone_count_jk=0}, team=blue_jk] as @a[tag=vp_gamer,team=blue_jk] run function jokeygame:gain_emerald