# Scale Ender Dragon based on player progression and configuration
# Store base health for calculation
scoreboard players set @s ms_boss_health 200

# Get highest player tier nearby
execute as @p[distance=..128] store result score ms_temp ms_temp run scoreboard players get @p ms_player_tier

# Apply health scaling based on tier
execute store result entity @s Attributes[0].Base value 200.0
execute store result entity @s Attributes[0].Base value 300.0 if score ms_temp ms_temp matches 4..
execute store result entity @s Attributes[0].Base value 400.0 if score ms_temp ms_temp matches 6..
execute store result entity @s Attributes[0].Base value 500.0 if score ms_temp ms_temp matches 8..

# Apply enhanced knockback resistance at higher tiers
execute if score ms_temp ms_temp matches 6.. run attribute @s minecraft:generic.knockback_resistance base set 0.8
execute if score ms_temp ms_temp matches 8.. run attribute @s minecraft:generic.knockback_resistance base set 1.0

# Give enhanced effects at higher tiers
execute if score ms_temp ms_temp matches 4.. run effect give @s minecraft:speed 9999 1 true
execute if score ms_temp ms_temp matches 6.. run effect give @s minecraft:speed 9999 2 true
execute if score ms_temp ms_temp matches 8.. run effect give @s minecraft:speed 9999 3 true
execute if score ms_temp ms_temp matches 8.. run effect give @s minecraft:strength 9999 1 true

# Add boss tag
tag @s add ms_boss_scaled
