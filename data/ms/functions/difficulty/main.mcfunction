# World Difficulty Integration for v3.0.0
# Modifies scaling based on world difficulty setting

# Get current difficulty
execute if score ms_temp ms_temp matches 0 run function ms:difficulty/peaceful
execute if score ms_temp ms_temp matches 1 run function ms:difficulty/easy
execute if score ms_temp ms_temp matches 2 run function ms:difficulty/normal
execute if score ms_temp ms_temp matches 3 run function ms:difficulty/hard
