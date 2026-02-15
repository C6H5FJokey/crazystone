# 检测是不是机器放的，机器放的用荧光展示框
# 输入invisible int, 0为不隐藏，1为隐藏
# 输入facing int，0~5对应下上北南西东
# 输入binding machine_id_jk 为绑定的机器id
# 输入slot_init type_id_jk 为注册slot的类型
execute if score facing int matches 0 if entity @s[tag=machine_jk] run summon glow_item_frame ~ ~ ~ {Facing:0b, Invisible:1b, Tags:[temp_jk]}
execute if score facing int matches 1 if entity @s[tag=machine_jk] run summon glow_item_frame ~ ~ ~ {Facing:1b, Invisible:1b, Tags:[temp_jk]}
execute if score facing int matches 2 if entity @s[tag=machine_jk] run summon glow_item_frame ~ ~ ~ {Facing:2b, Invisible:1b, Tags:[temp_jk]}
execute if score facing int matches 3 if entity @s[tag=machine_jk] run summon glow_item_frame ~ ~ ~ {Facing:3b, Invisible:1b, Tags:[temp_jk]}
execute if score facing int matches 4 if entity @s[tag=machine_jk] run summon glow_item_frame ~ ~ ~ {Facing:4b, Invisible:1b, Tags:[temp_jk]}
execute if score facing int matches 5 if entity @s[tag=machine_jk] run summon glow_item_frame ~ ~ ~ {Facing:5b, Invisible:1b, Tags:[temp_jk]}
execute if score facing int matches 0 unless entity @s[tag=machine_jk] run summon item_frame ~ ~ ~ {Facing:0b, Invisible:1b, Tags:[temp_jk]}
execute if score facing int matches 1 unless entity @s[tag=machine_jk] run summon item_frame ~ ~ ~ {Facing:1b, Invisible:1b, Tags:[temp_jk]}
execute if score facing int matches 2 unless entity @s[tag=machine_jk] run summon item_frame ~ ~ ~ {Facing:2b, Invisible:1b, Tags:[temp_jk]}
execute if score facing int matches 3 unless entity @s[tag=machine_jk] run summon item_frame ~ ~ ~ {Facing:3b, Invisible:1b, Tags:[temp_jk]}
execute if score facing int matches 4 unless entity @s[tag=machine_jk] run summon item_frame ~ ~ ~ {Facing:4b, Invisible:1b, Tags:[temp_jk]}
execute if score facing int matches 5 unless entity @s[tag=machine_jk] run summon item_frame ~ ~ ~ {Facing:5b, Invisible:1b, Tags:[temp_jk]}

# execute if entity @s[tag=machine_jk] summon glow_item_frame run function jokeygame:slot/init_implement
# execute unless entity @s[tag=machine_jk] summon item_frame run function jokeygame:slot/init_implement

execute as @n[tag=temp_jk] run function jokeygame:slot/init_implement