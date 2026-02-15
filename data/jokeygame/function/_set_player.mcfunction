#jokeygame:_set_player
# 初始化一名jokeygame玩家
# 输入玩家为执行者

# 死亡/复活设置
function vp_core:player_space/_get
data modify storage vp_core:io result.death_func set value "jokeygame:death_func"
data modify storage vp_core:io result.respawn_func set value "jokeygame:respawn_func"
function vp_core:player_space/_store