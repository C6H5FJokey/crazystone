function jokeygame:player/facing
execute as @n[type=glow_item_frame, tag=place_temp_jk] at @s run function jokeygame:machine/bamboo_generator/init_implement
kill @n[type=glow_item_frame, tag=place_temp_jk]
advancement revoke @s only jokeygame:place/bamboo_generator