# 首先自己的位置得是一个容器
# execute unless block ~ ~ ~ #jokeygame:containers run return fail
# 没东西你搬什么
execute unless items block ^ ^ ^-1 container.* * run return fail
execute positioned ^ ^ ^-1 if block ~ ~ ~ #jokeygame:furnace unless items block ~ ~ ~ container.2 * run return fail
# 如果自己塞满了就放弃
execute if block ~ ~ ~ #jokeygame:containers store result score res int if data block ~ ~ ~ Items[]
execute if block ~ ~ ~ #jokeygame:containers if score res int matches 27 run return fail
# 过滤
scoreboard players set filter int 0
execute if items entity @s container.0 * run scoreboard players set filter int 1
execute if score filter int matches 1 run function jokeygame:slot/pipe_slot/_filter with entity @s Item
execute if score filter int matches 1 run return fail
# 开搬
execute positioned ^ ^ ^-1 if block ~ ~ ~ #jokeygame:containers run data modify storage jokeygame:io input set from block ~ ~ ~ Items[0]
execute positioned ^ ^ ^-1 if block ~ ~ ~ #jokeygame:furnace run data modify storage jokeygame:io input set from block ~ ~ ~ Items[{Slot: 2b}]

# 目标容器/熔炉判定分离
execute if block ~ ~ ~ #jokeygame:containers run function jokeygame:slot/pipe_slot/_check_container_target
execute if block ~ ~ ~ #jokeygame:furnace run function jokeygame:slot/pipe_slot/_check_furnace_target
execute if score res_fail int matches 1 run return fail

execute positioned ^ ^ ^-1 if block ~ ~ ~ #jokeygame:containers run data remove block ~ ~ ~ Items[0]
execute positioned ^ ^ ^-1 if block ~ ~ ~ #jokeygame:furnace run data remove block ~ ~ ~ Items[{Slot: 2b}]

execute if score res int matches 0 run function jokeygame:slot/pipe_slot/_add_new_slot
execute if score res int matches 1 run function jokeygame:slot/pipe_slot/_add_last_slot

data modify block ~ ~ ~ Items append from storage jokeygame:io input
