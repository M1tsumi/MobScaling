# Scale Ender Dragon based on player progression and configuration
# Store base health for calculation
scoreboard players set @s ms_boss_health 200

# Get nearest player's tier for effect thresholds
execute as @p[distance=..128] store result score ms_temp ms_temp run scoreboard players get @p ms_player_tier

# Compute final health using loaded multiplier (#ms_dragon_health_mult stored at load, scaled by 100)
scoreboard players set #ms_boss_health_calc ms_temp 200
scoreboard players operation #ms_boss_health_calc ms_temp *= #ms_dragon_health_mult ms_temp
scoreboard players set #ms_div100 ms_temp 100
scoreboard players operation #ms_boss_health_calc ms_temp /= #ms_div100 ms_temp

# Apply health scaling: absolute mode sets base health directly, otherwise apply as modifier
execute if score #ms_scaling_absolute ms_player_tmp matches 1 run execute store result entity @s Attributes[0].Base value 1 run scoreboard players get #ms_boss_health_calc ms_temp
execute if score #ms_scaling_absolute ms_player_tmp matches 0 run execute store result entity @s Attributes[0].BaseModifiers[{Name:"generic.max_health",Amount:0.0f,Operation:0,UUID:[I;0,0,0,5]}] float 1 run scoreboard players get #ms_dragon_health_mult ms_temp

# Apply enhanced knockback resistance at higher tiers (unchanged)
execute if score ms_temp ms_temp matches 6.. run attribute @s minecraft:generic.knockback_resistance base set 0.8
execute if score ms_temp ms_temp matches 8.. run attribute @s minecraft:generic.knockback_resistance base set 1.0

# Give enhanced effects at higher tiers
execute if score ms_temp ms_temp matches 4.. run effect give @s minecraft:speed 9999 1 true
execute if score ms_temp ms_temp matches 6.. run effect give @s minecraft:speed 9999 2 true
execute if score ms_temp ms_temp matches 8.. run effect give @s minecraft:speed 9999 3 true
execute if score ms_temp ms_temp matches 8.. run effect give @s minecraft:strength 9999 1 true

# Add boss tag
tag @s add ms_boss_scaled
