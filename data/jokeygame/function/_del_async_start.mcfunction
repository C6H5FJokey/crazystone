#jokeygame:_del_async_start
# 开始析构游戏实例

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


data modify storage vp_core:io game_state set value "clearing"

# 调用析构主程序
schedule function jokeygame:_del_async_main 1t replace