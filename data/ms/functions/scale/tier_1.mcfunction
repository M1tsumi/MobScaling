tag @s add scaled
loot replace entity @s armor.head loot ms:equipment/tier_1_head
loot replace entity @s armor.chest loot ms:equipment/tier_1_chest
loot replace entity @s armor.legs loot ms:equipment/tier_1_legs
loot replace entity @s armor.feet loot ms:equipment/tier_1_feet
execute if entity @s[type=#minecraft:skeletons] run loot replace entity @s weapon.mainhand loot ms:equipment/tier_1_bow
execute unless entity @s[type=#minecraft:skeletons,type=minecraft:creeper] run loot replace entity @s weapon.mainhand loot ms:equipment/tier_1_weapon
effect give @s minecraft:speed 45 0
effect give @s minecraft:strength 45 0
effect give @s minecraft:resistance 45 0
