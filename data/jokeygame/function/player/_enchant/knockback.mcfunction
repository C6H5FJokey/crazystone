execute store result score res1 int run data get storage jokeygame:io offhand."minecraft:knockback"
execute store result score res2 int run data get storage jokeygame:io mainhand."minecraft:knockback"
execute if score res1 int >= res2 int run scoreboard players operation res int = res1 int
execute if score res1 int = res2 int run scoreboard players add res int 1
execute if score res1 int < res2 int run scoreboard players operation res int = res2 int
execute store result storage jokeygame:io temp."minecraft:knockback" int 1.0 run scoreboard players get res int