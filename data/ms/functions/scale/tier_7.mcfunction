tag @s add scaled
loot replace entity @s armor.head loot ms:equipment/tier_7_head
loot replace entity @s armor.chest loot ms:equipment/tier_7_chest
loot replace entity @s armor.legs loot ms:equipment/tier_7_legs
loot replace entity @s armor.feet loot ms:equipment/tier_7_feet
execute if entity @s[type=#minecraft:skeletons] run loot replace entity @s weapon.mainhand loot ms:equipment/tier_7_bow
execute unless entity @s[type=#minecraft:skeletons,type=minecraft:creeper] run loot replace entity @s weapon.mainhand loot ms:equipment/tier_7_weapon
effect give @s minecraft:strength 120 4
effect give @s minecraft:speed 120 4
effect give @s minecraft:resistance 120 3
effect give @s minecraft:regeneration 90 3
effect give @s minecraft:fire_resistance 120 4
effect give @s minecraft:instant_health 1 1
effect give @s minecraft:absorption 120 2
