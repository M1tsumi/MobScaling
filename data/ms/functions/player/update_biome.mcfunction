scoreboard players set @s ms_biome_bonus 0

execute as @s if biome ~ ~ minecraft:desert run scoreboard players operation @s ms_biome_bonus = #ms_biome_desert ms_temp
execute as @s if biome ~ ~ minecraft:badlands run scoreboard players operation @s ms_biome_bonus = #ms_biome_badlands ms_temp
execute as @s if biome ~ ~ minecraft:dark_forest run scoreboard players operation @s ms_biome_bonus = #ms_biome_dark_forest ms_temp
execute as @s if biome ~ ~ minecraft:crimson_forest run scoreboard players operation @s ms_biome_bonus = #ms_biome_crimson_forest ms_temp
execute as @s if biome ~ ~ minecraft:warped_forest run scoreboard players operation @s ms_biome_bonus = #ms_biome_warped_forest ms_temp
execute as @s if biome ~ ~ minecraft:soul_sand_valley run scoreboard players operation @s ms_biome_bonus = #ms_biome_soul_sand ms_temp
execute as @s if biome ~ ~ minecraft:nether_wastes run scoreboard players operation @s ms_biome_bonus = #ms_biome_nether_wastes ms_temp
execute as @s if biome ~ ~ minecraft:the_end run scoreboard players operation @s ms_biome_bonus = #ms_biome_the_end ms_temp
execute as @s if biome ~ ~ minecraft:end_highlands run scoreboard players operation @s ms_biome_bonus = #ms_biome_end_highlands ms_temp
execute as @s if biome ~ ~ minecraft:end_midlands run scoreboard players operation @s ms_biome_bonus = #ms_biome_end_midlands ms_temp
