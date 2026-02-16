#stonetech1:_reg
# 注册大厅，投射到临时对象

data modify storage stonetech1:io input set value {}
data modify storage stonetech1:io input.hall_center set value [-106.0d,-1.0d,45.0d]
data modify storage stonetech1:io input.hall_size set value 3
data modify storage stonetech1:io input.hall_height set value 1
data modify storage stonetech1:io input.hall_prefix set value "stonetech1:"
data modify storage stonetech1:io input.hall_spawn set value [0.0d,33.0d,0.0d]
data modify storage stonetech1:io input.hall_area_uuid set value ""

# 注册数据模板投射到临时对象
function stonetech1:_proj