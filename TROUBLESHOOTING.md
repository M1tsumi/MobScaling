# Mob Scaling Datapack - Troubleshooting Guide

**Version:** v3.0.0  
**Last Updated:** 2025-12-23

## Table of Contents
1. [Installation Issues](#installation-issues)
2. [Functionality Problems](#functionality-problems)
3. [Performance Issues](#performance-issues)
4. [Multiplayer-Specific Issues](#multiplayer-specific-issues)
5. [Debugging Commands](#debugging-commands)
6. [Common Error Messages](#common-error-messages)
7. [Reinstallation Guide](#reinstallation-guide)

## Installation Issues

### Datapack Not Appearing in List
**Symptoms:** `/datapack list` doesn't show Mob Scaling  
**Causes & Solutions:**
- Incorrect folder structure - Ensure the datapack is in `[world]/datapacks/MobScaling/`
- Corrupted download - Re-download from the official release page
- Invalid pack.mcmeta - Verify JSON syntax using an online validator

### "Failed to Load Data Pack" Error
**Symptoms:** Error message on world load or `/reload`  
**Solutions:**
1. Check for syntax errors in JSON files (especially config.json)
2. Verify all .mcfunction files have valid commands
3. Ensure no conflicting datapacks are present

## Functionality Problems

### Mobs Not Scaling
**Diagnostic Steps:**
```mcfunction
# Check your current tier
/scoreboard players get @p ms_player_tier

# Verify XP level
/xp query @s levels

# Check armor points
/effect give @s minecraft:resistance 1 0 true
```

**Common Causes:**
- Player XP too low for higher tiers (need 45+ XP for tier 4+)
- Difficulty disabled in config.json
- Scoreboard objectives not created

### Missing Equipment on Mobs
**Solutions:**
1. Verify config.json exists at `data/ms/storage/config.json`
2. Check that `difficulty_enabled` is set to 1
3. Ensure modded content settings match your server setup
4. Run `/function ms:test_spawn_tiers` to test equipment tables

### Effects Not Applying
**Checks:**
- Verify mob is within range (default 64 blocks)
- Check that mob hasn't been tagged as `ms_scaled`
- Confirm effect settings in tier functions

## Performance Issues

### Lag Spikes When Mobs Spawn
**Optimizations:**
- Reduce `spawn_multiplier` in config.json
- Increase `spawn_cooldown` timer
- Disable distance-based scaling if not needed
- Lower `max_tier` to reduce calculations

### High Memory Usage
**Solutions:**
- Reduce number of loaded entities
- Clear unused scoreboard objectives periodically
- Limit active scaling areas

## Multiplayer-Specific Issues

### Inconsistent Scaling Between Players
**Causes:**
- Scoreboard synchronization delay
- Different player XP/armor levels
- Network latency affecting updates

**Solutions:**
- Ensure all players run `/reload` after updates
- Check that server has sufficient resources
- Verify permissions allow scoreboard modifications

### New Players Not Getting Proper Scaling
**Fixes:**
- New players automatically start at tier 0
- XP and armor requirements apply equally
- Check for conflicting permission plugins

## Debugging Commands

### Essential Commands
```mcfunction
# List all Mob Scaling scoreboards
/scoreboard objectives list | grep ms_

# Check storage configuration
/data get storage ms:config

# Force tier recalculation
/function ms:player/calc_tier

# Spawn test mobs at all tiers
/function ms:test_spawn_tiers

# Check mob tags
/execute as @e[type=zombie] run data get entity @s Tags
```

### Monitoring Commands
```mcfunction
# View player stats
/scoreboard players get @p ms_player_xp
/scoreboard players get @p ms_player_armor
/scoreboard players get @p ms_player_tier

# Check system status
/scoreboard objectives list | grep ms_
```

## Common Error Messages

### "Failed to load function"
**Location:** Usually in console/logs  
**Solution:** Check the specified function file for syntax errors

### "Unknown command"
**Cause:** Minecraft version mismatch  
**Fix:** Ensure you're running Minecraft 1.20+ with pack format 17

### "Storage namespace 'ms' not found"
**Solution:** Run `/reload` to initialize storage system

### "Scoreboard objective already exists"
**Cause:** Conflicting datapacks or reload attempt  
**Fix:** Restart the server or remove conflicting datapacks

## Reinstallation Guide

### Clean Reinstall
1. **Backup:** Save your config.json if modified
2. **Remove:** Delete the entire `MobScaling` folder from `[world]/datapacks/`
3. **Download:** Get fresh copy from official releases
4. **Extract:** Place in `[world]/datapacks/MobScaling/`
5. **Configure:** Restore custom settings to config.json
6. **Reload:** Execute `/reload` in-game or restart server

### Migration from v1.x to v2.x
1. Backup existing world
2. Remove old version completely
3. Install v2.1.0
4. Update config.json with new settings
5. Test with `/function ms:test_spawn_tiers`

## Getting Support

When reporting issues, please include:
- Minecraft version (exact number)
- Mob Scaling version
- Server type (vanilla, Spigot, Paper, etc.)
- Other datapacks/mods installed
- Exact error messages
- Steps to reproduce the issue
- Relevant console output

**Support Channels:**
- Website: [quefep.uk](https://quefep.uk)
- GitHub Issues: Check repository page
- Documentation: See README.md and documentation.md

---

**Quick Reference:** Most issues are resolved by `/reload` and verifying config.json settings.
