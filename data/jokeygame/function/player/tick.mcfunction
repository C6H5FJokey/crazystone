execute if items entity @s weapon.offhand *[stored_enchantments] if items entity @s weapon.mainhand #jokeygame:can_enchant run function jokeygame:player/_enchant
execute if items entity @s weapon.mainhand #jokeygame:can_place[!can_place_on] run item modify entity @s weapon.mainhand jokeygame:can_place_on
execute if items entity @s weapon.offhand #jokeygame:can_place[!can_place_on] run item modify entity @s weapon.offhand jokeygame:can_place_on
execute if items entity @s weapon.mainhand #jokeygame:tools[!can_break] run item modify entity @s weapon.mainhand jokeygame:can_break
execute if items entity @s weapon.mainhand bucket[!can_place_on] run item modify entity @s weapon.mainhand jokeygame:can_bucket
execute if items entity @s weapon.offhand bucket[!can_place_on] run item modify entity @s weapon.offhand jokeygame:can_bucket

execute at @s if block ~ ~-1 ~ #jokeygame:concretes run tag @s add player_tp_jk
execute at @s if entity @e[type=marker, tag=exit_jk, distance=..1] run tag @s add player_tp_jk
execute if entity @s[tag=player_tp_jk] run scoreboard players add @s tp_cd_jk 1
execute if entity @s[tag=!player_tp_jk, scores={tp_cd_jk=1..}] run scoreboard players set @s tp_cd_jk 0
execute if entity @s[tag=player_tp_jk] at @s if block ~ ~-1 ~ #jokeygame:concretes run title @s actionbar {text:"正在传送至废弃矿井"}
execute if entity @s[tag=player_tp_jk] at @s if entity @e[type=marker, tag=exit_jk, distance=..1] run title @s actionbar {text:"正在撤离"}
execute if score @s tp_cd_jk >= tp_cd tp_cd_jk run function jokeygame:player/tp
execute if score @s tp_cd_jk >= tp_cd tp_cd_jk run scoreboard players set @s tp_cd_jk 0
tag @s remove player_tp_jk