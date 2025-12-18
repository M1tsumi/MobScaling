tag @s add scaling
scoreboard players set @s ms_mob_tier 0
execute as @a[distance=..32] if score @s ms_player_tier > @e[tag=scaling,limit=1,sort=nearest] ms_mob_tier run scoreboard players operation @e[tag=scaling,limit=1,sort=nearest] ms_mob_tier = @s ms_player_tier
execute if score @s ms_mob_tier matches 0 run function ms:scale/tier_0
execute if score @s ms_mob_tier matches 1 run function ms:scale/tier_1
execute if score @s ms_mob_tier matches 2 run function ms:scale/tier_2
execute if score @s ms_mob_tier matches 3 run function ms:scale/tier_3
execute if score @s ms_mob_tier matches 4 run function ms:scale/tier_4
execute if score @s ms_mob_tier matches 5 run function ms:scale/tier_5
execute if score @s ms_mob_tier matches 6 run function ms:scale/tier_6
execute if score @s ms_mob_tier matches 7 run function ms:scale/tier_7
execute if score @s ms_mob_tier matches 8 run function ms:scale/tier_8
tag @s remove scaling
