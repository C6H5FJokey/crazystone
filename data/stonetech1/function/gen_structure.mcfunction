#stonetech1:gen_structure
# stonetech1:_gen异步调用

execute as @e[tag=hall_structure_builder,limit=1] run function vp_core:constructors/structure_builder/main
execute unless score vp_progress int matches 100 run return fail

# 加载完成，调用主程序
data modify entity @s data.area_info.load_func set value "stonetech1:main"