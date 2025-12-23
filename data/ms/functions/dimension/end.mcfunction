# End scaling modifier - highest scaling intensity
execute store result score ms_dimension_mod ms_dimension_mod run data get storage ms:config end_modifier
scoreboard players operation ms_player_tier ms_temp *= ms_dimension_mod ms_dimension_mod
