tag @s add scaled
loot replace entity @s armor.head loot ms:equipment/tier_5_head
loot replace entity @s armor.chest loot ms:equipment/tier_5_chest
loot replace entity @s armor.legs loot ms:equipment/tier_5_legs
loot replace entity @s armor.feet loot ms:equipment/tier_5_feet
execute if entity @s[type=#minecraft:skeletons] run loot replace entity @s weapon.mainhand loot ms:equipment/tier_5_bow
execute unless entity @s[type=#minecraft:skeletons,type=minecraft:creeper] run loot replace entity @s weapon.mainhand loot ms:equipment/tier_5_weapon
effect give @s minecraft:strength 60 2
effect give @s minecraft:speed 60 2
effect give @s minecraft:resistance 60 1
effect give @s minecraft:regeneration 45 1
effect give @s minecraft:fire_resistance 60 2
execute store result entity @s Attributes[0].BaseModifiers[{Name:"generic.max_health",Amount:0.0f,Operation:0,UUID:[I;0,0,0,5]}] float 1 run scoreboard players get #ms_health_multiplier_tier_5 ms_player_tmp
execute store result entity @s Attributes[0].BaseModifiers[{Name:"generic.attack_damage",Amount:0.0f,Operation:0,UUID:[I;0,0,0,5]}] float 1 run scoreboard players get #ms_damage_multiplier_tier_5 ms_player_tmp
