# Apply distance-based tier bonuses
scoreboard players set @s ms_player_dist_bonus 0
execute if score #ms_distance_enabled ms_player_tmp matches 1.. if score @s ms_player_dist_sq >= #ms_distance_threshold_far_sq ms_player_tmp run scoreboard players operation @s ms_player_dist_bonus = #ms_distance_bonus_far ms_player_tmp
execute if score #ms_distance_enabled ms_player_tmp matches 1.. if score @s ms_player_dist_sq >= #ms_distance_threshold_mid_sq ms_player_tmp unless score @s ms_player_dist_sq >= #ms_distance_threshold_far_sq ms_player_tmp run scoreboard players operation @s ms_player_dist_bonus = #ms_distance_bonus_mid ms_player_tmp
execute if score #ms_distance_enabled ms_player_tmp matches 1.. if score @s ms_player_dist_sq >= #ms_distance_threshold_near_sq ms_player_tmp unless score @s ms_player_dist_sq >= #ms_distance_threshold_mid_sq ms_player_tmp run scoreboard players operation @s ms_player_dist_bonus = #ms_distance_bonus_near ms_player_tmp
execute if score @s ms_player_dist_bonus matches 1.. run scoreboard players operation @s ms_player_tier += @s ms_player_dist_bonus
execute if score @s ms_player_tier > #ms_tier_max ms_player_tmp run scoreboard players operation @s ms_player_tier = #ms_tier_max ms_player_tmp
execute if score @s ms_player_tier matches ..-1 run scoreboard players set @s ms_player_tier 0
