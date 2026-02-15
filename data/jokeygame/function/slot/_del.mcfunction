execute if items entity @s container.* * run loot spawn ~ ~ ~ loot jokeygame:utils/placeholder
execute if items entity @s container.* * run data modify storage jokeygame:io input set from entity @s Item
execute as @e[type=item, tag=] if items entity @s container.0 stone[custom_data={placeholder:{}}] run data modify entity @s Item set from storage jokeygame:io input
execute if entity @s[type=item_frame] run loot spawn ~ ~ ~ loot jokeygame:utils/item_frame
kill @s