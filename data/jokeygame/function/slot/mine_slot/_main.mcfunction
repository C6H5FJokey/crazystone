data modify entity @n[type=armor_stand, tag=temp_as_jk] equipment.mainhand set from entity @s Item
execute store result score res int as @n[type=armor_stand, tag=temp_as_jk] run loot insert ^ ^ ^-1 mine ~ ~ ~ mainhand
execute if score res int matches 0 run return fail
setblock ~ ~ ~ air
playsound block.stone.break block @a
execute store result score res int run random value 0..999
execute if items entity @s container.0 *[minecraft:enchantments={"minecraft:unbreaking":1}] run scoreboard players add res int 500
execute if items entity @s container.0 *[minecraft:enchantments={"minecraft:unbreaking":2}] run scoreboard players add res int 666
execute if items entity @s container.0 *[minecraft:enchantments={"minecraft:unbreaking":3}] run scoreboard players add res int 750
execute if items entity @s container.0 *[minecraft:enchantments~[{enchantments:"minecraft:unbreaking", "levels":{min:4}}]] run scoreboard players add res int 800
execute if score res int matches 0..999 if items entity @s container.0 *[damage~{durability:0}] run item replace entity @s container.0 with air
execute if score res int matches 0..999 unless items entity @s container.0 * run playsound entity.item.break block @a
execute if score res int matches 0..999 unless items entity @s container.0 * run return fail
execute if score res int matches 0..999 store result score damage int run data get entity @s Item.components."minecraft:damage"
execute if score res int matches 0..999 run scoreboard players add damage int 1
execute if score res int matches 0..999 store result entity @s Item.components."minecraft:damage" int 1.0 run scoreboard players get damage int