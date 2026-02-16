#jokeygame:start_game
# jokeygame:main调用

# 设置游戏开始
gamerule keepInventory false
execute as @e[type=marker,tag=team_point_jk,tag=red_team_jk] run team add red_jk
execute as @e[type=marker,tag=team_point_jk,tag=green_team_jk] run team add green_jk
execute as @e[type=marker,tag=team_point_jk,tag=yellow_team_jk] run team add yellow_jk
execute as @e[type=marker,tag=team_point_jk,tag=blue_team_jk] run team add blue_jk
function jokeygame:player/allot
execute as @a[team=red_jk] positioned as @n[type=marker,tag=red_team_jk] run tp @s ^ ^ ^3
execute as @a[team=green_jk] positioned as @n[type=marker,tag=green_team_jk] run tp @s ^ ^ ^3
execute as @a[team=yellow_jk] positioned as @n[type=marker,tag=yellow_team_jk] run tp @s ^ ^ ^3
execute as @a[team=blue_jk] positioned as @n[type=marker,tag=blue_team_jk] run tp @s ^ ^ ^3
execute as @a[tag=vp_gamer] at @s run spawnpoint @s
execute as @e[type=marker, tag=team_point_jk] at @s as @p[distance=..5,tag=vp_gamer] run loot give @s loot jokeygame:machine/cobblestone_generator
execute as @e[type=marker, tag=team_point_jk] at @s as @p[distance=..5,tag=vp_gamer] run loot give @s loot jokeygame:machine/bamboo_generator
execute as @e[type=marker, tag=team_point_jk] at @s as @p[distance=..5,tag=vp_gamer] run loot give @s loot jokeygame:machine/collect_chest
execute as @e[type=marker, tag=team_point_jk] at @s as @p[distance=..5,tag=vp_gamer] run give @s crafting_table
execute as @e[type=marker, tag=team_point_jk] at @s as @p[distance=..5,tag=vp_gamer] run give @s wooden_pickaxe
# 生成资源
execute as @e[type=marker, tag=resource_jk] at @s run summon chest_minecart ~ ~ ~ {LootTable:"jokeygame:resource/normal"}

# 下一刻跳转到进行状态
data modify storage vp_core:io game_state set value "running"

# 不满足开始条件则跳转到结束状态
function jokeygame:_start_check
execute if score res int matches 0 run data modify storage vp_core:io game_state set value "over"