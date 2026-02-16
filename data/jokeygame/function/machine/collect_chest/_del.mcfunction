execute unless block ~ ~ ~ #air run playsound block.copper.break block @a
execute unless block ~ ~ ~ #air run particle minecraft:item{item:"copper_chest"} ~ ~ ~ 0.1 0.1 0.1 0.1 100
summon chest_minecart ~ ~ ~ {Tags:["temp_chest_jk"], NoGravity:1b, Silent:1b, Invulnerable:1b}
data modify entity @n[type=chest_minecart, tag=temp_chest_jk] Items set from block ~ ~ ~ Items
kill @n[type=chest_minecart, tag=temp_chest_jk]
setblock ~ ~ ~ air
execute unless score clear setting_jk matches 1 run loot spawn ~ ~ ~ loot jokeygame:machine/collect_chest
kill @s