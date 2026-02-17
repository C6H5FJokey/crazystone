#jokeygame:start_game
# jokeygame:main调用

# 设置游戏开始
gamerule keepInventory false
gamerule doTileDrops true
gamerule locatorBar false
scoreboard players set clear setting_jk 0
scoreboard players set game_tick cur_machine_tick_jk 0
execute as @e[type=marker,tag=team_point_jk,tag=red_team_jk] run team add red_jk
execute as @e[type=marker,tag=team_point_jk,tag=green_team_jk] run team add green_jk
execute as @e[type=marker,tag=team_point_jk,tag=yellow_team_jk] run team add yellow_jk
execute as @e[type=marker,tag=team_point_jk,tag=blue_team_jk] run team add blue_jk
function jokeygame:player/allot
execute as @a[team=red_jk] at @n[type=marker,tag=red_team_jk] run tp @s ^ ^ ^3
execute as @a[team=green_jk] at @n[type=marker,tag=green_team_jk] run tp @s ^ ^ ^3
execute as @a[team=yellow_jk] at @n[type=marker,tag=yellow_team_jk] run tp @s ^ ^ ^3
execute as @a[team=blue_jk] at @n[type=marker,tag=blue_team_jk] run tp @s ^ ^ ^3
execute as @a[tag=vp_gamer] at @s run spawnpoint @s
execute as @e[type=marker, tag=team_point_jk] at @s as @p[distance=..5,tag=vp_gamer] run loot give @s loot jokeygame:machine/cobblestone_generator
execute as @e[type=marker, tag=team_point_jk] at @s as @p[distance=..5,tag=vp_gamer] run loot give @s loot jokeygame:machine/bamboo_generator
execute as @e[type=marker, tag=team_point_jk] at @s as @p[distance=..5,tag=vp_gamer] run loot give @s loot jokeygame:machine/collect_chest
execute as @e[type=marker, tag=team_point_jk] at @s as @p[distance=..5,tag=vp_gamer] run give @s crafting_table
execute as @e[type=marker, tag=team_point_jk] at @s as @p[distance=..5,tag=vp_gamer] run give @s wooden_pickaxe
# 生成资源
execute as @e[type=marker, tag=resource_jk] at @s run summon chest_minecart ~ ~ ~ {LootTable:"jokeygame:resource/normal", Tags:["resource_chest_jk"]}
# 修改玩家模式
gamemode adventure @a[tag=vp_gamer]
# 计分板显示修改
scoreboard objectives setdisplay sidebar display_jk
scoreboard players display name @n[type=marker, tag=red_team_jk] display_jk {"text":"红队", "color":red}
scoreboard players display name @n[type=marker, tag=green_team_jk] display_jk {"text":"绿队", "color":green}
scoreboard players display name @n[type=marker, tag=yellow_team_jk] display_jk {"text":"黄队", "color":yellow}
scoreboard players display name @n[type=marker, tag=blue_team_jk] display_jk {"text":"蓝队", "color":blue}
# 进度重置
advancement revoke @a[tag=vp_gamer] only jokeygame:tips/blue_ice ice
advancement revoke @a[tag=vp_gamer] only jokeygame:tips/enchant get
advancement revoke @a[tag=vp_gamer] only jokeygame:tips/redstone_block redstone
advancement grant @a[tag=vp_gamer] only jokeygame:tips/welcome impossible
advancement grant @a[tag=vp_gamer] only jokeygame:tips/bamboo_generator impossible
advancement grant @a[tag=vp_gamer] only jokeygame:tips/cobblestone_generator impossible
advancement grant @a[tag=vp_gamer] only jokeygame:tips/collect_chest impossible
advancement grant @a[tag=vp_gamer] only jokeygame:tips/slot impossible
advancement grant @a[tag=vp_gamer] only jokeygame:tips/mineshaft impossible
advancement grant @a[tag=vp_gamer] only jokeygame:tips/cobblestone impossible
advancement grant @a[tag=vp_gamer] only jokeygame:tips/enchant impossible
advancement grant @a[tag=vp_gamer] only jokeygame:tips/redstone_block impossible
advancement grant @a[tag=vp_gamer] only jokeygame:tips/blue_ice impossible
# 提示
tellraw @a[tag=vp_gamer] {"text": "欢迎来到赤石科技，游戏要求在限定时间内尽可能多的获得石头，游戏内添加的机器、配方和机制详细请看看进度页面。"}
# 下一刻跳转到进行状态
data modify storage vp_core:io game_state set value "running"

# 不满足开始条件则跳转到结束状态
function jokeygame:_start_check
execute if score res int matches 0 run data modify storage vp_core:io game_state set value "over"