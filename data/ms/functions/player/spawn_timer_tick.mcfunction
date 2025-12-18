# Extra mob spawn timer tick
execute if score #ms_spawn_enabled ms_player_tmp matches 1.. run scoreboard players add @s ms_spawn_timer 1
execute if score @s ms_spawn_timer >= #ms_spawn_cooldown ms_player_tmp run function ms:player/spawn_extra
