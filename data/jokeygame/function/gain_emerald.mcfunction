#jokeygame:gain_emerald
# jokeygame:rewarding调用

execute store result score inp int run random value 10..15
execute if entity @s[team=red_jk] store result score res int if entity @a[team=red_jk]
execute if entity @s[team=green_jk] store result score res int if entity @a[team=green_jk]
execute if entity @s[team=yellow_jk] store result score res int if entity @a[team=yellow_jk]
execute if entity @s[team=blue_jk] store result score res int if entity @a[team=blue_jk]
scoreboard players operation inp int /= res int
tellraw @a ["",{"text":"emerald: ","color":"dark_green","bold":true},{"text":"+","color":"gray"},{"score":{"name":"inp","objective":"int"},"color":"gray"}]
function vp_core:emerald/_add