# Mob Scaling Test Function
# Spawns one mob of each tier for testing

# Tier 0
summon zombie ~ ~1 ~ {Tags:["ms_test"]}
scoreboard players set @e[type=zombie,tag=ms_test,limit=1] ms_mob_tier 0
function ms:scale/apply

# Tier 1
summon zombie ~ ~1 ~2 {Tags:["ms_test"]}
scoreboard players set @e[type=zombie,tag=ms_test,limit=1] ms_mob_tier 1
function ms:scale/apply

# Tier 2
summon zombie ~ ~1 ~4 {Tags:["ms_test"]}
scoreboard players set @e[type=zombie,tag=ms_test,limit=1] ms_mob_tier 2
function ms:scale/apply

# Tier 3
summon zombie ~ ~1 ~6 {Tags:["ms_test"]}
scoreboard players set @e[type=zombie,tag=ms_test,limit=1] ms_mob_tier 3
function ms:scale/apply

# Tier 4
summon zombie ~ ~1 ~8 {Tags:["ms_test"]}
scoreboard players set @e[type=zombie,tag=ms_test,limit=1] ms_mob_tier 4
function ms:scale/apply

# Tier 5
summon zombie ~ ~1 ~10 {Tags:["ms_test"]}
scoreboard players set @e[type=zombie,tag=ms_test,limit=1] ms_mob_tier 5
function ms:scale/apply

# Tier 6
summon zombie ~ ~1 ~12 {Tags:["ms_test"]}
scoreboard players set @e[type=zombie,tag=ms_test,limit=1] ms_mob_tier 6
function ms:scale/apply

# Tier 7
summon zombie ~ ~1 ~14 {Tags:["ms_test"]}
scoreboard players set @e[type=zombie,tag=ms_test,limit=1] ms_mob_tier 7
function ms:scale/apply

# Tier 8
summon zombie ~ ~1 ~16 {Tags:["ms_test"]}
scoreboard players set @e[type=zombie,tag=ms_test,limit=1] ms_mob_tier 8
function ms:scale/apply

tellraw @a {"text":"[Mob Scaling] Test mobs spawned for tiers 0-8","color":"green"}
