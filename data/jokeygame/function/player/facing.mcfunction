#  yaw_facing int 0~3，超过范围会取余数，对应南西北东
#  pitch_facing int 0~2，超过范围会取余数，对应平视，向下看，向上看。
execute if entity @s[y_rotation=-45..45] run scoreboard players set yaw_facing int 0
execute if entity @s[y_rotation=45..135] run scoreboard players set yaw_facing int 1
execute if entity @s[y_rotation=135..225] run scoreboard players set yaw_facing int 2
execute if entity @s[y_rotation=225..315] run scoreboard players set yaw_facing int 3
execute if entity @s[x_rotation=-90..-45] run scoreboard players set pitch_facing int -1
execute if entity @s[x_rotation=-45..45] run scoreboard players set pitch_facing int 0
execute if entity @s[x_rotation=45..90] run scoreboard players set pitch_facing int 1