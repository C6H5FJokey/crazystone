# 目标为普通容器时的插入判定
# 输出：res=1 可合并末尾；res=0 需要新增槽；res_fail=1 禁止插入

scoreboard players set res_fail int 0
scoreboard players set res int 0
scoreboard players set res1 int 1
scoreboard players set res2 int 0

execute if items block ~ ~ ~ container.* * run scoreboard players set res2 int 1
execute if score res2 int matches 1 run scoreboard players set res int 1
execute if score res2 int matches 1 run data modify storage jokeygame:io temp2 set value {}
execute if score res2 int matches 1 run data modify storage jokeygame:io temp2 set from block ~ ~ ~ Items[-1]
execute if score res2 int matches 1 run function jokeygame:slot/pipe_slot/_add_last_slot_predicate
