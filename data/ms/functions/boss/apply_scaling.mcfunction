# Apply scaling to boss mobs based on configuration
# This function handles Wither and Ender Dragon scaling

# Count currently scaled bosses (global)
scoreboard players set #ms_boss_count ms_temp 0
execute as @e[tag=ms_boss_scaled] run scoreboard players add #ms_boss_count ms_temp 1

# Wither scaling: if boss spawn control is disabled, scale all unscaled Withers.
# If spawn control is enabled, only scale one unscaled Wither while under the configured limit.
execute if score #ms_enable_boss_spawn_ctrl ms_player_tmp matches 0 run execute as @e[type=wither,tag=!ms_boss_scaled] run function ms:boss/scale_wither
execute if score #ms_enable_boss_spawn_ctrl ms_player_tmp matches 1 if score #ms_boss_count ms_temp < #ms_boss_spawn_limit ms_player_tmp run execute as @e[type=wither,tag=!ms_boss_scaled,limit=1] run function ms:boss/scale_wither

# Ender Dragon scaling: same spawn control logic applies
execute if score #ms_enable_boss_spawn_ctrl ms_player_tmp matches 0 run execute as @e[type=ender_dragon,tag=!ms_boss_scaled] run function ms:boss/scale_dragon
execute if score #ms_enable_boss_spawn_ctrl ms_player_tmp matches 1 if score #ms_boss_count ms_temp < #ms_boss_spawn_limit ms_player_tmp run execute as @e[type=ender_dragon,tag=!ms_boss_scaled,limit=1] run function ms:boss/scale_dragon
