# Spawn an extra mob near the triggering mob
execute if entity @s[type=minecraft:zombie] at @s run summon minecraft:zombie ~ ~ ~ {Tags:["ms_extra_spawn"]}
execute if entity @s[type=minecraft:husk] at @s run summon minecraft:husk ~ ~ ~ {Tags:["ms_extra_spawn"]}
execute if entity @s[type=minecraft:drowned] at @s run summon minecraft:drowned ~ ~ ~ {Tags:["ms_extra_spawn"]}
execute if entity @s[type=minecraft:zombie_villager] at @s run summon minecraft:zombie_villager ~ ~ ~ {Tags:["ms_extra_spawn"]}
execute if entity @s[type=minecraft:skeleton] at @s run summon minecraft:skeleton ~ ~ ~ {Tags:["ms_extra_spawn"]}
execute if entity @s[type=minecraft:stray] at @s run summon minecraft:stray ~ ~ ~ {Tags:["ms_extra_spawn"]}
execute if entity @s[type=minecraft:spider] at @s run summon minecraft:spider ~ ~ ~ {Tags:["ms_extra_spawn"]}
execute if entity @s[type=minecraft:cave_spider] at @s run summon minecraft:cave_spider ~ ~ ~ {Tags:["ms_extra_spawn"]}
execute if entity @s[type=minecraft:creeper] at @s run summon minecraft:creeper ~ ~ ~ {Tags:["ms_extra_spawn"]}
execute as @e[tag=ms_extra_spawn,limit=1,sort=nearest] run function ms:scale/apply
