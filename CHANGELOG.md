# Mob Scaling Datapack – Changelog

## v2.0.0 – Enhanced Scaling & Modded Support
- Added tiers 5-8 with progressive difficulty scaling
  - Tier 5: Diamond/Netherite gear with Speed/Strength II
  - Tier 6: Enhanced equipment with Regen II
  - Tier 7: Netherite dominance with Absorption
  - Tier 8: Max-tier gear with Night Vision
- Implemented configurable multipliers:
  - Health scaling per tier (1.5x-3.0x)
  - Damage scaling per tier (1.5x-3.0x)
- Added modded content support with toggle in config.json
- Created distance-based difficulty system
- Expanded documentation:
  - Added documentation.md
  - Updated README with new features
  - Improved in-game help text
- Verified multiplayer compatibility across all new systems
- Added test_spawn_tiers.mcfunction for quality assurance

## v1.0.0 – Core Implementation Complete
- Implemented core datapack structure with pack.mcmeta, load/tick functions, and tags.
- Created player tracking functions for XP and armor updates, tier calculation.
- Developed scaling logic with apply function handling highest tier detection for multiplayer.
- Built tier-specific scaling functions (0-4) with equipment assignment and potion effects.
- Designed loot tables for all tiers with appropriate armor, weapons, and enchantments.
- Ensured multiplayer compatibility through per-player scoreboards and highest-tier logic.
- Followed industry standards with clear comments, proper JSON formatting, and logical file organization.

## v0.1.0 – Initial Planning Draft
- Documented project goals, leveling system, and scaling tiers.
- Confirmed feasibility of XP/armor-based scaling in vanilla datapacks, including multiplayer support.
- Created README outlining installation, configuration, and roadmap.
