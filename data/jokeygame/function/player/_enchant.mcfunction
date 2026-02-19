data modify storage jokeygame:io offhand set value {}
data modify storage jokeygame:io mainhand set value {}
data modify storage jokeygame:io offhand set from entity @s equipment.offhand.components."minecraft:stored_enchantments"
data modify storage jokeygame:io mainhand set from entity @s SelectedItem.components."minecraft:enchantments"
data modify storage jokeygame:io temp set from storage jokeygame:io offhand
data modify storage jokeygame:io temp merge from storage jokeygame:io mainhand
execute if data storage jokeygame:io temp."minecraft:silk_touch" if data storage jokeygame:io temp."minecraft:fortune" run return fail
item replace entity e-0-0-0-0 weapon.offhand from entity @s weapon.offhand
item replace entity e-0-0-0-0 weapon.mainhand from entity @s weapon.mainhand
execute as e-0-0-0-0 run function jokeygame:player/_enchant/_merge
item replace entity @s weapon.mainhand from entity e-0-0-0-0 weapon.mainhand
item replace entity @s weapon.offhand with air