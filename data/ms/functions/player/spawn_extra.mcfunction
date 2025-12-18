# Handle extra spawn timer trigger
execute if score #ms_spawn_enabled ms_player_tmp matches 1.. run scoreboard players add @s ms_spawn_counter 1
execute if score #ms_spawn_enabled ms_player_tmp matches 1.. run scoreboard players set @s ms_spawn_timer 0
execute if score #ms_spawn_enabled ms_player_tmp matches 1.. run function ms:scale/spawn_extra
