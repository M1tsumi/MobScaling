tag @s add scaled
loot replace entity @s armor.head loot ms:equipment/tier_3_head
loot replace entity @s armor.chest loot ms:equipment/tier_3_chest
loot replace entity @s armor.legs loot ms:equipment/tier_3_legs
loot replace entity @s armor.feet loot ms:equipment/tier_3_feet
execute if entity @s[type=#minecraft:skeletons] run loot replace entity @s weapon.mainhand loot ms:equipment/tier_3_bow
execute unless entity @s[type=#minecraft:skeletons,type=minecraft:creeper] run loot replace entity @s weapon.mainhand loot ms:equipment/tier_3_weapon
effect give @s minecraft:strength 45 1
effect give @s minecraft:speed 45 1
effect give @s minecraft:resistance 45 1
effect give @s minecraft:regeneration 30 0
