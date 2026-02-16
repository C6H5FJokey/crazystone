setblock ~ ~ ~ air
playsound block.stone.break block @a
particle minecraft:item{item:"dispenser"} ~ ~ ~ 0.1 0.1 0.1 0.1 100
execute unless score clear setting_jk matches 1 run loot spawn ~ ~ ~ loot jokeygame:machine/bamboo_generator
kill @s