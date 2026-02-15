tag @s remove temp_jk
execute if score invisible int matches 0 run data modify entity @s Invisible set value 0b
# 输入为facing int，0~5对应下上北南西东
# 输入binding machine_id_jk 为绑定的机器id
# 输入slot_init type_id_jk 为注册slot的类型
# 注册机器id
scoreboard players operation @s machine_id_jk = binding machine_id_jk

# 添加tag
tag @s add slot_jk

# 注册表
execute if score slot_init type_id_jk = main_slot type_id_jk run function jokeygame:slot/main_slot/_init
execute if score slot_init type_id_jk = bamboo_slot type_id_jk run function jokeygame:slot/bamboo_slot/_init