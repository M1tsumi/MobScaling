tag @s add scaled
loot replace entity @s armor.head loot ms:equipment/tier_6_head
loot replace entity @s armor.chest loot ms:equipment/tier_6_chest
loot replace entity @s armor.legs loot ms:equipment/tier_6_legs
loot replace entity @s armor.feet loot ms:equipment/tier_6_feet
execute if entity @s[type=#minecraft:skeletons] run loot replace entity @s weapon.mainhand loot ms:equipment/tier_6_bow
execute unless entity @s[type=#minecraft:skeletons,type=minecraft:creeper] run loot replace entity @s weapon.mainhand loot ms:equipment/tier_6_weapon
effect give @s minecraft:strength 90 3
effect give @s minecraft:speed 90 3
effect give @s minecraft:resistance 90 2
effect give @s minecraft:regeneration 60 2
effect give @s minecraft:fire_resistance 90 3
effect give @s minecraft:instant_health 1 0
