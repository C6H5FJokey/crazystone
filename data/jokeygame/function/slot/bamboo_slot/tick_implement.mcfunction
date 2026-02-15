# 检测破坏 (1为需要破坏，0不需要)
# 先输入binding machine_id_jk
scoreboard players operation binding machine_id_jk = @s machine_id_jk
# execute if function jokeygame:slot/bamboo_slot/_check_broken run function jokeygame:slot/bamboo_slot/_del
# 有箱子时让自己变为bamboo_slot_chest_jk，通知机器直接传输物料到容器中
tag @s remove bamboo_slot_chest_jk
execute if block ~ ~ ~ #jokeygame:containers run tag @s add bamboo_slot_chest_jk
tag @s remove bamboo_slot_furnace_jk
execute if block ~ ~ ~ #jokeygame:furnace run tag @s add bamboo_slot_furnace_jk
# 修改状态，有物品时解锁，但在方块里或者没物品时上锁，
scoreboard players set res int 0
execute if items entity @s container.0 * run scoreboard players set res int 0
execute if block ~ ~ ~ air run scoreboard players set res int 0
execute unless items entity @s container.0 * run scoreboard players set res int 1
execute unless block ~ ~ ~ #air run scoreboard players set res int 1
execute if score res int matches 1 unless data entity @s {Fixed:1b} run data merge entity @s {Fixed:1b}
execute if score res int matches 0 unless data entity @s {Fixed:0b} run data merge entity @s {Fixed:0b}