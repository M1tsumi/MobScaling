# Update distance from world origin
scoreboard players set @s ms_player_pos_x 0
scoreboard players set @s ms_player_pos_z 0
scoreboard players set @s ms_player_dist_sq 0
scoreboard players set @s ms_player_dist_bonus 0
execute store result score @s ms_player_pos_x run data get entity @s Pos[0] 1
execute store result score @s ms_player_pos_z run data get entity @s Pos[2] 1
scoreboard players operation @s ms_player_dist_sq = @s ms_player_pos_x
scoreboard players operation @s ms_player_dist_sq *= @s ms_player_pos_x
scoreboard players operation @s ms_player_dist_bonus = @s ms_player_pos_z
scoreboard players operation @s ms_player_dist_bonus *= @s ms_player_pos_z
scoreboard players operation @s ms_player_dist_sq += @s ms_player_dist_bonus
