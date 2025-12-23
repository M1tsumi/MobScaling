# Test function for spawning bosses at different tiers
# Useful for testing boss scaling functionality

# Spawn test Wither
summon wither ~ ~5 ~ {Tags:["test_boss","ms_test_wither"]}

# Spawn test Ender Dragon (requires End dimension or special setup)
# Note: Dragon can only be spawned in the End dimension naturally
# execute in minecraft:the_end run summon ender_dragon ~ ~ ~ {Tags:["test_boss","ms_test_dragon"]}

tellraw @a {"text":"[Mob Scaling] Test boss spawned. Check scaling effects.","color":"yellow"}
