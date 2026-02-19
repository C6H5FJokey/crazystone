execute as @a[tag=vp_gamer, team=red_jk] if entity @n[type=marker,tag=team_point_jk,tag=red_team_jk, scores={stone_count_jk=..9}] run title @s actionbar {"text": "模拟阶段，游戏相关说明请查看进度，队伍获得10分或等待时间结束，将视作准备完成"}
execute as @a[tag=vp_gamer, team=green_jk] if entity @n[type=marker,tag=team_point_jk,tag=green_team_jk, scores={stone_count_jk=..9}] run title @s actionbar {"text": "模拟阶段，游戏相关说明请查看进度，队伍获得10分或等待时间结束，将视作准备完成"}
execute as @a[tag=vp_gamer, team=yellow_jk] if entity @n[type=marker,tag=team_point_jk,tag=yellow_team_jk, scores={stone_count_jk=..9}] run title @s actionbar {"text": "模拟阶段，游戏相关说明请查看进度，队伍获得10分或等待时间结束，将视作准备完成"}
execute as @a[tag=vp_gamer, team=blue_jk] if entity @n[type=marker,tag=team_point_jk,tag=blue_team_jk, scores={stone_count_jk=..9}] run title @s actionbar {"text": "模拟阶段，游戏相关说明请查看进度，队伍获得10分或等待时间结束，将视作准备完成"}
function jokeygame:_main
execute as @a[tag=vp_gamer, team=red_jk] if entity @n[type=marker,tag=team_point_jk,tag=red_team_jk,scores={stone_count_jk=10..}] run title @s actionbar [{"text": "红队", color:red}, {"text": "准备完毕！", color:white}]
execute as @a[tag=vp_gamer, team=green_jk] if entity @n[type=marker,tag=team_point_jk,tag=green_team_jk, scores={stone_count_jk=10..}] run title @s actionbar [{"text": "绿队", color:"green"}, {"text": "准备完毕！", color:white}]
execute as @a[tag=vp_gamer, team=yellow_jk] if entity @n[type=marker,tag=team_point_jk,tag=yellow_team_jk, scores={stone_count_jk=10..}] run title @s actionbar [{"text": "黄队", color:yellow}, {"text": "准备完毕！", color:white}]
execute as @a[tag=vp_gamer, team=blue_jk] if entity @n[type=marker,tag=team_point_jk,tag=blue_team_jk, scores={stone_count_jk=10..}] run title @s actionbar [{"text": "蓝队", color:blue}, {"text": "准备完毕！", color:white}]

scoreboard players add ready_tick cur_machine_tick_jk 1
scoreboard players operation temp timer_jk = ready_tick machine_tick_jk
scoreboard players operation temp timer_jk -= ready_tick cur_machine_tick_jk
scoreboard players add temp timer_jk 19
scoreboard players operation temp timer_jk /= 20 int
execute if score temp timer_jk matches ..-1 run scoreboard players set temp timer_jk 0
scoreboard players operation minutes timer_jk = temp timer_jk
scoreboard players operation seconds timer_jk = temp timer_jk
scoreboard players operation minutes timer_jk /= 60 int
scoreboard players operation seconds timer_jk %= 60 int
scoreboard objectives modify display_jk displayname ["距离正式开始时间: ",{text:"",extra:[{score:{objective:"timer_jk", name:"minutes"}},":",{score:{objective:"timer_jk", name:"seconds"}}]}]
execute as @e[type=marker,tag=team_point_jk] run scoreboard players operation @s display_jk = @s stone_count_jk

execute if score ready_tick cur_machine_tick_jk >= ready_tick machine_tick_jk run scoreboard players operation game_state machine_tick_jk = main_state machine_tick_jk
scoreboard players set res int 0
execute store result score res int if entity @e[type=marker,tag=team_point_jk,scores={stone_count_jk=10..}]
execute if score res int = team_num setting_jk run scoreboard players operation game_state machine_tick_jk = main_state machine_tick_jk

execute if score game_state machine_tick_jk = main_state machine_tick_jk run function jokeygame:_to_main_state