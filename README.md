# Mob Scaling Datapack 🌟

[![Minecraft Version](https://img.shields.io/badge/Minecraft-1.20+-brightgreen)](https://www.minecraft.net/)
[![Datapack](https://img.shields.io/badge/Type-Datapack-blue)](https://minecraft.fandom.com/wiki/Data_pack)
[![License](https://img.shields.io/badge/License-CC0-lightgrey)](https://creativecommons.org/publicdomain/zero/1.0/)

Hey there, fellow Minecrafters! 👋 Welcome to **Mob Scaling**, the datapack that brings dynamic difficulty to your adventures. Tired of mobs that feel too easy or unfairly tough? This little gem scales hostile mobs based on your XP level and armor, making battles feel personal and exciting. Whether you're solo or playing with friends, it keeps things fair and fun.

**Creator:** WormWoodMC  
**Minecraft Target Version:** Java 1.20+  
**Website:** [quefep.uk](https://quefep.uk) – Check out more awesome projects! <3

## What Makes This Special? ✨

Mob Scaling isn't just another mod—it's a vanilla datapack that runs server-side, so no client downloads needed. It watches your progress (XP and armor points) and gives nearby mobs gear that matches your tier. New players get a break with vanilla mobs, while end-game heroes face worthy challenges. And yep, it works perfectly in multiplayer—each player's surroundings adapt individually.

### Core Features
- **Smart Scaling:** Mobs get armor, weapons, enchants, and even buffs based on the toughest player nearby.
- **Per-Player Magic:** Scoreboards track everyone separately, so mixed-gear groups adventure together seamlessly.
- **Custom Gear Pools:** Loot tables let you tweak what mobs drop without touching code.
- **Potion Power-Ups:** High-tier mobs might get Strength or Speed for extra thrill.
- **Performance First:** Mobs get tagged after scaling to avoid lag.

## Level Breakdown 🏆

| Level | Scoreboard Tier | XP Range | Armor Rating | What Mobs Get |
|-------|-----------------|----------|--------------|---------------|
| Level 0 | Tier 0 | 0-4 | 0-5 | Vanilla mobs—no scaling to keep newbies safe. |
| Level 1 | Tier 1 | 5-14 | 6-9 | Leather/gold armor, basic stone or iron weapons. |
| Level 2 | Tier 2 | 15-29 | 10-15 | Iron armor with Protection I, Sharpness I/Power I weapons. |
| Level 3 | Tier 3 | 30-44 | 16-20 | Diamond gear with Protection II, Flame/Power II bows. |
| Level 4 | Tier 4 | 45+ | 20+ | Netherite mix, maxed weapons, Strength II/Speed II/Fire Resistance II. |

Tier math: `(XP / 15) + (Armor / 10)`, clamped to 0-4. Simple, fair, and tunable.

## Enhanced Tier System (v2.0)

| Tier | XP Range | Armor Rating | Equipment | Effects |
|------|---------|-------------|-----------|---------|
| 5 | Config | Config | Diamond/Netherite | Speed II, Strength II, Regen |
| 6 | Config | Config | Diamond/Netherite | Speed III, Strength III, Regen II |
| 7 | Config | Config | Netherite | Speed IV, Strength IV, Absorption |
| 8 | Config | Config | Netherite | Speed V, Strength V, Night Vision |

### Configuration Options
Edit `/data/ms/storage/config.json` to:
- Enable/disable modded content
- Adjust health/damage multipliers
- Control spawn rates and distances
- Fine-tune tier thresholds

## Installation 🚀

1. Grab the Mob Scaling datapack `.zip` from the releases.
2. Drop it into your world's `datapacks/` folder.
3. Launch the world (or run `/reload` if already in).
4. Confirm with `/datapack list`—you should see it enabled.

That's it! No mods, no fuss.

## Configuration 🔧

Want to tweak the difficulty? Edit the constants in `data/ms/functions/player/*.mcfunction`.
- Gear? Swap items in `data/ms/loot_tables/equipment/`.
- Range? Adjust distances in `data/ms/functions/scale/apply.mcfunction`.

Easy customization for your perfect playstyle.

## Multiplayer Compatibility 🤝

Designed with servers in mind! Scoreboards per-player ensure fair scaling. If multiple players are around, mobs match the highest tier detected. No client mods—just server-side magic.

## Easy Testing 🧪

Want to see it in action? Here's a quick way:

1. Go into creative mode (`/gamemode creative`).
2. Set your XP: `/xp set @s 50 levels` (for Tier 4).
3. Spawn a zombie: `/summon zombie ~ ~ ~`.
4. Check its gear—it should have Netherite armor and a powerful sword!

Try different XP levels (0, 10, 25, 40) and spawn various mobs (skeletons, creepers). For armor, wear diamond gear to boost your rating.

## Roadmap 🛤️

- Boss scaling (Wither, Dragon).
- Config options for toggling effects.
- Difficulty based on world settings.

Got ideas? Hit me up!

## Credits 🙏

This project is maintained by WormWoodMC as part of the Quefep creative collective. Find more amazing projects at [quefep.uk](https://quefep.uk) 

