# Mob Scaling - Main tick function

# Update player data
execute as @a run function ms:player/update_xp
execute as @a run function ms:player/update_armor
execute as @a run function ms:player/calc_tier
execute as @a run function ms:player/update_distance
execute as @a run function ms:player/apply_distance_bonus
execute as @a run function ms:player/spawn_timer_tick

# Scale mobs near players
execute as @e[type=#ms:scalable_mobs,tag=!scaled,distance=..40] at @s if entity @p[distance=..32] run function ms:scale/apply
