scoreboard players set res2 int 0
execute if block ~ ~ ~ #jokeygame:furnace unless items block ~ ~ ~ container.1 * if items entity e-0-0-0-0 weapon.mainhand #jokeygame:fuel run scoreboard players set res2 int 1
execute if score res2 int matches 1 run data modify storage jokeygame:io input.Slot set value 1b
execute if score res2 int matches 1 run return fail
loot insert ~ ~ ~ loot jokeygame:utils/pipe
data modify storage jokeygame:io input.Slot set from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{pipe:{}}}}].Slot