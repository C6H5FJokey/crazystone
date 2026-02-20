# 首先自己的位置得是一个容器
# execute unless block ~ ~ ~ #jokeygame:containers run return fail
# 没东西你搬什么
execute unless items block ^ ^ ^-1 container.* * run return fail
execute positioned ^ ^ ^-1 if block ~ ~ ~ furnace unless items block ~ ~ ~ container.2 * run return fail
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

# 要求容器必须有东西
scoreboard players set res int 0
scoreboard players set res1 int 1
scoreboard players set res2 int 0
execute if items block ~ ~ ~ container.* * run scoreboard players set res2 int 1
execute if score res2 int matches 1 run scoreboard players set res int 1
execute if score res2 int matches 1 run data modify storage jokeygame:io temp2 set value {}
# 正常容器判定末尾物品
execute if score res2 int matches 1 if block ~ ~ ~ #jokeygame:containers run data modify storage jokeygame:io temp2 set from block ~ ~ ~ Items[-1]
# 熔炉先判定一次有的槽
execute if score res2 int matches 1 if block ~ ~ ~ #jokeygame:furnace run data modify storage jokeygame:io temp2 set from block ~ ~ ~ Items[0]
execute if score res2 int matches 1 if block ~ ~ ~ #jokeygame:furnace if data storage jokeygame:io temp2{Slot: 2b} run return fail
# 开始检查
execute if score res2 int matches 1 run function jokeygame:slot/pipe_slot/_add_last_slot_predicate
# 如果熔炉已经有了相同物品，因为上限爆了塞不进去，那就别送了
execute if score res2 int matches 1 if block ~ ~ ~ #jokeygame:furnace if score res1 int matches 0 run return fail
# 截断
execute if score res2 int matches 1 if score res int matches 1 run scoreboard players set res2 int 0
# 熔炉第二次判定
execute if score res2 int matches 1 if block ~ ~ ~ #jokeygame:furnace if score res int matches 0 run scoreboard players set res int 1
execute if score res2 int matches 1 run data modify storage jokeygame:io temp2 set value {}
# 看上去很奇怪，但是合理的，如果熔炉里只有产物，那么slot[0]一定是slot:2b, 否则无论如何第一轮如果可能一定测过slot:0b了，如果没有则第一轮测的是1b，这里再强行测1b后，一定是检测过两个槽能合并哪个槽了。
execute if score res2 int matches 1 run data modify storage jokeygame:io temp2 set from block ~ ~ ~ Items[{Slot: 1b}]
execute if score res2 int matches 1 run function jokeygame:slot/pipe_slot/_add_last_slot_predicate

execute if block ~ ~ ~ #jokeygame:furnace if score res int matches 0 if data block ~ ~ ~ Items[{Slot: 0b}] if data block ~ ~ ~ Items[{Slot: 1b}] run return fail
execute if block ~ ~ ~ #jokeygame:furnace if items block ~ ~ ~ container.1 * if items entity e-0-0-0-0 weapon.mainhand #jokeygame:fuel run return fail

execute positioned ^ ^ ^-1 if block ~ ~ ~ #jokeygame:containers run data remove block ~ ~ ~ Items[0]
execute positioned ^ ^ ^-1 if block ~ ~ ~ #jokeygame:furnace run data remove block ~ ~ ~ Items[{Slot: 2b}]

execute if score res int matches 0 run function jokeygame:slot/pipe_slot/_add_new_slot
execute if score res int matches 1 run function jokeygame:slot/pipe_slot/_add_last_slot

data modify block ~ ~ ~ Items append from storage jokeygame:io input
