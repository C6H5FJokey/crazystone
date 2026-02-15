# 用于标签，main为vcs_party使用的接口，单独开一个是因为模块不方便调试，这个单独拎出来并标注tick以方便调试

summon armor_stand ~ ~ ~ {Tags:["temp_as_jk"], Invisible:1b, Invulnerable:1b, Marker:1b, Silent:1b}

execute as @e[type=item,tag=] if items entity @s container.0 glow_item_frame[!custom_data] run kill @s
execute as @e[tag=slot_jk] at @s run function jokeygame:slot/tick_interface
execute as @e[tag=machine_jk] at @s run function jokeygame:machine/tick_interface

kill @e[type=armor_stand, tag=temp_as_jk]