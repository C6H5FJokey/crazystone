tag @s add slot_jk
tag @s add mine_slot_jk

scoreboard players set @s add_machine_tick_jk 0
execute if items entity @s container.0 #jokeygame:wooden_tools run scoreboard players operation @s add_machine_tick_jk = wooden_tool_add_cd_jk add_machine_tick_jk
execute if items entity @s container.0 #jokeygame:stone_tools run scoreboard players operation @s add_machine_tick_jk = stone_tool_add_cd_jk add_machine_tick_jk
execute if items entity @s container.0 #jokeygame:copper_tools run scoreboard players operation @s add_machine_tick_jk = copper_tool_add_cd_jk add_machine_tick_jk
execute if items entity @s container.0 #jokeygame:iron_tools run scoreboard players operation @s add_machine_tick_jk = iron_tool_add_cd_jk add_machine_tick_jk
execute if items entity @s container.0 #jokeygame:diamond_tools run scoreboard players operation @s add_machine_tick_jk = diamond_tool_add_cd_jk add_machine_tick_jk
execute if items entity @s container.0 #jokeygame:netherite_tools run scoreboard players operation @s add_machine_tick_jk = netherite_tool_add_cd_jk add_machine_tick_jk
execute if items entity @s container.0 #jokeygame:golden_tools run scoreboard players operation @s add_machine_tick_jk = golden_tool_add_cd_jk add_machine_tick_jk

scoreboard players set res int 0
execute if items entity @s container.0 *[minecraft:enchantments~[{enchantments: "efficiency"}]] store result score res int run data get entity @s Item.components."minecraft:enchantments"."minecraft:efficiency"
scoreboard players operation res int *= res int
execute if score res int matches 1.. run scoreboard players add res int 1
scoreboard players operation res int *= 10 int
scoreboard players operation @s add_machine_tick_jk += res int

scoreboard players set @s cur_machine_tick_jk 0
scoreboard players operation @s machine_tick_jk = mine_slot_basic_cd_jk machine_tick_jk