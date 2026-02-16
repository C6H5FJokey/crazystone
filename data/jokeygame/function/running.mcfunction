#jokeygame:running
# jokeygame:main调用

# 游戏主要逻辑

function jokeygame:_main
scoreboard players add game_tick cur_machine_tick_jk 1
scoreboard players operation temp timer_jk = game_tick machine_tick_jk
scoreboard players operation temp timer_jk -= game_tick cur_machine_tick_jk
scoreboard players add temp timer_jk 19
scoreboard players operation temp timer_jk /= 20 int
scoreboard players operation minutes timer_jk = temp timer_jk
scoreboard players operation seconds timer_jk = temp timer_jk
scoreboard players operation minutes timer_jk /= 60 int
scoreboard players operation seconds timer_jk %= 60 int
scoreboard players operation temp timer_jk %= 2 int
scoreboard objectives modify display_jk displayname ["剩余时间: ",{text:"",extra:[{score:{objective:"timer_jk", name:"minutes"}},":",{score:{objective:"timer_jk", name:"seconds"}}]}]
execute as @e[type=marker,tag=team_point_jk] run scoreboard players operation @s display_jk = @s stone_count_jk
# 获取玩家人数
execute store result score temp_cnt int if entity @a[tag=vp_gamer]

# 玩家人数不足则游戏直接结束
execute if score temp_cnt int matches 0 run data modify storage vp_core:io game_state set value "over"

# 游戏时间到，且没有相同分数时决出胜负
execute unless score game_tick cur_machine_tick_jk >= game_tick machine_tick_jk run return fail
scoreboard players set temp_cnt int 0
scoreboard players set temp stone_count_jk -2147483648
scoreboard players operation temp stone_count_jk > @e[type=marker, tag=team_point_jk] stone_count_jk
execute as @e[type=marker,tag=team_point_jk] if score @s stone_count_jk = temp stone_count_jk run scoreboard players add temp_cnt int 1
execute unless score temp_cnt int matches 1 run return fail
scoreboard players operation @e[type=marker,tag=team_point_jk] stone_count_jk -= temp stone_count_jk
execute if entity @e[type=marker,tag=team_point_jk,tag=red_team_jk,scores={stone_count_jk=0}] run tellraw @a ["",{"text":"winner: ","color":"gold","bold":true},{"selector":"@a[tag=vp_gamer, team=red_jk]","color":"red"}]
execute if entity @e[type=marker,tag=team_point_jk,tag=green_team_jk,scores={stone_count_jk=0}] run tellraw @a ["",{"text":"winner: ","color":"gold","bold":true},{"selector":"@a[tag=vp_gamer, team=green_jk]","color":"green"}]
execute if entity @e[type=marker,tag=team_point_jk,tag=yellow_team_jk,scores={stone_count_jk=0}] run tellraw @a ["",{"text":"winner: ","color":"gold","bold":true},{"selector":"@a[tag=vp_gamer, team=yellow_jk]","color":"yellow"}]
execute if entity @e[type=marker,tag=team_point_jk,tag=blue_team_jk,scores={stone_count_jk=0}] run tellraw @a ["",{"text":"winner: ","color":"gold","bold":true},{"selector":"@a[tag=vp_gamer, team=blue_jk]","color":"blue"}]
data modify storage vp_core:io game_state set value "rewarding"
# 奖励计时器
summon marker 0 0 0 {Tags:["vp_rewarding"],CustomName:"vp_rewarding"}
scoreboard players set @e[tag=vp_rewarding,limit=1] killtime 300
# 清理地图
scoreboard players set clear setting_jk 1
execute as @e[type=item_display, tag=cobblestone_generator_jk] at @s run function jokeygame:machine/cobblestone_generator/_del
execute as @e[type=item_display, tag=bamboo_generator_jk] at @s run function jokeygame:machine/bamboo_generator/_del
execute as @e[type=marker, tag=collect_chest_jk] at @s run function jokeygame:machine/collect_chest/_del
kill @e[type=item_frame, tag=slot_jk]
kill @e[type=glow_item_frame, tag=slot_jk]
execute as @e[type=chest_minecart, tag=resource_chest_jk] at @s run tp ~ -128 ~
kill @e[type=chest_minecart, tag=resource_chest_jk]
kill @e[type=marker, tag=team_point_jk]
kill @e[type=marker, tag=resource_jk]
kill @e[type=marker, tag=exit_jk]
kill @e[type=marker, tag=enter_jk]
team empty red_jk
team empty green_jk
team empty yellow_jk
team empty blue_jk
scoreboard objectives setdisplay sidebar
advancement revoke @a[tag=vp_gamer] from jokeygame:tips/welcome