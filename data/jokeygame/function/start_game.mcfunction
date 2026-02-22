#jokeygame:start_game
# jokeygame:main调用

# 设置游戏开始
gamerule keepInventory false
gamerule doTileDrops true
gamerule locatorBar false
scoreboard players set clear setting_jk 0
scoreboard players set game_tick cur_machine_tick_jk 0
scoreboard players set ready_tick cur_machine_tick_jk 0
# 获取玩家数量以设置team_num
execute store result score team_num cur_machine_tick_jk if entity @a[tag=vp_gamer]
scoreboard players operation team_num cur_machine_tick_jk < team_num setting_jk
# 设置游戏内状态
scoreboard players operation game_state machine_tick_jk = ready_state machine_tick_jk
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
advancement revoke @a[tag=vp_gamer] only jokeygame:tips/packed_ice ice
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
advancement grant @a[tag=vp_gamer] only jokeygame:tips/packed_ice impossible
advancement grant @a[tag=vp_gamer] only jokeygame:tips/magic_bundle impossible
# 模拟模式物资
loot give @a[tag=vp_gamer] loot jokeygame:machine/bamboo_generator
loot give @a[tag=vp_gamer] loot jokeygame:machine/cobblestone_generator
loot give @a[tag=vp_gamer] loot jokeygame:machine/collect_chest
give @a[tag=vp_gamer] crafting_table
give @a[tag=vp_gamer] netherite_pickaxe
give @a[tag=vp_gamer] furnace
give @a[tag=vp_gamer] blast_furnace
give @a[tag=vp_gamer] ice 9
give @a[tag=vp_gamer] redstone 9
give @a[tag=vp_gamer] enchanted_book[stored_enchantments={efficiency:5, fortune:4}]
give @a[tag=vp_gamer] enchanted_book[stored_enchantments={silk_touch:1}]
give @a[tag=vp_gamer] stick 32
give @a[tag=vp_gamer,team=red_jk] red_bundle[item_name="魔法口袋"]
give @a[tag=vp_gamer,team=green_jk] green_bundle[item_name="魔法口袋"]
give @a[tag=vp_gamer,team=yellow_jk] yellow_bundle[item_name="魔法口袋"]
give @a[tag=vp_gamer,team=blue_jk] blue_bundle[item_name="魔法口袋"]
# 提示
tellraw @a[tag=vp_gamer] {"text": "欢迎来到赤石科技，游戏要求在限定时间内尽可能多的获得石头，游戏内添加的机器、配方和机制详细请看看进度页面。"}
# 下一刻跳转到进行状态
data modify storage vp_core:io game_state set value "running"

# 不满足开始条件则跳转到结束状态
function jokeygame:_start_check
execute if score res int matches 0 run data modify storage vp_core:io game_state set value "over"