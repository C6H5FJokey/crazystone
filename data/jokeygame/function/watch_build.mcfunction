#jokeygame:watch_build
# jokeygame:_build_async_start调用

function jokeygame:_get_tp_points
data modify entity @s Pos set from storage jokeygame:io result[0]
execute at @s run tp @a[tag=vp_joiner] ~ ~48 ~

tp @s 0 0 0