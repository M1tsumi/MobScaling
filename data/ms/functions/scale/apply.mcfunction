tag @s add scaling
scoreboard players set @s ms_mob_tier 0
# If per-player scaling is enabled, use the nearest player's tier; otherwise pick the highest nearby tier
execute if score #ms_per_player_scaling ms_player_tmp matches 1 run execute store result score @s ms_mob_tier run scoreboard players get @p[distance=..32,limit=1,sort=nearest] ms_player_tier
execute if score #ms_per_player_scaling ms_player_tmp matches 0 run execute as @a[distance=..32] if score @s ms_player_tier > @e[tag=scaling,limit=1,sort=nearest] ms_mob_tier run scoreboard players operation @e[tag=scaling,limit=1,sort=nearest] ms_mob_tier = @s ms_player_tier
execute if score @s ms_mob_tier matches 0 run function ms:scale/tier_0
execute if score @s ms_mob_tier matches 1 run function ms:scale/tier_1
execute if score @s ms_mob_tier matches 2 run function ms:scale/tier_2
execute if score @s ms_mob_tier matches 3 run function ms:scale/tier_3
execute if score @s ms_mob_tier matches 4 run function ms:scale/tier_4
execute if score @s ms_mob_tier matches 5 run function ms:scale/tier_5
execute if score @s ms_mob_tier matches 6 run function ms:scale/tier_6
execute if score @s ms_mob_tier matches 7 run function ms:scale/tier_7
execute if score @s ms_mob_tier matches 8 run function ms:scale/tier_8
# If absolute-scaling mode is enabled, apply absolute attribute changes centrally
execute if score #ms_scaling_absolute ms_player_tmp matches 1 run function ms:scale/apply_absolute
tag @s remove scaling
function ms:scale/extend
