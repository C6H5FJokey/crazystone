scoreboard players operation @e[scores={machine_id_jk=-2147483648..}, type=#jokeygame:slots, tag=bamboo_slot_jk, distance=..1] temp_machine_id_jk = binding machine_id_jk
execute as @e[scores={machine_id_jk=-2147483648..}, type=#jokeygame:slots, tag=bamboo_slot_jk, distance=..1] run scoreboard players operation @s temp_machine_id_jk -= @s machine_id_jk
tag @e[type=#jokeygame:slots, scores={temp_machine_id_jk=0}, distance=..1, limit=1, sort=random] add temp_jk
scoreboard players set res int 0
execute if entity @n[type=#jokeygame:slots, tag=temp_jk, tag=bamboo_slot_chest_jk, distance=..1] run scoreboard players set res int 1
execute if entity @n[type=#jokeygame:slots, tag=temp_jk, tag=bamboo_slot_furnace_jk, distance=..1] run scoreboard players set res int 2
execute unless items entity @n[type=#jokeygame:slots, tag=temp_jk, distance=..1] container.0 * run scoreboard players set res int 0
execute if score res int matches 0 unless items entity @n[type=#jokeygame:slots, tag=temp_jk, distance=..1] container.0 * run tag @s add temp_replace_bamboo_jk
execute if score res int matches 1 at @n[type=#jokeygame:slots, tag=temp_jk, distance=..1] store result score res int run loot insert ~ ~ ~ loot blocks/bamboo
execute if score res int matches 1 run tag @s add temp_replace_bamboo_jk
execute if score res int matches 2 at @n[type=#jokeygame:slots, tag=temp_jk, distance=..1] if items block ~ ~ ~ container.0 * unless items block ~ ~ ~ container.1 * run tag @s add temp_replace_bamboo_jk
execute if score res int matches 2 at @n[type=#jokeygame:slots, tag=temp_jk, distance=..1] if items block ~ ~ ~ container.0 * if items block ~ ~ ~ container.1 bamboo[count~{min:1, max:63}] run tag @s add temp_replace_bamboo_jk
execute if score res int matches 2 at @n[type=#jokeygame:slots, tag=temp_jk, distance=..1] if items block ~ ~ ~ container.0 * run loot insert ~ ~ ~ loot blocks/bamboo
execute if entity @s[tag=temp_replace_bamboo_jk] as @n[type=#jokeygame:slots, tag=temp_jk, distance=..1] run loot replace entity @s container.0 loot blocks/bamboo
tag @s remove temp_replace_bamboo_jk
tag @e[type=#jokeygame:slots, distance=..1, tag=temp_jk] remove temp_jk