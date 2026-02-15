data modify storage jokeygame:io input set value {}
$execute store success score res int run data modify storage jokeygame:io input set from block ^ ^ ^-1 Items[{id:"$(id)"}]
execute if score res int matches 0 run return fail
execute positioned ^ ^ ^-1 if block ~ ~ ~ #jokeygame:furnace unless data storage jokeygame:io input{Slot: 2b} run return fail
function jokeygame:slot/pipe_slot/_remove_slot with storage jokeygame:io input
loot insert ~ ~ ~ loot jokeygame:utils/pipe
data modify storage jokeygame:io input.Slot set from block ~ ~ ~ Items[{components:{"minecraft:custom_data":{pipe:{}}}}].Slot
data modify block ~ ~ ~ Items append from storage jokeygame:io input