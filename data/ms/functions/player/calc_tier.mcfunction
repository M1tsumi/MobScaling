scoreboard players set @s ms_player_tmp 0
scoreboard players operation @s ms_player_tmp = @s ms_player_xp
scoreboard players operation @s ms_player_tmp /= #ms_xp_div ms_player_tmp

scoreboard players set @s ms_player_tmp2 0
scoreboard players operation @s ms_player_tmp2 = @s ms_player_armor
scoreboard players operation @s ms_player_tmp2 /= #ms_armor_div ms_player_tmp

# Combine XP and armor tiers
scoreboard players operation @s ms_player_tier = @s ms_player_tmp
scoreboard players operation @s ms_player_tier += @s ms_player_tmp2
scoreboard players operation @s ms_player_tier_base = @s ms_player_tier

# Apply biome and event bonuses
scoreboard players operation @s ms_player_tier += @s ms_biome_bonus
scoreboard players operation @s ms_player_tier += @s ms_event_bonus

# Apply max tier limit from config
execute store result score #ms_tier_max ms_player_tmp run data get storage ms:config max_tier
execute if score #ms_tier_max ms_player_tmp matches 0 run scoreboard players set #ms_tier_max ms_player_tmp 8
execute if score @s ms_player_tier > #ms_tier_max ms_player_tmp run scoreboard players operation @s ms_player_tier = #ms_tier_max ms_player_tmp

# Ensure tier is not negative
execute if score @s ms_player_tier matches ..-1 run scoreboard players set @s ms_player_tier 0
