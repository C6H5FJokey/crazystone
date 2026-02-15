#jokeygame:main
# vp_game主程序

data modify storage jokeygame:io temp_state set from storage vp_core:io game_state
# 选择状态分支
execute if data storage jokeygame:io {temp_state:"prepared"} run function jokeygame:start_game
execute if data storage jokeygame:io {temp_state:"running"} run function jokeygame:running
execute if data storage jokeygame:io {temp_state:"rewarding"} run function jokeygame:rewarding