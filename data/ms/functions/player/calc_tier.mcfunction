scoreboard players set @s ms_player_tmp 0
scoreboard players operation @s ms_player_tmp = @s ms_player_xp
scoreboard players operation @s ms_player_tmp /= #ms_xp_div ms_player_tmp

scoreboard players set @s ms_player_tmp2 0
scoreboard players operation @s ms_player_tmp2 = @s ms_player_armor
scoreboard players operation @s ms_player_tmp2 /= #ms_armor_div ms_player_tmp

# Combine XP and (optionally) armor tiers
scoreboard players operation @s ms_player_tier = @s ms_player_tmp
# Include armor contribution only when enabled in config
execute if score #ms_armor_weight ms_player_tmp matches 1 run scoreboard players operation @s ms_player_tier += @s ms_player_tmp2
scoreboard players operation @s ms_player_tier_base = @s ms_player_tier

# Allow explicit tier thresholds (xp-based) to override base tier
execute if score @s ms_player_xp >= #ms_tier_threshold_1 ms_player_tmp run scoreboard players set @s ms_player_tier 1
execute if score @s ms_player_xp >= #ms_tier_threshold_2 ms_player_tmp run scoreboard players set @s ms_player_tier 2
execute if score @s ms_player_xp >= #ms_tier_threshold_3 ms_player_tmp run scoreboard players set @s ms_player_tier 3
execute if score @s ms_player_xp >= #ms_tier_threshold_4 ms_player_tmp run scoreboard players set @s ms_player_tier 4
execute if score @s ms_player_xp >= #ms_tier_threshold_5 ms_player_tmp run scoreboard players set @s ms_player_tier 5
execute if score @s ms_player_xp >= #ms_tier_threshold_6 ms_player_tmp run scoreboard players set @s ms_player_tier 6
execute if score @s ms_player_xp >= #ms_tier_threshold_7 ms_player_tmp run scoreboard players set @s ms_player_tier 7
execute if score @s ms_player_xp >= #ms_tier_threshold_8 ms_player_tmp run scoreboard players set @s ms_player_tier 8

# Apply biome and event bonuses
scoreboard players operation @s ms_player_tier += @s ms_biome_bonus
scoreboard players operation @s ms_player_tier += @s ms_event_bonus

# Apply max tier limit from config
execute store result score #ms_tier_max ms_player_tmp run data get storage ms:config max_tier
execute if score #ms_tier_max ms_player_tmp matches 0 run scoreboard players set #ms_tier_max ms_player_tmp 8
execute if score @s ms_player_tier > #ms_tier_max ms_player_tmp run scoreboard players operation @s ms_player_tier = #ms_tier_max ms_player_tmp

# Ensure tier is not negative
execute if score @s ms_player_tier matches ..-1 run scoreboard players set @s ms_player_tier 0
