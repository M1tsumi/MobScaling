# Scale Wither based on player progression and configuration
# Store base health for calculation
scoreboard players set @s ms_boss_health 300

# Get highest player tier nearby
execute as @p[distance=..64] store result score ms_temp ms_temp run scoreboard players get @p ms_player_tier

# Calculate health multiplier
execute store result score ms_temp ms_temp run data get storage ms:config wither_health_multiplier
scoreboard players operation ms_boss_health ms_temp *= ms_temp ms_temp

# Apply health scaling
attribute @s minecraft:generic.max_health base set @s[scores={ms_boss_health=..}]
attribute @s minecraft:generic.max_health base set @s[scores={ms_boss_health=300..600}]

# Apply damage scaling
execute store result score ms_temp ms_temp run data get storage ms:config wither_damage_multiplier
attribute @s minecraft:generic.attack_damage base set 8
attribute @s minecraft:generic.attack_damage base set @s[scores={ms_temp=1..2}]

# Give enhanced effects at higher tiers
execute if score ms_temp ms_temp matches 4.. run effect give @s minecraft:speed 9999 1 true
execute if score ms_temp ms_temp matches 6.. run effect give @s minecraft:speed 9999 2 true
execute if score ms_temp ms_temp matches 8.. run effect give @s minecraft:speed 9999 3 true
execute if score ms_temp ms_temp matches 8.. run effect give @s minecraft:strength 9999 1 true

# Add boss tag
tag @s add ms_boss_scaled
