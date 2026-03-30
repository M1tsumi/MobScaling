# Scale Wither based on player progression and configuration
# Store base health for calculation
scoreboard players set @s ms_boss_health 300

# Get nearest player's tier for effect thresholds
execute as @p[distance=..64] store result score ms_temp ms_temp run scoreboard players get @p ms_player_tier

# Compute final health using loaded multiplier (#ms_wither_health_mult stored at load, scaled by 100)
scoreboard players set #ms_boss_health_calc ms_temp 300
scoreboard players operation #ms_boss_health_calc ms_temp *= #ms_wither_health_mult ms_temp
scoreboard players set #ms_div100 ms_temp 100
scoreboard players operation #ms_boss_health_calc ms_temp /= #ms_div100 ms_temp

# Apply health scaling: absolute mode sets base health directly, otherwise apply as attribute modifier
execute if score #ms_scaling_absolute ms_player_tmp matches 1 run execute store result entity @s Attributes[0].Base value 1 run scoreboard players get #ms_boss_health_calc ms_temp
execute if score #ms_scaling_absolute ms_player_tmp matches 0 run execute store result entity @s Attributes[0].BaseModifiers[{Name:"generic.max_health",Amount:0.0f,Operation:0,UUID:[I;0,0,0,5]}] float 1 run scoreboard players get #ms_wither_health_mult ms_temp

# Apply damage scaling via modifier (consistent across modes)
execute store result entity @s Attributes[0].BaseModifiers[{Name:"generic.attack_damage",Amount:0.0f,Operation:0,UUID:[I;0,0,0,6]}] float 1 run scoreboard players get #ms_wither_damage_mult ms_temp

# Give enhanced effects at higher nearby player tiers
execute if score ms_temp ms_temp matches 4.. run effect give @s minecraft:speed 9999 1 true
execute if score ms_temp ms_temp matches 6.. run effect give @s minecraft:speed 9999 2 true
execute if score ms_temp ms_temp matches 8.. run effect give @s minecraft:speed 9999 3 true
execute if score ms_temp ms_temp matches 8.. run effect give @s minecraft:strength 9999 1 true

# Add boss tag
tag @s add ms_boss_scaled
