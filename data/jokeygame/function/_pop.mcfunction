#jokeygame:_pop
# 临时对象出栈

data modify storage jokeygame:io input set from storage jokeygame:io rec[0]
data remove storage jokeygame:io rec[0]
function jokeygame:_proj