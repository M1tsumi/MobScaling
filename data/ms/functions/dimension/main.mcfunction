# Dimension-based scaling for v3.0.0
# Applies different scaling multipliers based on the dimension

# Check if in Overworld
execute if entity @p[dimension=overworld] run function ms:dimension/overworld

# Check if in Nether
execute if entity @p[dimension=the_nether] run function ms:dimension/nether

# Check if in End
execute if entity @p[dimension=the_end] run function ms:dimension/end
