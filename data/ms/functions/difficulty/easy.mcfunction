# Easy difficulty modifier - slightly reduces scaling intensity
execute store result score ms_difficulty_mod ms_difficulty_mod run data get storage ms:config easy_modifier
scoreboard players operation ms_player_tier ms_temp *= ms_difficulty_mod ms_difficulty_mod
