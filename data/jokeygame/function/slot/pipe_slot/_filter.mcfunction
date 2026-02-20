data modify storage jokeygame:io input set value {}
$execute store success score res int run data modify storage jokeygame:io input set from block ^ ^ ^-1 Items[{id:"$(id)"}]
execute if score res int matches 0 run return fail
execute positioned ^ ^ ^-1 if block ~ ~ ~ #jokeygame:furnace unless data storage jokeygame:io input{Slot: 2b} run return fail

# 目标容器/熔炉判定分离
execute if block ~ ~ ~ #jokeygame:containers run function jokeygame:slot/pipe_slot/_check_container_target
execute if block ~ ~ ~ #jokeygame:furnace run function jokeygame:slot/pipe_slot/_check_furnace_target
execute if score res_fail int matches 1 run return fail

function jokeygame:slot/pipe_slot/_remove_slot with storage jokeygame:io input

execute if score res int matches 0 run function jokeygame:slot/pipe_slot/_add_new_slot
execute if score res int matches 1 run function jokeygame:slot/pipe_slot/_add_last_slot

data modify block ~ ~ ~ Items append from storage jokeygame:io input