# Mob Scaling Datapack – Changelog

## v4.0.0 – Biome-Aware Scaling & Modular Documentation

### Summary
- Introduced biome-aware scaling, event hooks, and modular documentation for server operators and modpack authors.
- Reworked configuration defaults to support dynamic visibility stages, distance tracking, and custom spawn logic.
- Added a debug/status function and refreshed README with v4 guidance.

### New Features
- **Biome-Adaptive Scaling**
  - Tier modifiers now respect biome difficulty weights (dark forests, deserts, ocean depths, the End) for accurate tension increases.
  - Safe biomes (plains, meadows) clamp strength growth to maintain beginner-friendly zones.
  - Configurable biome multipliers can be tuned or replaced via `config.json`.

- **Custom Mob Pack Integration**
  - New hookable `ms:scale/extend` function allows modded mob packs and third-party data packs to inject equipment pools without copying core logic.
  - Equipment tables now support `minecraft:loot_table` references to reuse existing scaling gear across sets.

- **Event-Driven Difficulty Boosts**
  - Hostile events (raids, patrols, boss spawns) temporarily bump nearby tiers, ensuring threats remain formidable regardless of player power.
  - Event modifiers deactivate once raid status ends or all pillagers are defeated.

- **Polished User Experience**
  - `/function ms:debug/status` prints a tier timeline for debugging, including distance, boss, biome, and event modifiers.
  - Scoreboard cleanups and tag resets now run after each scaling pass, improving server tick stability.
  - Documentation sections refreshed with step-by-step configuration guidance and troubleshooting paths.

### Documentation & Testing
- Created dedicated `documentation.md` chapter for v4 migration guidance plus troubleshooting callouts.
- Added test functions (`test_spawn_tiers.mcfunction`, `test_spawn_bosses.mcfunction`) for rapid verification of equipment, potions, and scaling logic.

### Enhancements & Fixes
- Clarified tier boundaries in README and improved README copy to mirror v4 features.
- Ensured all references to version numbers and dates reflect the December 2025 release cycle.
- Minor bugfix: `ms:player/update_distance` now recalculates distance bonuses after scoreboard resets to avoid stale modifiers.

## v3.0.0 – Major Feature Expansion

### New Features
- **Boss Scaling System**
  - Implemented dynamic scaling for Wither and Ender Dragon
  - Configurable health and damage multipliers for bosses
  - Progressive difficulty based on nearby player tiers
  - Enhanced effects for high-tier players (Speed, Strength)

- **World Difficulty Integration**
  - Scaling now responds to world difficulty setting
  - Peaceful: 0.5x modifier (reduced challenge)
  - Easy: 0.75x modifier
  - Normal: 1.0x modifier (standard)
  - Hard: 1.5x modifier (increased challenge)

- **Dimension-Based Scaling**
  - Different scaling multipliers per dimension
  - Overworld: 1.0x (baseline)
  - Nether: 1.3x (increased danger)
  - End: 1.5x (maximum challenge)

### Configuration Enhancements
- Added 20+ new configuration options
- Boss scaling toggle and individual multipliers
- World difficulty integration toggle
- Dimension scaling toggle and modifiers
- Biome scaling framework (disabled by default)

### Technical Improvements
- Optimized boss scaling to prevent re-processing
- Fixed configuration boolean evaluation
- Enhanced tick function with modular feature integration
- Improved performance with proper entity tagging

### Breaking Changes
- Configuration file structure updated (old configs need updating)
- Minimum Minecraft version remains 1.20+

## v2.1.0 – Documentation & Quality of Life
- Professionalized documentation with improved structure and clarity
- Fixed tier description inconsistencies (clarified 9 tiers: 0-8)
- Enhanced README with better formatting and technical accuracy
- Improved installation and configuration instructions
- Added comprehensive troubleshooting section
- Updated version references across all documentation
- Standardized changelog format for better readability

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
