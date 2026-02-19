function jokeygame:_main

scoreboard players add game_tick cur_machine_tick_jk 1
scoreboard players operation temp timer_jk = game_tick machine_tick_jk
scoreboard players operation temp timer_jk -= game_tick cur_machine_tick_jk
scoreboard players add temp timer_jk 19
scoreboard players operation temp timer_jk /= 20 int
execute if score temp timer_jk matches ..-1 run scoreboard players set temp timer_jk 0
scoreboard players operation minutes timer_jk = temp timer_jk
scoreboard players operation seconds timer_jk = temp timer_jk
scoreboard players operation minutes timer_jk /= 60 int
scoreboard players operation seconds timer_jk %= 60 int
scoreboard objectives modify display_jk displayname ["剩余时间: ",{text:"",extra:[{score:{objective:"timer_jk", name:"minutes"}},":",{score:{objective:"timer_jk", name:"seconds"}}]}]
execute as @e[type=marker,tag=team_point_jk] run scoreboard players operation @s display_jk = @s stone_count_jk