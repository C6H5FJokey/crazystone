scoreboard players set clear setting_jk 1
execute as @e[type=item_display, tag=cobblestone_generator_jk] at @s run function jokeygame:machine/cobblestone_generator/_del
execute as @e[type=item_display, tag=bamboo_generator_jk] at @s run function jokeygame:machine/bamboo_generator/_del
execute as @e[type=marker, tag=collect_chest_jk] at @s run function jokeygame:machine/collect_chest/_del
kill @e[type=item_frame, tag=slot_jk]
kill @e[type=glow_item_frame, tag=slot_jk]

clear @a[tag=vp_gamer]
execute as @e[type=marker,tag=team_point_jk] at @s positioned ^0.5 ^0.5 ^0.5 run fill ^-6 ^ ^-2 ^7 ^5 ^11 air replace #jokeygame:to_main_state
execute as @e[type=marker,tag=team_point_jk] at @s positioned ^ ^ ^5 run kill @e[type=item, distance=..12]

scoreboard players set @e[type=marker, tag=team_point_jk] stone_count_jk 0

execute as @a[tag=vp_gamer] at @s run tp @s @n[type=marker,tag=team_point_jk]

execute as @e[type=marker, tag=team_point_jk] at @s as @p[distance=..5,tag=vp_gamer] run loot give @s loot jokeygame:machine/cobblestone_generator
execute as @e[type=marker, tag=team_point_jk] at @s as @p[distance=..5,tag=vp_gamer] run loot give @s loot jokeygame:machine/bamboo_generator
execute as @e[type=marker, tag=team_point_jk] at @s as @p[distance=..5,tag=vp_gamer] run loot give @s loot jokeygame:machine/collect_chest
execute as @e[type=marker, tag=team_point_jk] at @s as @p[distance=..5,tag=vp_gamer] run give @s crafting_table
execute as @e[type=marker, tag=team_point_jk] at @s as @p[distance=..5,tag=vp_gamer] run give @s wooden_pickaxe

scoreboard players set clear setting_jk 0