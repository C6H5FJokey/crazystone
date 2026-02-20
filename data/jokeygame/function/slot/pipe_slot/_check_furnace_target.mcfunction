# 目标为熔炉时的插入判定
# 规则：燃料仅 slot:1b，非燃料仅 slot:0b
# 输出：res=1 可合并末尾；res=0 需要新增槽；res_fail=1 禁止插入

scoreboard players set res_fail int 0
scoreboard players set res int 0
scoreboard players set res1 int 1
scoreboard players set res2 int 0
scoreboard players set fuel int 0

# 判定是否燃料
execute run data modify entity e-0-0-0-0 equipment.mainhand set from storage jokeygame:io input
execute if items entity e-0-0-0-0 weapon.mainhand #jokeygame:fuel run scoreboard players set fuel int 1

# 燃料仅 slot:1b
execute if score fuel int matches 1 if data block ~ ~ ~ Items[{Slot:1b}] run scoreboard players set res2 int 1
execute if score fuel int matches 1 if score res2 int matches 1 run scoreboard players set res int 1
execute if score fuel int matches 1 if score res2 int matches 1 run data modify storage jokeygame:io temp2 set value {}
execute if score fuel int matches 1 if score res2 int matches 1 run data modify storage jokeygame:io temp2 set from block ~ ~ ~ Items[{Slot:1b}]
execute if score fuel int matches 1 if score res2 int matches 1 run function jokeygame:slot/pipe_slot/_add_last_slot_predicate
# slot:1b 已有不同物品或超上限则拒绝
execute if score fuel int matches 1 if score res2 int matches 1 if score res1 int matches 1 run scoreboard players set res_fail int 1
execute if score fuel int matches 1 if score res2 int matches 1 if score res int matches 0 run scoreboard players set res_fail int 1

# 非燃料仅 slot:0b
execute if score fuel int matches 0 if data block ~ ~ ~ Items[{Slot:0b}] run scoreboard players set res2 int 1
execute if score fuel int matches 0 if score res2 int matches 1 run scoreboard players set res int 1
execute if score fuel int matches 0 if score res2 int matches 1 run data modify storage jokeygame:io temp2 set value {}
execute if score fuel int matches 0 if score res2 int matches 1 run data modify storage jokeygame:io temp2 set from block ~ ~ ~ Items[{Slot:0b}]
execute if score fuel int matches 0 if score res2 int matches 1 run function jokeygame:slot/pipe_slot/_add_last_slot_predicate
# slot:0b 已有不同物品或超上限则拒绝
execute if score fuel int matches 0 if score res2 int matches 1 if score res1 int matches 1 run scoreboard players set res_fail int 1
execute if score fuel int matches 0 if score res2 int matches 1 if score res int matches 0 run scoreboard players set res_fail int 1
