# Mob Scaling Datapack Troubleshooting Guide

## Common Issues and Solutions

### 1. Mobs Not Scaling Properly
- **Check**: Run `/scoreboard players get @p ms_player_tier` to verify your tier
- **Fix**: Ensure you have XP (`/xp set @s 100 levels`) and armor equipped
- **Verify**: Check `/datapack list` confirms the datapack is enabled

### 2. Missing Equipment on Mobs
- **Check**: Confirm config.json exists at `/data/ms/storage/config.json`
- **Fix**: Run `/reload` to refresh datapack state
- **Test**: Use `/function ms:test_spawn_tiers` to spawn test mobs

### 3. Error Messages in Logs
- **Symptom**: "Failed to load function" errors
- **Action**: Verify all .mcfunction files exist and have valid syntax
- **Specific**: The spawn_extra_spawn.mcfunction issue has been fixed in v2.0

## Debugging Commands
```mcfunction
/scoreboard objectives list
/scoreboard players get @p ms_player_tier
/function ms:player/calc_tier
/data get storage ms:config
```

## Reinstallation Steps
1. Remove old datapack from `/world/datapacks`
2. Download fresh copy from releases
3. Run `/reload` in-game

For persistent issues, please provide:
- Exact error messages
- Steps to reproduce
- Screenshots if possible
