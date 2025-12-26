# Mob Scaling Datapack - Technical Documentation

**Version:** v4.0.0  
**Last Updated:** 2025-12-26

## Table of Contents
1. [System Architecture](#system-architecture)
2. [Core Components](#core-components)
3. [Configuration Reference](#configuration-reference)
4. [Function Reference](#function-reference)
5. [Scoreboard System](#scoreboard-system)
6. [Loot Table Structure](#loot-table-structure)
7. [Performance Considerations](#performance-considerations)
8. [Extension Guide](#extension-guide)

## System Architecture

Mob Scaling operates on a tick-based system with the following flow:
1. **Player Tracking:** Monitors XP and armor values every 20 ticks
2. **Tier Calculation:** Updates player tiers based on progression formula
3. **Mob Detection:** Scans for newly spawned hostile mobs within range
4. **Scaling Application:** Applies equipment, effects, and attributes
5. **Performance Tagging:** Marks scaled mobs to prevent reprocessing

### Key Design Principles
- **Server-Only Operation:** No client modifications required
- **Per-Player Isolation:** Each player tracked independently
- **Highest-Tier Logic:** Mobs scale to the strongest nearby player
- **Performance First:** Minimal impact on server tick rate

## Core Components

### Data Storage (`data/ms/storage/`)
- **config.json:** Central configuration file
- **player_data.json:** Runtime player statistics (auto-generated)

### Functions (`data/ms/functions/`)
- **load.mcfunction:** Initializes system on datapack load
- **tick.mcfunction:** Main processing loop
- **player/:** Player tracking and tier calculations
- **scale/:** Mob scaling logic
- **spawn/:** Extra mob spawning system
- **boss/:** Boss scaling system (v3.0.0)
- **difficulty/:** World difficulty integration (v3.0.0)
- **dimension/:** Dimension-based scaling (v3.0.0)
- **debug/:** Diagnostic and testing functions

### Loot Tables (`data/ms/loot_tables/`)
- **equipment/:** Tier-specific equipment pools
- **modded/:** Optional modded content support

## Configuration Reference

### Core Settings
```json
{
  "difficulty_enabled": 1,        // Enable/disable scaling (0/1)
  "difficulty_offset": 0,         // Global difficulty modifier
  "max_tier": 8,                  // Maximum achievable tier
  "modded_content_enabled": 1,    // Enable modded equipment
  "boss_scaling_enabled": 1,      // Enable boss scaling
  "world_difficulty_integration": 1, // Enable difficulty modifiers
  "dimension_scaling_enabled": 1, // Enable dimension modifiers
  "biome_scaling_enabled": 0      // Enable biome scaling (experimental)
}
```

### Distance Scaling
```json
{
  "distance_threshold_near": 80,   // Blocks for near distance
  "distance_threshold_mid": 200,   // Blocks for medium distance
  "distance_threshold_far": 400,   // Blocks for far distance
  "distance_bonus_near": 1,        // Tier bonus for near spawns
  "distance_bonus_mid": 2,         // Tier bonus for medium spawns
  "distance_bonus_far": 4          // Tier bonus for far spawns
}
```

### Spawn Multipliers
```json
{
  "spawn_multiplier": 2,           // Global spawn rate modifier
  "spawn_extra_enabled": 1,        // Enable extra mob spawning
  "spawn_cooldown": 600,           // Ticks between extra spawns
  "tier_spawn_extra_0": 0,         // Extra mobs for tier 0
  "tier_spawn_extra_8": 8          // Extra mobs for tier 8
}
```

### Boss Scaling
```json
{
  "wither_health_multiplier": 2.0, // Wither health multiplier
  "wither_damage_multiplier": 1.5, // Wither damage multiplier
  "dragon_health_multiplier": 2.5, // Dragon health multiplier
  "dragon_damage_multiplier": 1.8  // Dragon damage multiplier
}
```

### World Difficulty Modifiers
```json
{
  "peaceful_modifier": 0.5,  // Scaling on peaceful
  "easy_modifier": 0.75,     // Scaling on easy
  "normal_modifier": 1.0,    // Scaling on normal
  "hard_modifier": 1.5       // Scaling on hard
}
```

### Dimension Modifiers
```json
{
  "overworld_modifier": 1.0,  // Overworld scaling
  "nether_modifier": 1.3,     // Nether scaling
  "end_modifier": 1.5         // End scaling
}
```

### Biome Scaling (Experimental)
```json
{
  "biome_difficulty_multipliers": {
    "minecraft:desert": 1.1,
    "minecraft:dark_forest": 1.3,
    "minecraft:crimson_forest": 1.3,
    "minecraft:the_end": 1.5
  }
}
```

### Attribute Scaling
```json
{
  "health_multiplier_tier_5": 1.5, // Health multiplier for tier 5
  "health_multiplier_tier_8": 3.0, // Health multiplier for tier 8
  "damage_multiplier_tier_5": 1.5, // Damage multiplier for tier 5
  "damage_multiplier_tier_8": 3.0  // Damage multiplier for tier 8
}
```

## Function Reference

- `ms:load` - Initializes datapack and scoreboards
- `ms:tick` - Main processing loop (executed every tick)
- `ms:player/calc_tier` - Recalculates player tier with biome and event bonuses
- `ms:player/update_biome` - Reads current biome and sets `ms_biome_bonus`
- `ms:event/check` - Detects raid/patrol progress and updates `ms_event_bonus`
- `ms:scale/apply` - Applies scaling to nearby mobs and runs `ms:scale/extend`
- `ms:scale/extend` - Hook entry point for custom equipment/behavior
- `ms:boss/apply_scaling` - Applies boss scaling (v3.0.0)
- `ms:difficulty/main` - Applies world difficulty modifiers (v3.0.0)
- `ms:dimension/main` - Applies dimension modifiers (v3.0.0)

### Utility Functions
- `ms:test_spawn_tiers` - Spawns test mobs at all tiers
- `ms:test_spawn_bosses` - Spawns boss candidates for Wither/Dragon
- `ms:debug/status` - Prints current tier, bonuses, and event state

### Tier Functions
- `ms:scale/tier_0` through `ms:scale/tier_8`
- Each applies specific equipment and effects for that tier

## Scoreboard System

### Player Scoreboards
- `ms_player_xp` - Current XP level
- `ms_player_armor` - Armor points (0-20)
- `ms_player_tier` - Calculated tier with bonuses applied
- `ms_player_tier_base` - Base tier before bonuses
- `ms_player_dist_bonus` - Distance-triggered bonus
- `ms_biome_bonus` - Bonus calculated from the current biome
- `ms_event_bonus` - Bonus applied during active raids/patrols

### Boss Scoreboards
- `ms_boss_health` - Boss health calculation
- `ms_boss_scaled` - Tag for scaled bosses

### System Scoreboards
- `ms_temp` - Temporary calculations
- `ms_debug` - Debug flag (trigger)
- `raid_progress` - Minecraft raid progress objective

### Mob Tags
- `ms_scaled` - Applied to prevent re-scaling
- `ms_extra` - Marks extra spawned mobs

## Loot Table Structure

### Equipment Pools
Each tier has dedicated loot tables:
- `ms:equipment/tier_0/weapons` - Weapon pool for tier 0
- `ms:equipment/tier_8/armor` - Armor pool for tier 8
- `ms:equipment/tier_8/enchantments` - Enchantment pool

### Modded Support
- Located in `ms:modded/` namespace
- Conditional inclusion based on config.json
- Separate pools for weapons, armor, and tools

## Performance Considerations

### Optimization Features
1. **Mob Tagging:** Scaled mobs receive `ms_scaled` tag
2. **Distance Culling:** Only processes mobs within 64 blocks
3. **Cooldown System:** Limits extra spawn frequency
4. **Batch Processing:** Groups operations for efficiency

### Performance Metrics
- Target: <2ms tick time impact (increased with boss scaling)
- Memory: ~3MB additional scoreboard storage
- CPU: Minimal during low mob counts, moderate during boss fights

### Tuning Recommendations
- Reduce `spawn_multiplier` on low-end servers
- Increase `spawn_cooldown` to decrease frequency
- Disable distance scaling if not needed
- Lower `max_tier` for performance-critical environments

## Extension Guide

### Adding New Bosses
1. Create boss function: `ms:boss/scale_<boss_name>`
2. Add configuration options for multipliers
3. Update `ms:boss/apply_scaling` to include new boss
4. Create appropriate loot tables

### Adding New Tiers
1. Create tier function: `ms:scale/tier_9`
2. Add equipment loot tables
3. Update config.json with new multipliers
4. Modify tier calculation logic

### Custom Equipment
1. Edit loot tables in `ms:equipment/`
2. Add new pools as needed
3. Reference in tier functions

### Integration with Other Datapacks
1. Use storage namespace `ms:` for shared data
2. Check for existing scoreboards before creation
3. Provide configuration toggles for compatibility
4. Append functions to the `ms:scale_extend_hooks` tag to inject new scaling behaviors

## API Reference

### Public Triggers
- `/trigger ms_help` - Display help information
- `/trigger ms_reload` - Reload configuration
- `/trigger ms_debug` - Toggle debug mode and enable `/function ms:debug/status`

### Boss Testing
- `/function ms:test_spawn_bosses` - Spawn test bosses (v3.0.0)
- `/function ms:boss/apply_scaling` - Force boss scaling

### External Access
Other datapacks can access:
- Storage: `storage ms:config`
- Scoreboards: `ms_player_tier`, `ms_player_xp`
- Functions: Call any function using `/function ms:function_name`

## Troubleshooting

For common issues and solutions, see `TROUBLESHOOTING.md`.

---

**In-Game Help:** Use `/trigger ms_help` for quick reference  
**Full Documentation:** See README.md for user guide
