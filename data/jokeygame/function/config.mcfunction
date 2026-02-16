# 默认设置
execute unless score clear setting_jk matches -2147483648..2147483647 run scoreboard players set clear setting_jk 0
scoreboard players set team_num setting_jk 4

# 游戏时长设置，默认15分钟
scoreboard players set game_tick machine_tick_jk 18000
# 传送等待时间，默认3秒
scoreboard players set tp_cd tp_cd_jk 60

# 属性设置
scoreboard players set cobblestone_generator_basic_cd_jk machine_tick_jk 40
scoreboard players set bamboo_generator_basic_cd_jk machine_tick_jk 10
scoreboard players set pipe_slot_basic_cd_jk machine_tick_jk 20
scoreboard players set collect_chest_basic_cd_jk machine_tick_jk 20

scoreboard players set cobblestone_generator_acc_cd_jk machine_tick_jk 20
scoreboard players set bamboo_generator_acc_cd_jk machine_tick_jk 5
scoreboard players set pipe_slot_acc_cd_jk machine_tick_jk 10
scoreboard players set collect_chest_acc_cd_jk machine_tick_jk 10

# 挖掘时间注册表
scoreboard players set mine_slot_basic_cd_jk machine_tick_jk 600
scoreboard players set wooden_tool_add_cd_jk add_machine_tick_jk 20
scoreboard players set stone_tool_add_cd_jk add_machine_tick_jk 40
scoreboard players set copper_tool_add_cd_jk add_machine_tick_jk 50
scoreboard players set iron_tool_add_cd_jk add_machine_tick_jk 60
scoreboard players set diamond_tool_add_cd_jk add_machine_tick_jk 80
scoreboard players set netherite_tool_add_cd_jk add_machine_tick_jk 90
scoreboard players set golden_tool_add_cd_jk add_machine_tick_jk 120

# 类初始化注册表
scoreboard players set cobblestone_generator type_id_jk 0
scoreboard players set main_slot type_id_jk 1
scoreboard players set bamboo_slot type_id_jk 2
scoreboard players set common_slot type_id_jk 3
scoreboard players set empty_slot type_id_jk 4
scoreboard players set pipe_slot type_id_jk 5
scoreboard players set mine_slot type_id_jk 6

# 物品id注册表
scoreboard players set minecraft:air item_id_jk 0
scoreboard players set minecraft:stone item_id_jk 1
scoreboard players set minecraft:cobblestone item_id_jk 2
scoreboard players set minecraft:bamboo item_id_jk 3