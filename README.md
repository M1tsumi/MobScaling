# Mob Scaling Datapack

[![Minecraft Version](https://img.shields.io/badge/Minecraft-1.20+-brightgreen)](https://www.minecraft.net/)
[![Datapack](https://img.shields.io/badge/Type-Datapack-blue)](https://minecraft.fandom.com/wiki/Data_pack)
[![License](https://img.shields.io/badge/License-CC0-lightgrey)](https://creativecommons.org/publicdomain/zero/1.0/)
[![Version](https://img.shields.io/badge/Version-3.0.0-orange)](https://github.com/M1tsumi/MobScaling)

A vanilla Minecraft datapack that implements dynamic difficulty scaling for hostile mobs based on player progression. Mob Scaling enhances gameplay challenge by adjusting mob equipment, attributes, and effects according to player XP levels and armor ratings.

**Author:** WormWoodMC  
**Target Version:** Java Edition 1.20+  
**Website:** [quefep.uk](https://quefep.uk)

## Overview

Mob Scaling is a server-side datapack that provides intelligent difficulty adjustment without requiring client modifications. The system monitors player progression through XP levels and armor ratings, then scales nearby hostile mobs to match the player's power level. This ensures engaging gameplay for both new players and seasoned veterans while maintaining balance in multiplayer environments.

## Features

- **Dynamic Scaling System:** Mobs receive appropriate equipment, enchantments, and effects based on the highest-tier player nearby
- **Boss Scaling:** Dynamic difficulty for Wither and Ender Dragon with configurable multipliers
- **World Difficulty Integration:** Scaling responds to world difficulty setting (Peaceful to Hard)
- **Dimension-Based Scaling:** Different difficulty modifiers for Overworld, Nether, and End dimensions
- **Per-Player Tracking:** Individual scoreboard systems ensure fair scaling in multiplayer with mixed player progression
- **Configurable Loot Tables:** Customize mob equipment drops without modifying core functions
- **Effect System:** High-tier mobs gain beneficial effects (Strength, Speed, Regeneration) for increased challenge
- **Performance Optimized:** Mobs are tagged after scaling to prevent redundant calculations
- **Distance-Based Difficulty:** Optional scaling based on spawn distance from world spawn
- **Modded Content Support:** Toggle support for modded equipment in configuration
- **Health/Damage Multipliers:** Configurable attribute scaling for higher tiers

## Tier System

Mob Scaling utilizes a 9-tier system (0-8) calculated from player XP and armor rating:

**Formula:** `Tier = clamp((XP / 15) + (Armor / 10), 0, 8)`

### Base Tiers (0-4)

| Tier | XP Range | Armor Rating | Equipment | Effects |
|------|----------|--------------|-----------|---------|
| 0 | 0-4 | 0-5 | Vanilla equipment | None |
| 1 | 5-14 | 6-9 | Leather/Gold armor, Stone/Iron weapons | None |
| 2 | 15-29 | 10-15 | Iron armor with Protection I, Sharpness I/Power I | None |
| 3 | 30-44 | 16-20 | Diamond armor with Protection II, Flame/Power II bows | None |
| 4 | 45+ | 20+ | Netherite mix, maxed enchantments | Strength II, Speed II, Fire Resistance II |

### Advanced Tiers (5-8)

| Tier | XP Range* | Armor Rating* | Equipment | Effects |
|------|-----------|---------------|-----------|---------|
| 5 | Configurable | Configurable | Diamond/Netherite | Speed II, Strength II, Regeneration I |
| 6 | Configurable | Configurable | Diamond/Netherite | Speed III, Strength III, Regeneration II |
| 7 | Configurable | Configurable | Netherite | Speed IV, Strength IV, Absorption I |
| 8 | Configurable | Configurable | Netherite | Speed V, Strength V, Night Vision |

*Advanced tier thresholds are configurable in `config.json`

## Installation

1. Download the latest Mob Scaling datapack release (`.zip` file)
2. Navigate to your world save folder: `[world_name]/datapacks/`
3. Extract the datapack zip file into the datapacks directory
4. Load your world or execute `/reload` if already in-game
5. Verify installation with `/datapack list` - Mob Scaling should appear in the list

## Boss Scaling

### Wither Scaling
- **Base Health:** 300 HP
- **Health Multiplier:** Configurable (default 2.0x)
- **Damage Multiplier:** Configurable (default 1.5x)
- **Effects:** Speed and Strength at higher tiers

### Ender Dragon Scaling
- **Base Health:** 200 HP
- **Health Scaling:** 200-500 HP based on player tier
- **Knockback Resistance:** 0.8-1.0 at higher tiers
- **Effects:** Speed and Strength at higher tiers

## World Difficulty Modifiers

| Difficulty | Multiplier | Effect |
|------------|------------|---------|
| Peaceful | 0.5x | Reduced challenge for casual play |
| Easy | 0.75x | Slightly easier than normal |
| Normal | 1.0x | Standard scaling experience |
| Hard | 1.5x | Increased challenge for veterans |

## Dimension Modifiers

| Dimension | Multiplier | Description |
|-----------|------------|-------------|
| Overworld | 1.0x | Baseline difficulty |
| Nether | 1.3x | 30% increased danger |
| End | 1.5x | 50% increased challenge |

## Configuration

### Basic Configuration

Edit configuration values in `data/ms/storage/config.json`:

#### Core Settings
- `difficulty_enabled`: Enable/disable scaling (0/1)
- `boss_scaling_enabled`: Enable boss scaling (0/1)
- `world_difficulty_integration`: Enable difficulty modifiers (0/1)
- `dimension_scaling_enabled`: Enable dimension modifiers (0/1)

#### Boss Settings
- `wither_health_multiplier`: Wither health multiplier (default: 2.0)
- `wither_damage_multiplier`: Wither damage multiplier (default: 1.5)
- `dragon_health_multiplier`: Dragon health multiplier (default: 2.5)
- `dragon_damage_multiplier`: Dragon damage multiplier (default: 1.8)

#### Difficulty Modifiers
- `peaceful_modifier`: Scaling on peaceful (default: 0.5)
- `easy_modifier`: Scaling on easy (default: 0.75)
- `normal_modifier`: Scaling on normal (default: 1.0)
- `hard_modifier`: Scaling on hard (default: 1.5)

#### Dimension Modifiers
- `overworld_modifier`: Overworld scaling (default: 1.0)
- `nether_modifier`: Nether scaling (default: 1.3)
- `end_modifier`: End scaling (default: 1.5)

```json
{
  "difficulty_enabled": 1,
  "boss_scaling_enabled": 1,
  "world_difficulty_integration": 1,
  "dimension_scaling_enabled": 1,
  "modded_content_enabled": 1,
  "max_tier": 8,
  "wither_health_multiplier": 2.0,
  "dragon_health_multiplier": 2.5,
  "hard_modifier": 1.5,
  "nether_modifier": 1.3,
  "end_modifier": 1.5
}
```

### Advanced Customization

- **Equipment:** Modify loot tables in `data/ms/loot_tables/equipment/`
- **Scaling Logic:** Adjust tier calculations in `data/ms/functions/player/`
- **Spawn Ranges:** Edit distance values in `data/ms/functions/scale/apply.mcfunction`
- **Effects:** Configure potion effects in tier-specific function files

## Compatibility

| Minecraft Version | Supported | Notes |
|-------------------|-----------|-------|
| 1.20+ | ✅ | Fully compatible |
| 1.19.x | ❌ | Pack format 17 requires 1.20+ |
| Bedrock Edition | ❌ | Java Edition only |
| Multiplayer | ✅ | Per-player scaling supported |

## Testing Commands

Test the datapack with these commands:

```mcfunction
# Set player XP for specific tiers
/xp set @s 50 levels    # Tier 4
/xp set @s 100 levels   # Tier 8 (if configured)

# Spawn test mobs
/summon zombie ~ ~ ~
/summon skeleton ~ ~ ~
/summon creeper ~ ~ ~

# Check current tier
/scoreboard objectives add ms_dummy dummy
/scoreboard players set @s ms_tier 4
```

## Troubleshooting

**Datapack not loading:**
- Verify the folder structure is intact
- Check for syntax errors in JSON files
- Ensure pack.mcmeta is valid JSON

**Mobs not scaling:**
- Confirm difficulty is enabled in config.json
- Check player has sufficient XP/armor for higher tiers
- Verify scoreboard objectives are created

**Performance issues:**
- Reduce spawn multiplier in config.json
- Increase spawn cooldown timer
- Disable distance-based scaling if not needed

For additional support, see `TROUBLESHOOTING.md` or visit the project website.

## Roadmap

- [x] Boss scaling (Wither, Ender Dragon)
- [x] Configurable effect toggles per tier
- [x] World difficulty integration
- [ ] Biome-based scaling modifiers
- [ ] Custom mob support

## Credits

Developed by WormWoodMC for the Quefep creative collective.

**License:** CC0 1.0 Universal - Public Domain

**Website:** [quefep.uk](https://quefep.uk)

---
*Last updated: v3.0.0* 

