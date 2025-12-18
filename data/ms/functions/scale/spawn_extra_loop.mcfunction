# Loop to spawn each extra mob
execute if score @s ms_spawn_extra matches 1.. run function ms:scale/spawn_extra_spawn
execute if score @s ms_spawn_extra matches 1.. run scoreboard players remove @s ms_spawn_extra 1
execute if score @s ms_spawn_extra matches 1.. run function ms:scale/spawn_extra_loop
