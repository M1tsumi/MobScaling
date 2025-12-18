tag @s add scaled
loot replace entity @s armor.head loot ms:equipment/tier_8_head
loot replace entity @s armor.chest loot ms:equipment/tier_8_chest
loot replace entity @s armor.legs loot ms:equipment/tier_8_legs
loot replace entity @s armor.feet loot ms:equipment/tier_8_feet
execute if entity @s[type=#minecraft:skeletons] run loot replace entity @s weapon.mainhand loot ms:equipment/tier_8_bow
execute unless entity @s[type=#minecraft:skeletons,type=minecraft:creeper] run loot replace entity @s weapon.mainhand loot ms:equipment/tier_8_weapon
effect give @s minecraft:strength 180 5
effect give @s minecraft:speed 180 5
effect give @s minecraft:resistance 180 4
effect give @s minecraft:regeneration 120 4
effect give @s minecraft:fire_resistance 180 5
effect give @s minecraft:instant_health 1 2
effect give @s minecraft:absorption 180 3
effect give @s minecraft:night_vision 180 0
