scoreboard players set res int 0
execute unless items entity @s container.0 * run scoreboard players set res int 1
execute if score res int matches 1 run tag @s remove mine_slot_jk
execute if score res int matches 1 run function jokeygame:slot/empty_slot/_init
execute if score res int matches 1 run return fail

# 检测破坏
# execute if block ^ ^ ^-1 #air run function jokeygame:slot/pipe_slot/_del
# 修改状态，在方块里时需要上锁
scoreboard players set res int 0
execute unless block ~ ~ ~ #air run scoreboard players set res int 1
execute if score res int matches 1 unless data entity @s {Fixed:1b} run data merge entity @s {Fixed:1b}
execute if score res int matches 0 unless data entity @s {Fixed:0b} run data merge entity @s {Fixed:0b}

# 判定挖掘方块
execute unless block ~ ~ ~ #jokeygame:can_mine run scoreboard players set @s cur_machine_tick_jk 0

# 检测tick
execute if score @s cur_machine_tick_jk >= @s machine_tick_jk run function jokeygame:slot/mine_slot/_main
execute if score @s cur_machine_tick_jk >= @s machine_tick_jk run scoreboard players set @s cur_machine_tick_jk 0


# 挖掘音效
scoreboard players operation res int = @s cur_machine_tick_jk
scoreboard players operation res int /= @s add_machine_tick_jk
scoreboard players operation res int %= 4 int
execute if score res int matches 1 run playsound block.stone.hit block @a ~ ~ ~ 0.4 0.5