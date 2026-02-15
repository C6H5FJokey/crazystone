execute as @e[type=item_frame, tag=] unless items entity @s container.0 * run tag @s add place_temp_jk
execute as @n[type=item_frame, tag=place_temp_jk] at @s run function jokeygame:slot/empty_slot/_init
tag @e[type=item_frame, tag=place_temp_jk] remove place_temp_jk
advancement revoke @s only jokeygame:place/place_slot