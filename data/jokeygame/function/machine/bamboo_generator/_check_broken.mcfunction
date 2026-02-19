scoreboard players set res int 0
execute as @e[scores={machine_id_jk=-2147483648..}, type=#jokeygame:slots, tag=main_slot_jk, distance=..1] if score @s machine_id_jk = binding machine_id_jk \
    run scoreboard players add res int 1
execute unless score res int matches 1 run return 1
execute if block ^ ^1 ^ deepslate run return 1