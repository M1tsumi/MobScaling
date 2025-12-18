# Mob Scaling – initialization

scoreboard objectives add ms_player_xp dummy
scoreboard objectives add ms_player_armor dummy
scoreboard objectives add ms_player_tier dummy
scoreboard objectives add ms_player_tmp dummy
scoreboard objectives add ms_player_tmp2 dummy
scoreboard objectives add ms_player_pos_x dummy
scoreboard objectives add ms_player_pos_z dummy
scoreboard objectives add ms_player_dist_sq dummy
scoreboard objectives add ms_player_dist_bonus dummy
scoreboard objectives add ms_spawn_timer dummy
scoreboard objectives add ms_spawn_counter dummy
scoreboard objectives add ms_spawn_extra dummy
scoreboard objectives add ms_mob_tier dummy
scoreboard objectives add ms_health_multiplier dummy
scoreboard objectives add ms_damage_multiplier dummy

scoreboard players set #ms_xp_div ms_player_tmp 15
scoreboard players set #ms_armor_div ms_player_tmp 10
execute store result score #ms_tier_max ms_player_tmp run data get storage ms:config max_tier
# Add default max_tier if data get returns 0
execute if score #ms_tier_max ms_player_tmp matches 0 run scoreboard players set #ms_tier_max ms_player_tmp 8
execute store result score #ms_difficulty_offset ms_player_tmp run data get storage ms:config difficulty_offset
execute store result score #ms_distance_enabled ms_player_tmp run data get storage ms:config difficulty_enabled
execute store result score #ms_distance_threshold_near ms_player_tmp run data get storage ms:config distance_threshold_near
execute store result score #ms_distance_threshold_mid ms_player_tmp run data get storage ms:config distance_threshold_mid
execute store result score #ms_distance_threshold_far ms_player_tmp run data get storage ms:config distance_threshold_far
execute store result score #ms_distance_bonus_near ms_player_tmp run data get storage ms:config distance_bonus_near
execute store result score #ms_distance_bonus_mid ms_player_tmp run data get storage ms:config distance_bonus_mid
execute store result score #ms_distance_bonus_far ms_player_tmp run data get storage ms:config distance_bonus_far
execute store result score #ms_spawn_extra_tier_0 ms_player_tmp run data get storage ms:config tier_spawn_extra_0
execute store result score #ms_spawn_extra_tier_1 ms_player_tmp run data get storage ms:config tier_spawn_extra_1
execute store result score #ms_spawn_extra_tier_2 ms_player_tmp run data get storage ms:config tier_spawn_extra_2
execute store result score #ms_spawn_extra_tier_3 ms_player_tmp run data get storage ms:config tier_spawn_extra_3
execute store result score #ms_spawn_extra_tier_4 ms_player_tmp run data get storage ms:config tier_spawn_extra_4
execute store result score #ms_spawn_multiplier ms_player_tmp run data get storage ms:config spawn_multiplier
execute store result score #ms_spawn_cooldown ms_player_tmp run data get storage ms:config spawn_cooldown
execute store result score #ms_spawn_enabled ms_player_tmp run data get storage ms:config spawn_extra_enabled
scoreboard players set #ms_distance_threshold_near_sq ms_player_tmp 0
scoreboard players operation #ms_distance_threshold_near_sq ms_player_tmp = #ms_distance_threshold_near ms_player_tmp
scoreboard players operation #ms_distance_threshold_near_sq ms_player_tmp *= #ms_distance_threshold_near ms_player_tmp
scoreboard players set #ms_distance_threshold_mid_sq ms_player_tmp 0
scoreboard players operation #ms_distance_threshold_mid_sq ms_player_tmp = #ms_distance_threshold_mid ms_player_tmp
scoreboard players operation #ms_distance_threshold_mid_sq ms_player_tmp *= #ms_distance_threshold_mid ms_player_tmp
scoreboard players set #ms_distance_threshold_far_sq ms_player_tmp 0
scoreboard players operation #ms_distance_threshold_far_sq ms_player_tmp = #ms_distance_threshold_far ms_player_tmp
scoreboard players operation #ms_distance_threshold_far_sq ms_player_tmp *= #ms_distance_threshold_far ms_player_tmp

# Initialize health multipliers
execute store result score #ms_health_multiplier_tier_5 ms_health_multiplier run data get storage ms:config health_multiplier_tier_5 100
execute store result score #ms_health_multiplier_tier_6 ms_health_multiplier run data get storage ms:config health_multiplier_tier_6 100
execute store result score #ms_health_multiplier_tier_7 ms_health_multiplier run data get storage ms:config health_multiplier_tier_7 100
execute store result score #ms_health_multiplier_tier_8 ms_health_multiplier run data get storage ms:config health_multiplier_tier_8 100

# Initialize damage multipliers
execute store result score #ms_damage_multiplier_tier_5 ms_damage_multiplier run data get storage ms:config damage_multiplier_tier_5 100
execute store result score #ms_damage_multiplier_tier_6 ms_damage_multiplier run data get storage ms:config damage_multiplier_tier_6 100
execute store result score #ms_damage_multiplier_tier_7 ms_damage_multiplier run data get storage ms:config damage_multiplier_tier_7 100
execute store result score #ms_damage_multiplier_tier_8 ms_damage_multiplier run data get storage ms:config damage_multiplier_tier_8 100

tellraw @a {"text":"[Mob Scaling] Datapack loaded. Scoreboards initialized.","color":"gold"}
