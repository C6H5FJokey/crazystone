scoreboard players set res int 1
execute if block ~ ~ ~ #jokeygame:containers run scoreboard players set res int 0
execute if block ~ ~ ~ #jokeygame:furnace run scoreboard players set res int 0
execute if score res int matches 1 run tag @s add empty_slot_jk
execute if score res int matches 1 run tag @s remove pipe_slot_jk
execute if score res int matches 1 run return fail

# 检测破坏
# execute if block ^ ^ ^-1 #air run function jokeygame:slot/pipe_slot/_del
# 修改状态，在方块里时需要上锁
# 在方块里时不可拆
scoreboard players set res int 0
execute unless block ~ ~ ~ #air run scoreboard players set res int 1
# 水和岩浆中可拆
execute if block ~ ~ ~ #jokeygame:can_bucket run scoreboard players set res int 0
execute if block ~ ~ ~ #jokeygame:chests store result score res1 int run data get entity @s Facing
# 如果是箱子，展示框朝上时不可拆，此时展示框在底部
execute if block ~ ~ ~ #jokeygame:chests unless score res1 int matches 1 run scoreboard players set res int 0
execute if score res int matches 1 unless data entity @s {Fixed:1b} run data merge entity @s {Fixed:1b}
execute if score res int matches 0 unless data entity @s {Fixed:0b} run data merge entity @s {Fixed:0b}


# 检测tick
execute if score @s cur_machine_tick_jk >= @s machine_tick_jk run function jokeygame:slot/pipe_slot/_main
execute if score @s cur_machine_tick_jk >= @s machine_tick_jk run scoreboard players set @s cur_machine_tick_jk 0