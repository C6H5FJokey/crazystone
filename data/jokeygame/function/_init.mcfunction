#jokeygame:_init
# 初始化jokeygame模块

data modify storage jokeygame:io rec set value []

# 重复注册，方便调试
scoreboard objectives add int dummy
# 类型id，包含所有需要注册的类型
scoreboard objectives add type_id_jk dummy
# 标记机器的运行的当前tick
scoreboard objectives add cur_machine_tick_jk dummy
# 标记机器目标tick
scoreboard objectives add machine_tick_jk dummy
# 标记机器增长tick速度
scoreboard objectives add add_machine_tick_jk dummy
# 全局机器id分配
scoreboard objectives add machine_id_jk dummy
# 标记物品id分配
scoreboard objectives add item_id_jk dummy
# id比较用的临时变量
scoreboard objectives add temp_machine_id_jk dummy
# setting 全局设置项
scoreboard objectives add setting_jk dummy
# 石头数量统计
scoreboard objectives add stone_count_jk dummy
# tp的cd
scoreboard objectives add tp_cd_jk dummy
# 记时的timer
scoreboard objectives add timer_jk dummy
# 显示分数
scoreboard objectives add display_jk dummy


# 全局id声明，说实话没什么用
execute if score global machine_id_jk matches -2147483648..2147483647 run scoreboard players set global machine_id_jk -2147483648

# 队伍声明
team add red_jk
team add green_jk
team add yellow_jk
team add blue_jk
team modify red_jk color red
team modify green_jk color green
team modify yellow_jk color yellow
team modify blue_jk color blue
team modify red_jk friendlyFire false
team modify green_jk friendlyFire false
team modify yellow_jk friendlyFire false
team modify blue_jk friendlyFire false
team modify red_jk nametagVisibility hideForOtherTeams
team modify green_jk nametagVisibility hideForOtherTeams
team modify yellow_jk nametagVisibility hideForOtherTeams
team modify blue_jk nametagVisibility hideForOtherTeams

scoreboard players set 2 int 2
scoreboard players set 4 int 4
scoreboard players set 3 int 3
scoreboard players set -1 int -1
scoreboard players set 10 int 10
scoreboard players set 60 int 60
scoreboard players set 20 int 20

function jokeygame:config