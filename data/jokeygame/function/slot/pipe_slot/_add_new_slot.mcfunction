scoreboard players set res2 int 0
scoreboard players set fuel int 0

# 熔炉：只允许指定空槽（燃料->1b，非燃料->0b）
execute if block ~ ~ ~ #jokeygame:furnace run data modify entity e-0-0-0-0 equipment.mainhand set from storage jokeygame:io input
execute if block ~ ~ ~ #jokeygame:furnace if items entity e-0-0-0-0 weapon.mainhand #jokeygame:fuel run scoreboard players set fuel int 1
execute if block ~ ~ ~ #jokeygame:furnace if score fuel int matches 1 run data modify storage jokeygame:io input.Slot set value 1b
execute if block ~ ~ ~ #jokeygame:furnace if score fuel int matches 0 run data modify storage jokeygame:io input.Slot set value 0b
execute if block ~ ~ ~ #jokeygame:furnace run return fail

# 普通容器：使用末尾插入逻辑
loot insert ~ ~ ~ loot jokeygame:utils/pipe
data modify storage jokeygame:io input.Slot set from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{pipe:{}}}}].Slot