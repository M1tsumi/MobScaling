# Apply scaling to boss mobs based on configuration
# This function handles Wither and Ender Dragon scaling

# Scale Wither if not already scaled
execute as @e[type=wither,tag=!ms_boss_scaled] run function ms:boss/scale_wither

# Scale Ender Dragon if not already scaled
execute as @e[type=ender_dragon,tag=!ms_boss_scaled] run function ms:boss/scale_dragon
