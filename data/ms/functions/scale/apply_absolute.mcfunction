## Central absolute-scaling handler for regular mobs
# Sets entity max health based on tier multipliers from config

# Read current base health (assumes Attributes[0] is max_health)
scoreboard players set #ms_entity_base ms_temp 0
execute store result score #ms_entity_base ms_temp run data get entity @s Attributes[0].Base

# Tier 0
execute if score @s ms_mob_tier matches 0 run scoreboard players operation #ms_entity_new ms_temp = #ms_entity_base ms_temp
execute if score @s ms_mob_tier matches 0 run scoreboard players operation #ms_entity_new ms_temp *= #ms_health_multiplier_tier_0 ms_health_multiplier

# Tier 1
execute if score @s ms_mob_tier matches 1 run scoreboard players operation #ms_entity_new ms_temp = #ms_entity_base ms_temp
execute if score @s ms_mob_tier matches 1 run scoreboard players operation #ms_entity_new ms_temp *= #ms_health_multiplier_tier_1 ms_health_multiplier

# Tier 2
execute if score @s ms_mob_tier matches 2 run scoreboard players operation #ms_entity_new ms_temp = #ms_entity_base ms_temp
execute if score @s ms_mob_tier matches 2 run scoreboard players operation #ms_entity_new ms_temp *= #ms_health_multiplier_tier_2 ms_health_multiplier

# Tier 3
execute if score @s ms_mob_tier matches 3 run scoreboard players operation #ms_entity_new ms_temp = #ms_entity_base ms_temp
execute if score @s ms_mob_tier matches 3 run scoreboard players operation #ms_entity_new ms_temp *= #ms_health_multiplier_tier_3 ms_health_multiplier

# Tier 4
execute if score @s ms_mob_tier matches 4 run scoreboard players operation #ms_entity_new ms_temp = #ms_entity_base ms_temp
execute if score @s ms_mob_tier matches 4 run scoreboard players operation #ms_entity_new ms_temp *= #ms_health_multiplier_tier_4 ms_health_multiplier

# Tier 5
execute if score @s ms_mob_tier matches 5 run scoreboard players operation #ms_entity_new ms_temp = #ms_entity_base ms_temp
execute if score @s ms_mob_tier matches 5 run scoreboard players operation #ms_entity_new ms_temp *= #ms_health_multiplier_tier_5 ms_health_multiplier

# Tier 6
execute if score @s ms_mob_tier matches 6 run scoreboard players operation #ms_entity_new ms_temp = #ms_entity_base ms_temp
execute if score @s ms_mob_tier matches 6 run scoreboard players operation #ms_entity_new ms_temp *= #ms_health_multiplier_tier_6 ms_health_multiplier

# Tier 7
execute if score @s ms_mob_tier matches 7 run scoreboard players operation #ms_entity_new ms_temp = #ms_entity_base ms_temp
execute if score @s ms_mob_tier matches 7 run scoreboard players operation #ms_entity_new ms_temp *= #ms_health_multiplier_tier_7 ms_health_multiplier

# Tier 8
execute if score @s ms_mob_tier matches 8 run scoreboard players operation #ms_entity_new ms_temp = #ms_entity_base ms_temp
execute if score @s ms_mob_tier matches 8 run scoreboard players operation #ms_entity_new ms_temp *= #ms_health_multiplier_tier_8 ms_health_multiplier

# Divide by 100 to account for stored multipliers (they are stored *100)
scoreboard players set #ms_div100 ms_temp 100
execute if score @s ms_mob_tier matches 0..8 run scoreboard players operation #ms_entity_new ms_temp /= #ms_div100 ms_temp

# Store the computed value back to the entity's max_health base
execute if score @s ms_mob_tier matches 0..8 run execute store result entity @s Attributes[0].Base value 1 run scoreboard players get #ms_entity_new ms_temp

# Note: attack damage continues to use modifier-based scaling to avoid attribute-index assumptions
