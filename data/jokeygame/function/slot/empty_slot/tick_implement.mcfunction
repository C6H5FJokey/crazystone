scoreboard players operation slot_to type_id_jk = empty_slot type_id_jk
execute if block ~ ~ ~ #jokeygame:containers run scoreboard players operation slot_to type_id_jk = pipe_slot type_id_jk
execute if block ~ ~ ~ #jokeygame:furnace run scoreboard players operation slot_to type_id_jk = pipe_slot type_id_jk
execute if items entity @s container.0 #pickaxes run scoreboard players operation slot_to type_id_jk = mine_slot type_id_jk

# 状态更改
execute unless score slot_to type_id_jk = empty_slot type_id_jk run scoreboard players set @s machine_tick_jk 1
execute unless score slot_to type_id_jk = empty_slot type_id_jk run tag @s remove empty_slot_jk
execute if score slot_to type_id_jk = pipe_slot type_id_jk run function jokeygame:slot/pipe_slot/_init
execute if score slot_to type_id_jk = mine_slot type_id_jk run function jokeygame:slot/mine_slot/_init

# 在方块里时不可拆
scoreboard players set res int 0
execute unless block ~ ~ ~ #air run scoreboard players set res int 1
execute if score res int matches 1 unless data entity @s {Fixed:1b} run data merge entity @s {Fixed:1b}
execute if score res int matches 0 unless data entity @s {Fixed:0b} run data merge entity @s {Fixed:0b}