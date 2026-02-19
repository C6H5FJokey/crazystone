execute if score res int matches 1 unless data storage jokeygame:io temp2.id run scoreboard players set res int 0
execute if score res int matches 1 run data modify storage jokeygame:io temp1 set from storage jokeygame:io input
execute if score res int matches 1 run data remove storage jokeygame:io temp1.count
execute if score res int matches 1 run data remove storage jokeygame:io temp1.Slot
execute if score res int matches 1 run data modify storage jokeygame:io temp3 set from storage jokeygame:io temp2
execute if score res int matches 1 run data modify entity e-0-0-0-0 equipment.mainhand set from storage jokeygame:io temp3
execute if score res int matches 1 if items entity e-0-0-0-0 weapon.mainhand *[max_stack_size=1] run scoreboard players set res int 0
execute if score res int matches 1 if items entity e-0-0-0-0 weapon.mainhand *[max_stack_size=16] run scoreboard players set max_stack_size int 16
execute if score res int matches 1 if items entity e-0-0-0-0 weapon.mainhand *[max_stack_size=64] run scoreboard players set max_stack_size int 64
execute if score res int matches 1 store result score count2 int run data get storage jokeygame:io temp2.count
execute if score res int matches 1 if score count2 int >= max_stack_size int run scoreboard players set res int 0
execute if score res int matches 1 run data remove storage jokeygame:io temp2.count
execute if score res int matches 1 run data remove storage jokeygame:io temp2.Slot
execute store success score res1 int run data modify storage jokeygame:io temp1 merge from storage jokeygame:io temp2
execute if score res1 int matches 0 store result score count1 int run data get storage jokeygame:io input.count
execute if score res1 int matches 0 store result score count2 int run data get storage jokeygame:io temp3.count
execute if score res1 int matches 0 run scoreboard players operation count1 int += count2 int
execute if score count1 int > max_stack_size int run scoreboard players set res int 0