tag @s add scaled
loot replace entity @s armor.head loot ms:equipment/tier_4_head
loot replace entity @s armor.chest loot ms:equipment/tier_4_chest
loot replace entity @s armor.legs loot ms:equipment/tier_4_legs
loot replace entity @s armor.feet loot ms:equipment/tier_4_feet
execute if entity @s[type=#minecraft:skeletons] run loot replace entity @s weapon.mainhand loot ms:equipment/tier_4_bow
execute unless entity @s[type=#minecraft:skeletons,type=minecraft:creeper] run loot replace entity @s weapon.mainhand loot ms:equipment/tier_4_weapon
effect give @s minecraft:strength 45 1
effect give @s minecraft:speed 45 1
effect give @s minecraft:fire_resistance 45 1
