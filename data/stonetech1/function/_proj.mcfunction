#stonetech1:_proj
# 把数据模板投射到临时对象
# 输入数据模板storage stonetech1:io input

data modify storage vp_core:io hall_center set from storage stonetech1:io input.hall_center
data modify storage vp_core:io hall_size set from storage stonetech1:io input.hall_size
data modify storage vp_core:io hall_height set from storage stonetech1:io input.hall_height
data modify storage vp_core:io hall_prefix set from storage stonetech1:io input.hall_prefix
data modify storage vp_core:io hall_spawn set from storage stonetech1:io input.hall_spawn
data modify storage vp_core:io hall_area_uuid set from storage stonetech1:io input.hall_area_uuid