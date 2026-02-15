execute positioned ^ ^ ^1 if block ~ ~ ~ #air run playsound minecraft:block.lava.extinguish block @a ~ ~ ~ 0.5 2.0
execute positioned ^ ^ ^1 if block ~ ~ ~ #air run particle minecraft:smoke ~ ~0.5 ~ 0.125 0.125 0.125 0 20
execute positioned ^ ^ ^1 if block ~ ~ ~ #air run setblock ~ ~ ~ cobblestone
execute positioned ^ ^ ^1 as @e[type=#jokeygame:slots, tag=slot_jk, tag=mine_slot_jk, distance=..1] run data modify entity @s Fixed set value 1b