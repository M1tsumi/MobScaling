# Mob Scaling v3.0.0 - Main tick function

# Update player data
execute as @a run function ms:player/update_xp
execute as @a run function ms:player/update_armor
execute as @a run function ms:player/calc_tier

# Apply world difficulty modifiers if enabled
execute if data storage ms:config {world_difficulty_integration:1} run function ms:difficulty/main

# Apply dimension modifiers if enabled
execute if data storage ms:config {dimension_scaling_enabled:1} run function ms:dimension/main

execute as @a run function ms:player/update_distance
execute as @a run function ms:player/apply_distance_bonus
execute as @a run function ms:player/spawn_timer_tick

# Scale regular mobs near players
execute as @e[type=#ms:scalable_mobs,tag=!scaled,distance=..40] at @s if entity @p[distance=..32] run function ms:scale/apply

# Scale boss mobs if enabled
execute if data storage ms:config {boss_scaling_enabled:1} run function ms:boss/apply_scaling
