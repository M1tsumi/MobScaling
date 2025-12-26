scoreboard players set @s ms_event_bonus 0
execute if score @s raid_progress matches 1.. run scoreboard players operation @s ms_event_bonus = #ms_event_raid ms_temp
