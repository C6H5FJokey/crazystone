execute as @r[tag=vp_gamer,team=] run team join red_jk
execute if score team_num setting_jk matches 2.. as @r[tag=vp_gamer,team=] run team join green_jk
execute if score team_num setting_jk matches 3.. as @r[tag=vp_gamer,team=] run team join yellow_jk
execute if score team_num setting_jk matches 4.. as @r[tag=vp_gamer,team=] run team join blue_jk
execute if entity @a[tag=vp_gamer,team=] run function jokeygame:player/allot