# 首先自己的位置得是一个容器
# execute unless block ~ ~ ~ #jokeygame:containers run return fail
# 没东西你搬什么
execute unless items block ^ ^ ^-1 container.* * run return fail
execute positioned ^ ^ ^-1 if block ~ ~ ~ furnace unless items block ~ ~ ~ container.2 * run return fail
# 如果自己塞满了就放弃
execute if block ~ ~ ~ #jokeygame:containers store result score res int if data block ~ ~ ~ Items[]
execute if block ~ ~ ~ #jokeygame:containers if score res int matches 27 run return fail
execute if block ~ ~ ~ #jokeygame:furnace if data block ~ ~ ~ Items[{Slot:0b}] run return fail
# 过滤
scoreboard players set filter int 0
execute if items entity @s container.0 * run scoreboard players set filter int 1
execute if score filter int matches 1 run function jokeygame:slot/pipe_slot/_filter with entity @s Item
execute if score filter int matches 1 run return fail
# 开搬
execute positioned ^ ^ ^-1 if block ~ ~ ~ #jokeygame:containers run data modify storage jokeygame:io input set from block ~ ~ ~ Items[0]
execute positioned ^ ^ ^-1 if block ~ ~ ~ #jokeygame:furnace run data modify storage jokeygame:io input set from block ~ ~ ~ Items[{Slot: 2b}]
loot insert ~ ~ ~ loot jokeygame:utils/pipe
data modify storage jokeygame:io input.Slot set from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{pipe:{}}}}].Slot
data modify block ~ ~ ~ Items append from storage jokeygame:io input
execute positioned ^ ^ ^-1 if block ~ ~ ~ #jokeygame:containers run data remove block ~ ~ ~ Items[0]
execute positioned ^ ^ ^-1 if block ~ ~ ~ #jokeygame:furnace run data remove block ~ ~ ~ Items[{Slot: 2b}]