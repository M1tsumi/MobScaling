# Determine extra spawn count based on tier and multiplier
scoreboard players set @s ms_spawn_extra 0
execute if score @s ms_mob_tier matches 0 run scoreboard players operation @s ms_spawn_extra = #ms_spawn_extra_tier_0 ms_player_tmp
execute if score @s ms_mob_tier matches 1 run scoreboard players operation @s ms_spawn_extra = #ms_spawn_extra_tier_1 ms_player_tmp
execute if score @s ms_mob_tier matches 2 run scoreboard players operation @s ms_spawn_extra = #ms_spawn_extra_tier_2 ms_player_tmp
execute if score @s ms_mob_tier matches 3 run scoreboard players operation @s ms_spawn_extra = #ms_spawn_extra_tier_3 ms_player_tmp
execute if score @s ms_mob_tier matches 4 run scoreboard players operation @s ms_spawn_extra = #ms_spawn_extra_tier_4 ms_player_tmp
scoreboard players operation @s ms_spawn_extra *= #ms_spawn_multiplier ms_player_tmp
execute if score @s ms_spawn_extra matches 1.. run function ms:scale/spawn_extra_loop
