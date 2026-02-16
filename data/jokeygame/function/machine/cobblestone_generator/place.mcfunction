function jokeygame:player/facing
tag @s add place_player_temp_jk
execute as @e[type=glow_item_frame, tag=place_machine_jk] if items entity @s container.0 glow_item_frame[custom_data={machine:{id:"cobblestone_generator"}}] run tag @s add place_temp_jk
execute as @n[type=glow_item_frame, tag=place_temp_jk] at @s run function jokeygame:machine/cobblestone_generator/init_implement
kill @n[type=glow_item_frame, tag=place_temp_jk]
tag @e[type=glow_item_frame, tag=place_temp_jk] remove place_temp_jk
tag @s remove place_player_temp_jk
advancement revoke @s only jokeygame:place/cobblestone_generator