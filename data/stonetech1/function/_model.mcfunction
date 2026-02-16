#stonetech1:_model
# 使用临时对象构建数据模板
# 输出数据模板storage stonetech1:io result

data modify storage stonetech1:io result set value {hall_center:[0.0d, 0.0d, 0.0d], hall_size:0, hall_height:0, hall_prefix:"", hall_spawn:[0.0d, 0.0d, 0.0d], hall_area_uuid:""}

data modify storage stonetech1:io result.hall_center set from storage vp_core:io hall_center
data modify storage stonetech1:io result.hall_size set from storage vp_core:io hall_size
data modify storage stonetech1:io result.hall_height set from storage vp_core:io hall_height
data modify storage stonetech1:io result.hall_prefix set from storage vp_core:io hall_prefix
data modify storage stonetech1:io result.hall_spawn set from storage vp_core:io hall_spawn
data modify storage stonetech1:io result.hall_area_uuid set from storage vp_core:io hall_area_uuid