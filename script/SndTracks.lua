-- this file defines the streaming tracks with their properties
-- to add a track call the lua function SndAddTrack with the file name and as parameter with the default volume of the track


local comment = [[
	Folgende Beispielsituationen soll die Priorit‰tenliste korrekt abarbeiten:
	
	Situation						Current Track			Playable Tracks								Result
	Spieler betritt Plattform			MainMenu				PlatformOpener								PlatformOpener
	Spieler betritt Plattform			PlatformOpener			PlatformOpener								PlatformOpener 
	Spieler wechselt Plattform			PlatformPlain			PlatformOpener								PlatformOpener
	Spieler wechselt k‰mpfend Plattform		Combat				PlatformOpener, Combat							PlatformOpener
	Spieler betritt Plattform in Stadt		MainMenu				PlatformOpener, LocationOpener					LocationOpener (oder doch lieber PlatformOpener?)
	Spieler betritt Stadt				PlatformOpener			PlatformPlain, LocationOpener						LocationOpener (oder doch lieber PlatformOpener?)
	Spieler betritt Stadt				PlatformPlain			PlatformPlain, LocationOpener						LocationOpener
	Spieler betritt k‰mpfend Stadt		Combat				PlatformPlain, LocationOpener, Combat				Combat (oder doch lieber LocationOpener?)
	Spieler k‰mpft					PlatformOpener			PlatformPlain, Combat							PlatformOpener (oder doch lieber Combat?)
	Spieler k‰mpft					PlatformPlain			PlatformPlain, Combat							Combat
	Spieler verl‰ﬂt Stadt				LocationOpener			PlatformPlain								PlatformPlain
	Spieler verl‰ﬂt Stadt				LocationLoop			PlatformPlain								PlatformPlain

]] 
comment = nil

SndAddTrackType{Name = "Movie", Priority = 150, Interrupts = { "MainMenu", "LocationOpener", "LocationLoop", "PlatformPlain", "Combat", "Battle", "PlatformOpener", "Night", "DominationOpener", "DominationLoop", "Death" }}
SndAddTrackType{Name = "MainMenu", Priority = 112, Interrupts = { "MainMenu", "LocationOpener", "LocationLoop", "PlatformPlain", "Combat", "Battle", "PlatformOpener", "Night", "DominationOpener", "DominationLoop", "Movie" }}
SndAddTrackType{Name = "PlatformOpener", Priority = 114, Interrupts = { "LocationOpener", "LocationLoop", "PlatformPlain", "Combat", "Battle", "MainMenu", "Night" }}
SndAddTrackType{Name = "PlatformPlain", Priority = 20, Interrupts = { "LocationLoop", "Combat", "Battle", "MainMenu", "LocationOpener", "Night" }}
SndAddTrackType{Name = "LocationOpener", Priority = 113, Interrupts = { "PlatformPlain", "Combat", "Battle", "MainMenu", "Night", "LocationLoop", "LocationOpener" }}
SndAddTrackType{Name = "LocationLoop", Priority = 90, Interrupts = { "Combat", "Battle", "Night" }}
SndAddTrackType{Name = "Combat", Priority = 115, Interrupts = { "LocationOpener", "LocationLoop", "PlatformPlain", "MainMenu", "PlatformOpener", "Night" }}
SndAddTrackType{Name = "Death", Priority = 120, Interrupts = { "LocationOpener", "LocationLoop", "PlatformPlain", "Combat", "Battle", "MainMenu", "PlatformOpener", "Night" }}
SndAddTrackType{Name = "Battle", Priority = 115, Interrupts = { "LocationOpener", "LocationLoop", "PlatformPlain", "MainMenu", "PlatformOpener", "Night" }}
SndAddTrackType{Name = "Night", Priority = 25, Interrupts = { "LocationOpener", "LocationLoop", "PlatformPlain", "Combat", "Battle", "MainMenu" }}
SndAddTrackType{Name = "DominationOpener", Priority = 118, Interrupts = { "LocationOpener", "LocationLoop", "PlatformPlain", "Combat", "Battle", "PlatformOpener", "Night" }}
SndAddTrackType{Name = "DominationLoop", Priority = 117, Interrupts = { "LocationOpener", "LocationLoop", "PlatformPlain", "Combat", "Battle", "PlatformOpener", "Night" }}

-- Movieplayer
SndAddTrack{Id = 99, File = "plain_silence.mp3", Type = "Movie", Volume = 1}

-- Maintitle
if SndAddon2Installed then
	SndAddTrack{Id = 200, File = "army_of_darkness.mp3", Type = "MainMenu", Volume = 1}
elseif SndAddonInstalled then
	SndAddTrack{Id = 111, File = "elvensong_menu.mp3", Type = "MainMenu", Volume = 1}
else
	SndAddTrack{Id = 5, File = "spellforce.mp3", Type = "MainMenu", Volume = 0.8}
end
-- Maintitle Add On 2	
	

-- Battle
SndAddTrack{Id = 17, File = "battle_music1.mp3", Type = "Battle", Volume = 0.9}
SndAddTrack{Id = 18, File = "combat_music2.mp3", Type = "Combat", Volume = 0.9}
SndAddTrack{Id = 6, File = "death_music.mp3", Type = "Death", Volume = 0.9}
SndAddTrack{Id = 81, File = "battle_blade.mp3", Type = "Combat", Volume = 0.9}
SndAddTrack{Id = 82, File = "combat_music2.mp3", Type = "Battle", Volume = 0.9}

if not SndAddonInstalled then
	SndAddTrack{Id = 1, File = "combat_music1.mp3", Type = "Combat", Volume = 0.9}
	SndAddTrack{Id = 97, File = "battle_music2.mp3", Type = "Battle", Volume = 0.9}
else
	SndAddTrack{Id = 112, File = "battle_on.mp3", Type = "Battle", Volume = 1}
	SndAddTrack{Id = 113, File = "close_combat.mp3", Type = "Combat", Volume = 1}
end

-- Battle Add On 2. Im Falle von beiden Add On Installiert: alle Titel mit folgenden IDs verwenden: 112, 113, 201, 202, 6, 81, 82, 17

SndAddTrack{Id = 201, File = "battle_of_the_undead.mp3", Type = "Battle", Volume = 1}
SndAddTrack{Id = 202, File = "combat_and_fight.mp3", Type = "Combat", Volume = 1}


-- LocationOpener
SndAddTrack{Id = 2, File = "elves_and_angels.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 9, File = "era_of_the_orcs.mp3", Type = "LocationOpener", Volume = 1.0}
SndAddTrack{Id = 13, File = "runewarrior.mp3", Type = "LocationOpener", Volume = 0.9}
SndAddTrack{Id = 19, File = "kraga_and_braga.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 20, File = "deadzone.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 21, File = "forbidden_zone.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 22, File = "celtic_march.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 23, File = "ogre_battle.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 24, File = "red_legion.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 25, File = "order_of_dawn.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 26, File = "battlefields.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 27, File = "strategy_and_gameplay.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 95, File = "sharrowdale.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 114, File = "black_gate.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 115, File = "call_of_the_dead.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 116, File = "despair.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 117, File = "doomsday.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 118, File = "dungeon_dimension.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 119, File = "human_village.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 120, File = "ice_elves.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 121, File = "rune_master.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 205, File = "arena.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 206, File = "bone_temple.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 207, File = "bone_temple_whisper.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 208, File = "city_of_souls.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 209, File = "empyria.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 210, File = "the_clockwork_crypts.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 211, File = "the_gorge.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 212, File = "the_kathai.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 213, File = "whisper.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 242, File = "atmo_oasis.mp3", Type = "LocationOpener", Volume = 1}

-- LocationLoop
SndAddTrack{Id = 36, File = "elves_and_angels.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 37, File = "era_of_the_orcs.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 38, File = "runewarrior.mp3", Type = "LocationLoop", Volume = 0.9}
SndAddTrack{Id = 39, File = "kraga_and_braga.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 40, File = "deadzone.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 41, File = "forbidden_zone.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 42, File = "celtic_march.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 43, File = "ogre_battle.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 44, File = "red_legion.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 45, File = "order_of_dawn.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 46, File = "battlefields.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 47, File = "strategy_and_gameplay.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 96, File = "sharrowdale.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 122, File = "black_gate.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 123, File = "call_of_the_dead.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 124, File = "despair.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 125, File = "doomsday.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 126, File = "dungeon_dimension.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 127, File = "human_village.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 128, File = "ice_elves.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 129, File = "rune_master.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 215, File = "arena.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 216, File = "bone_temple.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 217, File = "bone_temple_whisper.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 218, File = "city_of_souls.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 219, File = "the_clockwork_crypts.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 220, File = "the_gorge.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 221, File = "whisper.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 243, File = "atmo_oasis.mp3", Type = "LocationLoop", Volume = 1}

-- als Locationopener gefakte Plains
SndAddTrack{Id = 48, File = "plain_waterworld.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 49, File = "plain_iceworld.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 50, File = "plain_desertworld.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 51, File = "plain_waterworld2.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 52, File = "plain_mountainworld.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 53, File = "plain_lavaworld.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 54, File = "plain_swampworld.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 70, File = "plain_world.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 130, File = "plain_darkened.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 131, File = "plain_mystified.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 132, File = "plain_enchanted.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 222, File = "plains_of_blackwater.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 223, File = "plains_of_devastation.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 224, File = "plains_of_myth.mp3", Type = "LocationOpener", Volume = 1}


-- als Locationloops gefakte Plains
SndAddTrack{Id = 55, File = "plain_waterworld.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 56, File = "plain_iceworld.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 57, File = "plain_desertworld.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 58, File = "plain_waterworld2.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 59, File = "plain_mountainworld.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 60, File = "plain_lavaworld.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 61, File = "plain_swampworld.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 71, File = "plain_world.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 133, File = "plain_darkened.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 134, File = "plain_mystified.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 135, File = "plain_enchanted.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 225, File = "plains_of_blackwater.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 226, File = "plains_of_devastation.mp3", Type = "LocationLoop", Volume = 1}
SndAddTrack{Id = 227, File = "plains_of_myth.mp3", Type = "LocationLoop", Volume = 1}

-- als LocationOpener gefakte Entry
SndAddTrack{Id = 74, File = "entry_waterworld.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 75, File = "entry_iceworld.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 76, File = "entry_desertworld.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 77, File = "entry_waterworld2.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 78, File = "entry_swampworld.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 79, File = "entry_lavaworld.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 80, File = "entry_mountainworld.mp3", Type = "LocationOpener", Volume = 1}

-- Entry
SndAddTrack{Id = 3, File = "entry_waterworld.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 7, File = "entry_iceworld.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 14, File = "entry_desertworld.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 15, File = "entry_waterworld2.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 28, File = "entry_swampworld.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 29, File = "entry_lavaworld.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 30, File = "entry_mountainworld.mp3", Type = "PlatformOpener", Volume = 1}

-- als Entry gefakte Locations
SndAddTrack{Id = 63, File = "order_of_dawn.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 64, File = "runewarrior.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 65, File = "sharrowdale.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 66, File = "deadzone.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 67, File = "battlefields.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 68, File = "forbidden_zone.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 69, File = "strategy_and_gameplay.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 72, File = "celtic_march.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 136, File = "rune_master.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 137, File = "ice_elves.mp3", Type = "PlatformOpener", Volume = 0.8}
SndAddTrack{Id = 150, File = "call_of_the_dead.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 228, File = "empyria.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 229, File = "the_kathai.mp3", Type = "PlatformOpener", Volume = 1}

-- als Plain gefakte Locations
SndAddTrack{Id = 83, File = "elves_and_angels.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 84, File = "era_of_the_orcs.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 85, File = "runewarrior.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 86, File = "kraga_and_braga.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 87, File = "deadzone.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 88, File = "forbidden_zone.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 89, File = "celtic_march.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 90, File = "ogre_battle.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 91, File = "red_legion.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 92, File = "order_of_dawn.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 93, File = "battlefields.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 94, File = "strategy_and_gameplay.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 138, File = "black_gate.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 139, File = "call_of_the_dead.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 140, File = "despair.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 141, File = "doomsday.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 142, File = "dungeon_dimension.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 143, File = "human_village.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 144, File = "ice_elves.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 145, File = "rune_master.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 230, File = "bone_temple.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 231, File = "bone_temple_whisper.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 232, File = "city_of_souls.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 233, File = "the_clockwork_crypts.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 234, File = "the_gorge.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 235, File = "whisper.mp3", Type = "PlatformPlain", Volume = 1}

-- Plain
SndAddTrack{Id = 4, File = "plain_waterworld.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 8, File = "plain_iceworld.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 11, File = "plain_desertworld.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 12, File = "plain_waterworld2.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 16, File = "plain_mountainworld.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 31, File = "plain_lavaworld.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 32, File = "plain_swampworld.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 73, File = "plain_world.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 146, File = "plain_darkened.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 147, File = "plain_mystified.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 148, File = "plain_enchanted.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 236, File = "plains_of_blackwater.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 237, File = "plains_of_devastation.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 238, File = "plains_of_myth.mp3", Type = "PlatformPlain", Volume = 1}

-- Als Entry gefakte Plains
SndAddTrack{Id = 245, File = "plain_waterworld.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 246, File = "plain_iceworld.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 247, File = "plain_desertworld.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 248, File = "plain_waterworld2.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 249, File = "plain_mountainworld.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 250, File = "plain_lavaworld.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 251, File = "plain_swampworld.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 252, File = "plain_world.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 253, File = "plain_darkened.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 254, File = "plain_mystified.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 255, File = "plain_enchanted.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 256, File = "plains_of_blackwater.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 257, File = "plains_of_devastation.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 258, File = "plains_of_myth.mp3", Type = "PlatformOpener", Volume = 1}

-- Tutorial Plain Fake leiser

SndAddTrack{Id = 104, File = "plain_mountainworld.mp3", Type = "PlatformPlain", Volume = 0.7}

-- Silence
SndAddTrack{Id = 33, File = "plain_silence.mp3", Type = "PlatformPlain", Volume = 1}
SndAddTrack{Id = 34, File = "entry_silence.mp3", Type = "PlatformOpener", Volume = 1}
SndAddTrack{Id = 35, File = "location_opener_silence.mp3", Type = "LocationOpener", Volume = 1}
SndAddTrack{Id = 10, File = "location_loop_silence.mp3", Type = "LocationLoop", Volume = 1}

-- gefakte Silences

SndAddTrack{Id = 98, File = "entry_silence.mp3", Type = "LocationOpener", Volume = 1}

-- Night
SndAddTrack{Id = 62, File = "night_silence.mp3", Type = "Night", Volume = 1}

-- Domination Opener
SndAddTrack{Id = 100, File = "battle_blade.mp3", Type = "DominationOpener", Volume = 1}
SndAddTrack{Id = 102, File = "era_of_the_orcs.mp3", Type = "DominationOpener", Volume = 1}
SndAddTrack{Id = 240, File = "arena.mp3", Type = "DominationOpener", Volume = 1}


-- Domination Loop
SndAddTrack{Id = 101, File = "battle_blade.mp3", Type = "DominationLoop", Volume = 1}
SndAddTrack{Id = 103, File = "era_of_the_orcs.mp3", Type = "DominationLoop", Volume = 1}
SndAddTrack{Id = 241, File = "arena.mp3", Type = "DominationLoop", Volume = 1}


-- Doppelnennung aller Ortsmusiken als LocationOpener & als LocationLoop
-- Plains dreifach eingecheckt: als Fl‰chen, als LocationLoops und als LocationOpener

-- ADD ON 2

-- Fl‰chen & Opener

SndDefineMapPlain{Map = "map\\Campaign3\\P200_Collosseum.map", OpenerId = 228, PlainId = 33, OpenerWaitForCutscene = 1 } 		-- Empyria 		Plain Silence	
SndDefineMapPlain{Map = "map\\Campaign3\\P201_Blackwater_Coast.map", PlainId = 237} 							-- None			Plains of Devastation				
SndDefineMapPlain{Map = "map\\Campaign3\\P202_City_Of_Souls.map", OpenerId = 150, PlainId = 33} 					-- Call of the Dead	Plain Silence													
SndDefineMapPlain{Map = "map\\Campaign3\\P203_Onyx_Shores.map", OpenerId = 136, PlainId = 236} 						-- Rune master		Plains of Blackwater	
SndDefineMapPlain{Map = "map\\Campaign3\\P204_Empyria.map", OpenerId = 228, PlainId = 238, OpenerWaitForCutscene = 1 } 			-- Empyria		Plains of Myth
SndDefineMapPlain{Map = "map\\Campaign3\\P205_Dryad_Cove.map", OpenerId = 137, PlainId = 73, OpenerWaitForCutscene = 1 } 		-- Ice Elves 		Plain World	
SndDefineMapPlain{Map = "map\\Campaign3\\P206_Red_Waste.map", OpenerId = 30, PlainId = 11} 						-- Entry Mountainworld	Plain Desertworld		
SndDefineMapPlain{Map = "map\\Campaign3\\P207_Raven_Pass.map", OpenerId = 7, PlainId = 236, OpenerWaitForCutscene = 1 } 		-- Entry Iceworld	Plains of Blackwater				
SndDefineMapPlain{Map = "map\\Campaign3\\P208_Blazing_Stones.map", OpenerId = 14, PlainId = 237}					-- Entry Desertworld	Plains of Devastation	
SndDefineMapPlain{Map = "map\\Campaign3\\P209_Kathai.map", OpenerId = 229, PlainId = 238, OpenerWaitForCutscene = 1 }			-- The Kathai		Plains of Myth								-- 						
SndDefineMapPlain{Map = "map\\Campaign3\\P210_The_Clockwork_Crypts.map", PlainId = 33}							-- None			Plain Silence						
SndDefineMapPlain{Map = "map\\Campaign3\\P211_Darkwind_Keep.map", OpenerId = 15, PlainId = 236, OpenerWaitForCutscene = 1}		-- Entry Waterworld 2	Plains of Blackwater					
SndDefineMapPlain{Map = "map\\Campaign3\\P212_The_Gorge.map", OpenerId = 3, PlainId = 148}						-- Entry Waterworld 1	Plains Enchanted						
SndDefineMapPlain{Map = "map\\Campaign3\\P213_The_Bone_Temple.map", PlainId = 237}							-- None			Plain of Devastation

-- Ortsmusiken

-- coop/pvp test
--SndDefineLocationTrack{Map = "map\\Lan\\AddOn2_LavaPVP2.map", X = 100, Y = 100, Radius = 20, OpenerId = 213, LoopId = 221 }  -- Whisper Loop
--SndDefineLocationTrack{Map = "map\\Lan\\AddOn2_LavaPVP2.map", X = 133, Y = 133, Radius = 20, OpenerId = 210, LoopId = 219 }  -- Whisper Loop
--SndDefineLocationTrack{Map = "map\\Lan\\AddOn2_LavaPVP2.map", X = 200, Y = 140, Radius = 20, OpenerId = 21, LoopId = 41 }  -- Whisper Loop
--SndDefineLocationTrack{Map = "map\\Lan\\AddOn2_LavaPVP2.map", X = 130, Y = 170, Radius = 20, OpenerId = 114, LoopId = 122 }  -- Whisper Loop
--SndDefineLocationTrack{Map = "map\\Lan\\AddOn2_LavaPVP2.map", X = 100, Y = 25, Radius = 20, OpenerId = 26, LoopId = 46 }  -- Whisper Loop
--SndDefineLocationTrack{Map = "map\\Lan\\AddOn2_LavaPVP2.map", X = 40, Y = 90, Radius = 20, OpenerId = 130, LoopId = 133 }  -- Whisper Loop
--SndDefineLocationTrack{Map = "map\\Lan\\AddOn2_LavaPVP2.map", X = 170, Y = 110, Radius = 20, OpenerId = 118, LoopId = 126 }  -- Whisper Loop
--SndDefineLocationTrack{Map = "map\\Lan\\AddOn2_LavaPVP2.map", X = 60, Y = 70, Radius = 20, OpenerId = 35, LoopId = 10 }  -- Whisper Loop

-- P200_Collosseum

SndDefineLocationTrack{Map = "map\\Campaign3\\P200_Collosseum.map", X = 130, Y = 105, Radius = 28, OpenerId = 240, LoopId = 241 }  -- Arena Domination
SndDefineLocationTrack{Map = "map\\Campaign3\\P200_Collosseum.map", X = 130, Y = 150, Radius = 26, OpenerId = 240, LoopId = 241 }  -- Arena Domination
SndDefineLocationTrack{Map = "map\\Campaign3\\P200_Collosseum.map", X = 119, Y = 128, Radius = 8, OpenerId = 240, LoopId = 241 }  -- Arena Domination

-- P201_Blackwater_Coast

SndDefineLocationTrack{Map = "map\\Campaign3\\P201_Blackwater_Coast.map", X = 165, Y = 216, Radius = 18, OpenerId = 35, LoopId = 10 }  -- Silence Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P201_Blackwater_Coast.map", X = 86, Y = 71, Radius = 24, OpenerId = 119, LoopId = 10 }  -- Human Village ohne Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P201_Blackwater_Coast.map", X = 153, Y = 55, Radius = 20, OpenerId = 206, LoopId = 216 }  -- Bonetemple Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P201_Blackwater_Coast.map", X = 160, Y = 71, Radius = 12, OpenerId = 206, LoopId = 216 }  -- Bonetemple Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P201_Blackwater_Coast.map", X = 167, Y = 84, Radius = 12, OpenerId = 206, LoopId = 216 }  -- Bonetemple Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P201_Blackwater_Coast.map", X = 177, Y = 95, Radius = 15, OpenerId = 206, LoopId = 216 }  -- Bonetemple Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P201_Blackwater_Coast.map", X = 191, Y = 106, Radius = 30, OpenerId = 206, LoopId = 216 }  -- Bonetemple Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P201_Blackwater_Coast.map", X = 217, Y = 102, Radius = 19, OpenerId = 206, LoopId = 216 }  -- Bonetemple Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P201_Blackwater_Coast.map", X = 218, Y = 39, Radius = 50, OpenerId = 35, LoopId = 10 }  -- Silence Loop

-- P202_City_Of_Souls

SndDefineLocationTrack{Map = "map\\Campaign3\\P202_City_Of_Souls.map", X = 376, Y = 259, Radius = 100, OpenerId = 116, LoopId = 124 }  -- Despair Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P202_City_Of_Souls.map", X = 4, Y = 403, Radius = 270, OpenerId = 208, LoopId = 227 }  -- Despair Opener & Plains of Myth Loop

-- P203_Onyx_Shores

SndDefineLocationTrack{Map = "map\\Campaign3\\P203_Onyx_Shores.map", X = 102, Y = 394, Radius = 80, OpenerId = 130, LoopId = 133 }  -- Plain Darkened Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P203_Onyx_Shores.map", X = 189, Y = 388, Radius = 38, OpenerId = 130, LoopId = 133 }  -- Plain Darkened Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P203_Onyx_Shores.map", X = 279, Y = 399, Radius = 65, OpenerId = 130, LoopId = 133 }  -- Plain Darkened Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P203_Onyx_Shores.map", X = 356, Y = 368, Radius = 55, OpenerId = 130, LoopId = 133 }  -- Plain Darkened Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P203_Onyx_Shores.map", X = 420, Y = 386, Radius = 60, OpenerId = 130, LoopId = 133 }  -- Plain Darkened Loop

-- P204_Empyria

SndDefineLocationTrack{Map = "map\\Campaign3\\P204_Empyria.map", X = 175, Y = 332, Radius = 20, OpenerId = 242, LoopId = 243 }  -- Atmo Oasis
SndDefineLocationTrack{Map = "map\\Campaign3\\P204_Empyria.map", X = 175, Y = 317, Radius = 20, OpenerId = 242, LoopId = 243 }  -- Atmo Oasis
SndDefineLocationTrack{Map = "map\\Campaign3\\P204_Empyria.map", X = 175, Y = 300, Radius = 20, OpenerId = 242, LoopId = 243 }  -- Atmo Oasis
SndDefineLocationTrack{Map = "map\\Campaign3\\P204_Empyria.map", X = 175, Y = 280, Radius = 20, OpenerId = 242, LoopId = 243 }  -- Atmo Oasis

-- P205_Dryad_Cove

SndDefineLocationTrack{Map = "map\\Campaign3\\P205_Dryad_Cove.map", X = 233, Y = 427, Radius = 35, OpenerId = 35, LoopId = 10 }  -- Silence Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P205_Dryad_Cove.map", X = 167, Y = 317, Radius = 20, OpenerId = 20, LoopId = 40 }  -- Deadzone Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P205_Dryad_Cove.map", X = 129, Y = 322, Radius = 30, OpenerId = 20, LoopId = 40 }  -- Deadzone Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P205_Dryad_Cove.map", X = 136, Y = 293, Radius = 20, OpenerId = 20, LoopId = 40 }  -- Deadzone Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P205_Dryad_Cove.map", X = 136, Y = 270, Radius = 25, OpenerId = 20, LoopId = 40 }  -- Deadzone Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P205_Dryad_Cove.map", X = 227, Y = 274, Radius = 30, OpenerId = 35, LoopId = 10 }  -- Silence Loop

-- P206_Red_Waste

SndDefineLocationTrack{Map = "map\\Campaign3\\P206_Red_Waste.map", X = 160, Y = 150, Radius = 24, OpenerId = 35, LoopId = 10 }  -- Silence Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P206_Red_Waste.map", X = 76, Y = 310, Radius = 15, OpenerId = 114, LoopId = 122 }  -- Black Gate Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P206_Red_Waste.map", X = 86, Y = 297, Radius = 20, OpenerId = 114, LoopId = 122 }  -- Black Gate Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P206_Red_Waste.map", X = 104, Y = 289, Radius = 35, OpenerId = 114, LoopId = 122 }  -- Black Gate Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P206_Red_Waste.map", X = 134, Y = 298, Radius = 30, OpenerId = 114, LoopId = 122 }  -- Black Gate Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P206_Red_Waste.map", X = 305, Y = 153, Radius = 50, OpenerId = 116, LoopId = 124 }  -- Despair Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P206_Red_Waste.map", X = 507, Y = 350, Radius = 320, OpenerId = 211, LoopId = 220 }  -- The Gorge Loop

-- P207_Raven_Pass

SndDefineLocationTrack{Map = "map\\Campaign3\\P207_Raven_Pass.map", X = 374, Y = 42, Radius = 150, OpenerId = 35, LoopId = 10 }  -- Silence Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P207_Raven_Pass.map", X = 210, Y = 77, Radius = 40, OpenerId = 35, LoopId = 10 }  -- Silence Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P207_Raven_Pass.map", X = 111, Y = 141, Radius = 40, OpenerId = 21, LoopId = 41 }  -- Forbidden Zone Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P207_Raven_Pass.map", X = 118, Y = 180, Radius = 50, OpenerId = 21, LoopId = 41 }  -- Forbidden Zone Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P207_Raven_Pass.map", X = 176, Y = 300, Radius = 40, OpenerId = 26, LoopId = 46 }  -- Battlefields Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P207_Raven_Pass.map", X = 193, Y = 444, Radius = 60, OpenerId = 49, LoopId = 56 }  -- Iceworld Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P207_Raven_Pass.map", X = 250, Y = 444, Radius = 60, OpenerId = 49, LoopId = 56 }  -- Iceworld Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P207_Raven_Pass.map", X = 310, Y = 444, Radius = 60, OpenerId = 49, LoopId = 56 }  -- Iceworld Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P207_Raven_Pass.map", X = 353, Y = 433, Radius = 60, OpenerId = 49, LoopId = 56 }  -- Iceworld Loop

-- P208_Blazing_Stones

SndDefineLocationTrack{Map = "map\\Campaign3\\P208_Blazing_Stones.map", X = 169, Y = 277, Radius = 10, OpenerId = 54, LoopId = 61 }  -- Swampworld Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P208_Blazing_Stones.map", X = 170, Y = 264, Radius = 20, OpenerId = 54, LoopId = 61 }  -- Swampworld Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P208_Blazing_Stones.map", X = 262, Y = 82, Radius = 32, OpenerId = 54, LoopId = 61 }  -- Swampworld Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P208_Blazing_Stones.map", X = 31, Y = 36, Radius = 260, OpenerId = 54, LoopId = 61 }  -- Swampworld Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P208_Blazing_Stones.map", X = 425, Y = 416, Radius = 75, OpenerId = 13, LoopId = 219 }  -- Runewarrior Opener & Clockwork Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P208_Blazing_Stones.map", X = 390, Y = 390, Radius = 65, OpenerId = 13, LoopId = 219 }  -- Runewarrior Opener & Clockwork Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P208_Blazing_Stones.map", X = 353, Y = 339, Radius = 30, OpenerId = 13, LoopId = 219 }  -- Runewarrior Opener & Clockwork Loop

-- P209_Kathai

SndDefineLocationTrack{Map = "map\\Campaign3\\P209_Kathai.map", X = 388, Y = 129, Radius = 30, OpenerId = 209, LoopId = 10 }  -- Empyria ohne Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P209_Kathai.map", X = 396, Y = 428, Radius = 66, OpenerId = 25, LoopId = 10 }  -- Order of Dawn ohne Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P209_Kathai.map", X = 49, Y = 442, Radius = 20, OpenerId = 35, LoopId = 10 }  -- Silence Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P209_Kathai.map", X = 412, Y = 267, Radius = 50, OpenerId = 212, LoopId = 10 }  -- The Kathai ohne Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P209_Kathai.map", X = 72, Y = 348, Radius = 15, OpenerId = 242, LoopId = 243 }  -- Atmo Oasis Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P209_Kathai.map", X = 190, Y = 429, Radius = 15, OpenerId = 242, LoopId = 243 }  -- Atmo Oasis Loop

-- P210_The_Clockwork_Crypts

SndDefineLocationTrack{Map = "map\\Campaign3\\P210_The_Clockwork_Crypts.map", X = 139, Y = 360, Radius = 40, OpenerId = 213, LoopId = 221 }  -- Whisper Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P210_The_Clockwork_Crypts.map", X = 223, Y = 359, Radius = 40, OpenerId = 35, LoopId = 10 }  -- Silence Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P210_The_Clockwork_Crypts.map", X = 310, Y = 366, Radius = 40, OpenerId = 210, LoopId = 219 }  -- Clockwork Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P210_The_Clockwork_Crypts.map", X = 138, Y = 274, Radius = 40, OpenerId = 21, LoopId = 41 }  -- Forbidden Zone Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P210_The_Clockwork_Crypts.map", X = 223, Y = 275, Radius = 40, OpenerId = 114, LoopId = 122 }  -- Black Gate Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P210_The_Clockwork_Crypts.map", X = 313, Y = 278, Radius = 40, OpenerId = 35, LoopId = 10 }  -- Silence Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P210_The_Clockwork_Crypts.map", X = 310, Y = 188, Radius = 40, OpenerId = 26, LoopId = 46 }  -- Battlefield Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P210_The_Clockwork_Crypts.map", X = 225, Y = 187, Radius = 40, OpenerId = 118, LoopId = 126 }  -- Dungeon Dimension Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P210_The_Clockwork_Crypts.map", X = 138, Y = 189, Radius = 40, OpenerId = 35, LoopId = 10 }  -- Silence Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P210_The_Clockwork_Crypts.map", X = 438, Y = 423, Radius = 70, OpenerId = 130, LoopId = 133 }  -- Plain Darkened Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P210_The_Clockwork_Crypts.map", X = 433, Y = 372, Radius = 75, OpenerId = 130, LoopId = 133 }  -- Plain Darkened Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P210_The_Clockwork_Crypts.map", X = 426, Y = 300, Radius = 80, OpenerId = 130, LoopId = 133 }  -- Plain Darkened Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P210_The_Clockwork_Crypts.map", X = 426, Y = 220, Radius = 80, OpenerId = 130, LoopId = 133 }  -- Plain Darkened Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P210_The_Clockwork_Crypts.map", X = 437, Y = 120, Radius = 80, OpenerId = 130, LoopId = 133 }  -- Plain Darkened Loop


-- P211_Darkwind_Keep

SndDefineLocationTrack{Map = "map\\Campaign3\\P211_Darkwind_Keep.map", X = 406, Y = 243, Radius = 20, OpenerId = 35, LoopId = 10 }  -- Silence Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P211_Darkwind_Keep.map", X = 422, Y = 225, Radius = 10, OpenerId = 35, LoopId = 10 }  -- Silence Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P211_Darkwind_Keep.map", X = 431, Y = 213, Radius = 10, OpenerId = 35, LoopId = 10 }  -- Silence Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P211_Darkwind_Keep.map", X = 180, Y = 131, Radius = 25, OpenerId = 13, LoopId = 10 }  -- Runewarrior ohne Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P211_Darkwind_Keep.map", X = 288, Y = 91, Radius = 30, OpenerId = 131, LoopId = 134 }  -- Plain Mystified Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P211_Darkwind_Keep.map", X = 320, Y = 90, Radius = 20, OpenerId = 131, LoopId = 134 }  -- Plain Mystified Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P211_Darkwind_Keep.map", X = 354, Y = 92, Radius = 45, OpenerId = 131, LoopId = 134 }  -- Plain Mystified Loop

-- P212_The_Gorge

SndDefineLocationTrack{Map = "map\\Campaign3\\P212_The_Gorge.map", X = 257, Y = 243, Radius = 100, OpenerId = 211, LoopId = 220 }  -- The Gorge Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P212_The_Gorge.map", X = 88, Y = 93, Radius = 90, OpenerId = 54, LoopId = 61 }  -- Plain Swampworld Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P212_The_Gorge.map", X = 432, Y = 98, Radius = 80, OpenerId = 20, LoopId = 40 }  -- Deadzone Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P212_The_Gorge.map", X = 263, Y = 58, Radius = 70, OpenerId = 35, LoopId = 10 }  -- Silence Loop

-- P213_The_Bone_Temple

SndDefineLocationTrack{Map = "map\\Campaign3\\P213_The_Bone_Temple.map", X = 444, Y = 229, Radius = 60, OpenerId = 207, LoopId = 216 }  -- Bonetemple Whisper Opener & Bonetemple Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P213_The_Bone_Temple.map", X = 430, Y = 192, Radius = 50, OpenerId = 207, LoopId = 216 }  -- Bonetemple Whisper Opener & Bonetemple Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P213_The_Bone_Temple.map", X = 483, Y = 100, Radius = 80, OpenerId = 207, LoopId = 216 }  -- Bonetemple Whisper Opener & Bonetemple Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P213_The_Bone_Temple.map", X = 109, Y = 409, Radius = 100, OpenerId = 70, LoopId = 71 }  -- Plain World Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P213_The_Bone_Temple.map", X = 195, Y = 415, Radius = 70, OpenerId = 70, LoopId = 71 }  -- Plain World Loop
SndDefineLocationTrack{Map = "map\\Campaign3\\P213_The_Bone_Temple.map", X = 122, Y = 150, Radius = 125, OpenerId = 210, LoopId = 219 }  -- Clockwork Crypt Loop

-- ADD ON 1

-- Fl‰chen & Opener

SndDefineMapPlain{Map = "map\\Campaign2\\P101_Mirraw_Thur.map", OpenerId = 136, PlainId = 146, OpenerWaitForCutscene = 1 } 	-- Rune Master		Plain Darkened
SndDefineMapPlain{Map = "map\\Campaign2\\P102_Stormcleaver_Rocks.map", PlainId = 148} 						-- none			Plain Enchanted
SndDefineMapPlain{Map = "map\\Campaign2\\P103_Echo_Swamps.map", PlainId = 148} 							-- none 		Plain Enchanted
SndDefineMapPlain{Map = "map\\Campaign2\\P104_Frostfall.map", PlainId = 33} 							-- none 		Plain Silence
SndDefineMapPlain{Map = "map\\Campaign2\\P105_Tirganach.map", OpenerId = 7, PlainId = 147, OpenerWaitForCutscene = 1 } 		-- Entry Iceworld	Plain Mystified
SndDefineMapPlain{Map = "map\\Campaign2\\P107_Winterdeep.map", PlainId = 8, OpenerWaitForCutscene = 1 } 			-- none			Plain Iceworld
SndDefineMapPlain{Map = "map\\Campaign2\\P108_Fastholme.map", PlainId = 16, OpenerWaitForCutscene = 1 } 			-- none 		Plain Mountainworld
SndDefineMapPlain{Map = "map\\Campaign2\\P109_Nevershade_Frontier.map", PlainId = 146} 						-- none			Plain Darkened
SndDefineMapPlain{Map = "map\\Campaign2\\P110_Shaldun.map", OpenerId = 14, PlainId = 31, OpenerWaitForCutscene = 1 }		-- Opener Desertworld	Plain Lavaworld
SndDefineMapPlain{Map = "map\\Campaign2\\P111_Firefangs.map", PlainId = 138}							-- none			Black Gate
SndDefineMapPlain{Map = "map\\Campaign2\\P113_The_Abyss.map", PlainId = 73}							-- none 		Plain World
SndDefineMapPlain{Map = "map\\Campaign2\\P115_Frostweaver_Rift.map", OpenerId = 150, PlainId = 147}				-- Call of the Dead	Plain Mystified


-- Ortsmusiken

-- P101_Mirraw_Thur

SndDefineLocationTrack{Map = "map\\Campaign2\\P101_Mirraw_Thur.map", X = 101, Y = 369, Radius = 30, OpenerId = 35, LoopId = 10 }  -- Silence Loop
SndDefineLocationTrack{Map = "map\\Campaign2\\P101_Mirraw_Thur.map", X = 271, Y = 289, Radius = 43, OpenerId = 13, LoopId = 10 }  -- Rune Warrior ohne Loop
SndDefineLocationTrack{Map = "map\\Campaign2\\P101_Mirraw_Thur.map", X = 228, Y = 295, Radius = 35, OpenerId = 13, LoopId = 10 }  -- Rune Warrior ohne Loop
SndDefineLocationTrack{Map = "map\\Campaign2\\P101_Mirraw_Thur.map", X = 205, Y = 285, Radius = 28, OpenerId = 13, LoopId = 10 }  -- Rune Warrior ohne Loop

-- P102_Stormcleaver_Rocks

SndDefineLocationTrack{Map = "map\\Campaign2\\P102_Stormcleaver_Rocks.map", X = 136, Y = 104, Radius = 14, OpenerId = 35, LoopId = 10 }  -- Silence Loop
SndDefineLocationTrack{Map = "map\\Campaign2\\P102_Stormcleaver_Rocks.map", X = 123, Y = 108, Radius = 18, OpenerId = 35, LoopId = 10 }  -- Silence Loop
SndDefineLocationTrack{Map = "map\\Campaign2\\P102_Stormcleaver_Rocks.map", X = 300, Y = 392, Radius = 20, OpenerId = 95, LoopId = 10 }  -- Sharrowdale ohne Loop
SndDefineLocationTrack{Map = "map\\Campaign2\\P102_Stormcleaver_Rocks.map", X = 318, Y = 388, Radius = 8, OpenerId = 95, LoopId = 10 }  -- Sharrowdale ohne Loop
SndDefineLocationTrack{Map = "map\\Campaign2\\P102_Stormcleaver_Rocks.map", X = 183, Y = 378, Radius = 20, OpenerId = 35, LoopId = 10 }  -- Silence Loop
SndDefineLocationTrack{Map = "map\\Campaign2\\P102_Stormcleaver_Rocks.map", X = 194, Y = 346, Radius = 20, OpenerId = 35, LoopId = 10 }  -- Silence Loop

-- P103_Echo_Swamps

SndDefineLocationTrack{Map = "map\\Campaign2\\P103_Echo_Swamps.map", X = 510, Y = 409, Radius = 210, OpenerId = 114, LoopId = 122 }  -- Black Gate Loop
SndDefineLocationTrack{Map = "map\\Campaign2\\P103_Echo_Swamps.map", X = 94, Y = 249, Radius = 80, OpenerId = 48, LoopId = 55 }  -- Plain Waterworld 1 Loop

-- P104_Frostfall

SndDefineLocationTrack{Map = "map\\Campaign2\\P104_Frostfall.map", X = 370, Y = 1, Radius = 270, OpenerId = 54, LoopId = 61 }  -- Plain Swampworld
SndDefineLocationTrack{Map = "map\\Campaign2\\P104_Frostfall.map", X = 164, Y = 284, Radius = 70, OpenerId = 131, LoopId = 134 }  -- Plain Mystified
SndDefineLocationTrack{Map = "map\\Campaign2\\P104_Frostfall.map", X = 90, Y = 510, Radius = 160, OpenerId = 131, LoopId = 134 }  -- Plain Mystified
SndDefineLocationTrack{Map = "map\\Campaign2\\P104_Frostfall.map", X = 228, Y = 426, Radius = 60, OpenerId = 131, LoopId = 134 }  -- Plain Mystified
SndDefineLocationTrack{Map = "map\\Campaign2\\P104_Frostfall.map", X = 339, Y = 436, Radius = 50, OpenerId = 131, LoopId = 134 }  -- Plain Mystified
SndDefineLocationTrack{Map = "map\\Campaign2\\P104_Frostfall.map", X = 508, Y = 508, Radius = 140, OpenerId = 131, LoopId = 134 }  -- Plain Mystified

-- P105_Tirganach

SndDefineLocationTrack{Map = "map\\Campaign2\\P105_Tirganach.map", X = 240, Y = 255, Radius = 65, OpenerId = 120, LoopId = 128 }  -- Ice Elves Loop
SndDefineLocationTrack{Map = "map\\Campaign2\\P105_Tirganach.map", X = 240, Y = 330, Radius = 35, OpenerId = 118, LoopId = 126 }  -- Dungeon Dimension Loop
SndDefineLocationTrack{Map = "map\\Campaign2\\P105_Tirganach.map", X = 208, Y = 327, Radius = 40, OpenerId = 118, LoopId = 126 }  -- Dungeon Dimension Loop
SndDefineLocationTrack{Map = "map\\Campaign2\\P105_Tirganach.map", X = 284, Y = 350, Radius = 30, OpenerId = 118, LoopId = 126 }  -- Dungeon Dimension Loop
SndDefineLocationTrack{Map = "map\\Campaign2\\P105_Tirganach.map", X = 299, Y = 372, Radius = 32, OpenerId = 118, LoopId = 126 }  -- Dungeon Dimension Loop

-- P107_Winterdeep

-- P108_Fastholme

SndDefineLocationTrack{Map = "map\\Campaign2\\P108_Fastholme.map", X = 135, Y = 342, Radius = 70, OpenerId = 119, LoopId = 10 }  -- Human Village ohne Loop
SndDefineLocationTrack{Map = "map\\Campaign2\\P108_Fastholme.map", X = 367, Y = 276, Radius = 130, OpenerId = 116, LoopId = 124 }  -- Despair Loop

-- P109_Nevershade_Frontier

SndDefineLocationTrack{Map = "map\\Campaign2\\P109_Nevershade_Frontier.map", X = 100, Y = 115, Radius = 110, OpenerId = 51, LoopId = 58 }  -- Waterworld 2 Loop
SndDefineLocationTrack{Map = "map\\Campaign2\\P109_Nevershade_Frontier.map", X = 100, Y = 225, Radius = 110, OpenerId = 51, LoopId = 58 }  -- Waterworld 2 Loop
SndDefineLocationTrack{Map = "map\\Campaign2\\P109_Nevershade_Frontier.map", X = 130, Y = 305, Radius = 110, OpenerId = 51, LoopId = 58 }  -- Waterworld 2 Loop
SndDefineLocationTrack{Map = "map\\Campaign2\\P109_Nevershade_Frontier.map", X = 135, Y = 385, Radius = 140, OpenerId = 51, LoopId = 58 }  -- Waterworld 2 Loop

-- P110_Shaldun

SndDefineLocationTrack{Map = "map\\Campaign2\\P110_Shaldun.map", X = 381, Y = 274, Radius = 140, OpenerId = 117, LoopId = 125 }  -- Doomsday Loop
SndDefineLocationTrack{Map = "map\\Campaign2\\P110_Shaldun.map", X = 142, Y = 254, Radius = 30, OpenerId = 21, LoopId = 41 }  -- Forbidden Zone Loop
SndDefineLocationTrack{Map = "map\\Campaign2\\P110_Shaldun.map", X = 142, Y = 224, Radius = 30, OpenerId = 21, LoopId = 41 }  -- Forbidden Zone Loop

-- P111_Firefangs

SndDefineLocationTrack{Map = "map\\Campaign2\\P111_Firefangs.map", X = 308, Y = 107, Radius = 60, OpenerId = 20, LoopId = 40 }  -- Deadzone Loop
SndDefineLocationTrack{Map = "map\\Campaign2\\P111_Firefangs.map", X = 360, Y = 168, Radius = 15, OpenerId = 20, LoopId = 40 }  -- Deadzone Loop
SndDefineLocationTrack{Map = "map\\Campaign2\\P111_Firefangs.map", X = 242, Y = 361, Radius = 50, OpenerId = 35, LoopId = 10 }  -- Silence Loop

-- P113_The_Abyss

SndDefineLocationTrack{Map = "map\\Campaign2\\P113_The_Abyss.map", X = 153, Y = 209, Radius = 40, OpenerId = 118, LoopId = 126 }  -- Dungeon Dimension
SndDefineLocationTrack{Map = "map\\Campaign2\\P113_The_Abyss.map", X = 184, Y = 203, Radius = 40, OpenerId = 118, LoopId = 126 }  -- Dungeon Dimension
SndDefineLocationTrack{Map = "map\\Campaign2\\P113_The_Abyss.map", X = 210, Y = 210, Radius = 20, OpenerId = 118, LoopId = 126 }  -- Dungeon Dimension
SndDefineLocationTrack{Map = "map\\Campaign2\\P113_The_Abyss.map", X = 230, Y = 210, Radius = 20, OpenerId = 118, LoopId = 126 }  -- Dungeon Dimension
SndDefineLocationTrack{Map = "map\\Campaign2\\P113_The_Abyss.map", X = 250, Y = 210, Radius = 20, OpenerId = 118, LoopId = 126 }  -- Dungeon Dimension
SndDefineLocationTrack{Map = "map\\Campaign2\\P113_The_Abyss.map", X = 290, Y = 220, Radius = 40, OpenerId = 118, LoopId = 126 }  -- Dungeon Dimension
SndDefineLocationTrack{Map = "map\\Campaign2\\P113_The_Abyss.map", X = 323, Y = 236, Radius = 25, OpenerId = 118, LoopId = 126 }  -- Dungeon Dimension
SndDefineLocationTrack{Map = "map\\Campaign2\\P113_The_Abyss.map", X = 297, Y = 177, Radius = 30, OpenerId = 118, LoopId = 126 }  -- Dungeon Dimension
SndDefineLocationTrack{Map = "map\\Campaign2\\P113_The_Abyss.map", X = 331, Y = 154, Radius = 15, OpenerId = 118, LoopId = 126 }  -- Dungeon Dimension
SndDefineLocationTrack{Map = "map\\Campaign2\\P113_The_Abyss.map", X = 265, Y = 282, Radius = 30, OpenerId = 118, LoopId = 126 }  -- Dungeon Dimension
SndDefineLocationTrack{Map = "map\\Campaign2\\P113_The_Abyss.map", X = 264, Y = 308, Radius = 30, OpenerId = 118, LoopId = 126 }  -- Dungeon Dimension

-- P115_Frostweaver_Rift

SndDefineLocationTrack{Map = "map\\Campaign2\\P115_Frostweaver_Rift.map", X = 19, Y = 232, Radius = 105, OpenerId = 35, LoopId = 10 }  -- Silence Loop
SndDefineLocationTrack{Map = "map\\Campaign2\\P115_Frostweaver_Rift.map", X = 80, Y = 136, Radius = 30, OpenerId = 35, LoopId = 10 }  -- Silence Loop
SndDefineLocationTrack{Map = "map\\Campaign2\\P115_Frostweaver_Rift.map", X = 122, Y = 216, Radius = 30, OpenerId = 35, LoopId = 10 }  -- Silence Loop

-- SPELLFORCE - THE ORDER OF DAWN

-- Fl‰chen & Opener 
SndDefineMapPlain{Map = "map\\Campaign\\tutorial.map", OpenerId = 34, PlainId = 104, OpenerWaitForCutscene = 1 } 		-- none			Plain Mountainworld
SndDefineMapPlain{Map = "map\\Campaign\\000_Greyfell.map", PlainId = 73, OpenerWaitForCutscene = 1 } 				-- none			Plain World
SndDefineMapPlain{Map = "map\\Campaign\\001_liannon.map", PlainId = 33} 							-- none			Plain Silence
SndDefineMapPlain{Map = "map\\Campaign\\002_eloni.map", OpenerId = 3, PlainId = 4} 						-- Opener Waterworld 	Plain Waterworld
SndDefineMapPlain{Map = "map\\Campaign\\003_leafshade.map", OpenerId = 15, PlainId = 12} 					-- Opener Waterworld2 	Plain Waterworld2
SndDefineMapPlain{Map = "map\\Campaign\\004_the_shiel.map", OpenerId = 30, PlainId = 32, OpenerWaitForCutscene = 1 } 		-- Opener Mountainworld Plain Swampworld
SndDefineMapPlain{Map = "map\\Campaign\\005_wildland_pass.map", PlainId = 33, OpenerWaitForCutscene = 1 } 			-- none			Plain Silence
SndDefineMapPlain{Map = "map\\Campaign\\006_icegate_marsh.map", OpenerId = 7, PlainId = 16, OpenerWaitForCutscene = 1 } 	-- Opener Iceworld 	Plain Mountainworld
SndDefineMapPlain{Map = "map\\Campaign\\007_northern_windwalls.map", PlainId = 12} 						-- none			Plain Waterworld 2
SndDefineMapPlain{Map = "map\\Campaign\\008NP_stoneblade_mountain.map", OpenerId = 34, PlainId = 8}				-- Opener Silence 	Plain Iceworld
SndDefineMapPlain{Map = "map\\Campaign\\008_southern_windwalls.map", PlainId = 73}						-- none			Plain World
SndDefineMapPlain{Map = "map\\Campaign\\009_greydusk_vale.map", OpenerId = 14, PlainId = 11}					-- Opener Desertworld 	Plain Swampworld
SndDefineMapPlain{Map = "map\\Campaign\\012_howling_mounds.map", OpenerId = 29, PlainId = 31, OpenerWaitForCutscene = 1 }	-- Opener Lavaworld 	Plain Lavaworld
SndDefineMapPlain{Map = "map\\Campaign\\013_whisper.map", PlainId = 11, OpenerWaitForCutscene = 1 }				-- none			Plain Desertworld
SndDefineMapPlain{Map = "map\\Campaign\\014_the_godwall.map", PlainId = 33, OpenerWaitForCutscene = 1 } 			-- none 		Plain Silence
SndDefineMapPlain{Map = "map\\Campaign\\016_mulandir.map", OpenerId = 28, PlainId = 31, OpenerWaitForCutscene = 1 }		-- Opener Swampworld 	Plain Lavaworld
SndDefineMapPlain{Map = "map\\Campaign\\018_farlorns_hope.map", PlainId = 33}							-- none			Plain Silence
SndDefineMapPlain{Map = "map\\Campaign\\019_the_rift.map", OpenerId = 14, PlainId = 11, OpenerWaitForCutscene = 1 } 		-- Opener Desertworld	Plain Swampworld
SndDefineMapPlain{Map = "map\\Campaign\\021_southern_godmark.map", OpenerId = 7, PlainId = 8}					-- Opener Iceworld	Plain Iceworld
SndDefineMapPlain{Map = "map\\Campaign\\023_nightwhisper_dale.map", OpenerId = 15, PlainId = 12}				-- Opener Waterworld 2	Plain Waterworld 2
SndDefineMapPlain{Map = "map\\Campaign\\025_breathing_forest.map", OpenerId = 29, PlainId = 31, OpenerWaitForCutscene = 1 }	-- Opener Lavaworld 	Plain Lavaworld
SndDefineMapPlain{Map = "map\\Campaign\\027_sharrowdale.map", OpenerId = 30, PlainId = 32, OpenerWaitForCutscene = 1}					-- Opener Mountainworld Plain Swampworld
SndDefineMapPlain{Map = "map\\Test\\soundtest.map", OpenerId = 34, PlainId = 83}

-- Ortsmusiken

-- 000_Greyfell

SndDefineLocationTrack{Map = "map\\Campaign\\000_Greyfell.map", X = 425, Y = 310, Radius = 45, OpenerId = 95, LoopId = 10 }  -- Sharrowdale
SndDefineLocationTrack{Map = "map\\Campaign\\000_Greyfell.map", X = 425, Y = 270, Radius = 45, OpenerId = 95, LoopId = 10 }  -- Sharrowdale
SndDefineLocationTrack{Map = "map\\Campaign\\000_Greyfell.map", X = 425, Y = 230, Radius = 45, OpenerId = 95, LoopId = 10 }  -- Sharrowdale
SndDefineLocationTrack{Map = "map\\Campaign\\000_Greyfell.map", X = 425, Y = 190, Radius = 45, OpenerId = 95, LoopId = 10 }  -- Sharrowdale
SndDefineLocationTrack{Map = "map\\Campaign\\000_Greyfell.map", X = 425, Y = 160, Radius = 45, OpenerId = 95, LoopId = 10 }  -- Sharrowdale


-- 001_liannon
SndDefineLocationTrack{Map = "map\\Campaign\\001_liannon.map", X = 160, Y = 101, Radius = 22, OpenerId = 27, LoopId = 47 }  -- Strategy & gameplay
SndDefineLocationTrack{Map = "map\\Campaign\\001_liannon.map", X = 146, Y = 88, Radius = 5, OpenerId = 27, LoopId = 47 }  -- Strategy & gameplay

-- 002_eloni
SndDefineLocationTrack{Map = "map\\Campaign\\002_eloni.map", X = 222, Y = 265, Radius = 65, OpenerId = 35, LoopId = 10 }  -- Silence
SndDefineLocationTrack{Map = "map\\Campaign\\002_eloni.map", X = 130, Y = 324, Radius = 62, OpenerId = 2, LoopId = 36 }  -- Elves & Angels
SndDefineLocationTrack{Map = "map\\Campaign\\002_eloni.map", X = 252, Y = 392, Radius = 85, OpenerId = 26, LoopId = 10 }  -- Battlefields ohne Loop
SndDefineLocationTrack{Map = "map\\Campaign\\002_eloni.map", X = 418, Y = 405, Radius = 120, OpenerId = 26, LoopId = 10 }  -- Battlefields ohne Loop

-- 003_leafshade

SndDefineLocationTrack{Map = "map\\Campaign\\003_leafshade.map", X = 460, Y = 380, Radius = 215, OpenerId = 54, LoopId = 61 } -- Plain Swampworld als Location

-- 004_the_shiel

SndDefineLocationTrack{Map = "map\\Campaign\\004_the_shiel.map", X = 375, Y = 340, Radius = 80, OpenerId = 21, LoopId = 41 } -- Forbidden Zone mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\004_the_shiel.map", X = 510, Y = 300, Radius = 90, OpenerId = 21, LoopId = 41 } -- Forbidden Zone mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\004_the_shiel.map", X = 298, Y = 150, Radius = 30, OpenerId = 102, LoopId = 10 } -- Era of the Orcs ohne Loop Domination

-- 005_wildland_pass

SndDefineLocationTrack{Map = "map\\Campaign\\005_wildland_pass.map", X = 93, Y = 290, Radius = 25, OpenerId = 22, LoopId = 42 } -- Celtic March mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\005_wildland_pass.map", X = 80, Y = 278, Radius = 20, OpenerId = 22, LoopId = 42 } -- Celtic March mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\005_wildland_pass.map", X = 75, Y = 263, Radius = 22, OpenerId = 22, LoopId = 42 } -- Celtic March mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\005_wildland_pass.map", X = 271, Y = 265, Radius = 43, OpenerId = 70, LoopId = 71 } -- Plain World als Location mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\005_wildland_pass.map", X = 299, Y = 221, Radius = 55, OpenerId = 70, LoopId = 71 } -- Plain World als Location mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\005_wildland_pass.map", X = 169, Y = 234, Radius = 80, OpenerId = 70, LoopId = 71 } -- Plain World als Location mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\005_wildland_pass.map", X = 207, Y = 364, Radius = 60, OpenerId = 70, LoopId = 71 } -- Plain World als Location mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\005_wildland_pass.map", X = 145, Y = 330, Radius = 45, OpenerId = 70, LoopId = 71 } -- Plain World als Location

-- 006_icegate_marsh
SndDefineLocationTrack{Map = "map\\Campaign\\006_icegate_marsh.map", X = 503, Y = 508, Radius = 450, OpenerId = 49, LoopId = 56 } -- Plain Iceworld

-- 007_northern_windwalls
SndDefineLocationTrack{Map = "map\\Campaign\\007_northern_windwalls.map", X = 267, Y = 375, Radius = 60, OpenerId = 95, LoopId = 96 } -- Sharrowdale mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\007_northern_windwalls.map", X = 425, Y = 11, Radius = 300, OpenerId = 20, LoopId = 40 } -- Deadzone mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\007_northern_windwalls.map", X = 182, Y = 200, Radius = 13, OpenerId = 20, LoopId = 40 } -- Deadzone mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\007_northern_windwalls.map", X = 195, Y = 200, Radius = 16, OpenerId = 20, LoopId = 40 } -- Deadzone mit Loop

-- 008_southern_windwalls
SndDefineLocationTrack{Map = "map\\Campaign\\008_southern_windwalls.map", X = 322, Y = 494, Radius = 20, OpenerId = 80, LoopId = 10 } -- Opener Mountainworld
SndDefineLocationTrack{Map = "map\\Campaign\\008_southern_windwalls.map", X = 334, Y = 484, Radius = 20, OpenerId = 80, LoopId = 10 } -- Opener Mountainworld
SndDefineLocationTrack{Map = "map\\Campaign\\008_southern_windwalls.map", X = 350, Y = 475, Radius = 15, OpenerId = 80, LoopId = 10 } -- Opener Mountainworld
SndDefineLocationTrack{Map = "map\\Campaign\\008_southern_windwalls.map", X = 368, Y = 478, Radius = 30, OpenerId = 80, LoopId = 10 } -- Opener Mountainworld
SndDefineLocationTrack{Map = "map\\Campaign\\008_southern_windwalls.map", X = 676, Y = 474, Radius = 160, OpenerId = 53, LoopId = 60 } -- Lavaworld mit Loop

-- 008NP_stoneblade_mountain
SndDefineLocationTrack{Map = "map\\Campaign\\008NP_stoneblade_mountain.map", X = 362, Y = 306, Radius = 80, OpenerId = 19, LoopId = 39 } -- Kraga & Braga Loop
SndDefineLocationTrack{Map = "map\\Campaign\\008NP_stoneblade_mountain.map", X = 150, Y = 409, Radius = 190, OpenerId = 52, LoopId = 59 } -- Plain Mountainworld als Location Loop

-- 009_greydusk_vale
SndDefineLocationTrack{Map = "map\\Campaign\\009_greydusk_vale.map", X = 96, Y = 219, Radius = 70, OpenerId = 50, LoopId = 57 } -- Plain Desertworld mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\009_greydusk_vale.map", X = 139, Y = 160, Radius = 40, OpenerId = 50, LoopId = 57 } -- Plain Desertworld mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\009_greydusk_vale.map", X = 96, Y = 290, Radius = 60, OpenerId = 50, LoopId = 57 } -- Plain Desertworld mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\009_greydusk_vale.map", X = 95, Y = 350, Radius = 65, OpenerId = 50, LoopId = 57 } -- Plain Desertworld mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\009_greydusk_vale.map", X = 219, Y = 283, Radius = 26, OpenerId = 25, LoopId = 10 } -- Order of Dawn
SndDefineLocationTrack{Map = "map\\Campaign\\009_greydusk_vale.map", X = 240, Y = 284, Radius = 10, OpenerId = 25, LoopId = 10 } -- Order of Dawn
SndDefineLocationTrack{Map = "map\\Campaign\\009_greydusk_vale.map", X = 250, Y = 284, Radius = 8, OpenerId = 25, LoopId = 10 } -- Order of Dawn
SndDefineLocationTrack{Map = "map\\Campaign\\009_greydusk_vale.map", X = 260, Y = 284, Radius = 8, OpenerId = 25, LoopId = 10 } -- Order of Dawn
SndDefineLocationTrack{Map = "map\\Campaign\\009_greydusk_vale.map", X = 174, Y = 284, Radius = 18, OpenerId = 98, LoopId = 10 } -- Silence

-- 012_howling_mounds
SndDefineLocationTrack{Map = "map\\Campaign\\012_howling_mounds.map", X = 318, Y = 270, Radius = 70, OpenerId = 21, LoopId = 41 } -- Forbidden Zone mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\012_howling_mounds.map", X = 318, Y = 200, Radius = 70, OpenerId = 21, LoopId = 41 } -- Forbidden Zone mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\012_howling_mounds.map", X = 430, Y = 240, Radius = 50, OpenerId = 13, LoopId = 38 } -- Runewarrior mit Loop

-- 013_whisper
SndDefineLocationTrack{Map = "map\\Campaign\\013_whisper.map", X = 420, Y = 20, Radius = 195, OpenerId = 35, LoopId = 10 } -- Silence mit Loop


-- 014_the_godwall
SndDefineLocationTrack{Map = "map\\Campaign\\014_the_godwall.map", X = 175, Y = 195, Radius = 40, OpenerId = 76, LoopId = 10 } -- Entry Desertworld ohne Loop
SndDefineLocationTrack{Map = "map\\Campaign\\014_the_godwall.map", X = 195, Y = 170, Radius = 15, OpenerId = 76, LoopId = 10 } -- Entry Desertworld ohne Loop
SndDefineLocationTrack{Map = "map\\Campaign\\014_the_godwall.map", X = 210, Y = 170, Radius = 15, OpenerId = 76, LoopId = 10 } -- Entry Desertworld ohne Loop
SndDefineLocationTrack{Map = "map\\Campaign\\014_the_godwall.map", X = 225, Y = 170, Radius = 15, OpenerId = 76, LoopId = 10 } -- Entry Desertworld ohne Loop
SndDefineLocationTrack{Map = "map\\Campaign\\014_the_godwall.map", X = 240, Y = 175, Radius = 15, OpenerId = 76, LoopId = 10 } -- Entry Desertworld ohne Loop
SndDefineLocationTrack{Map = "map\\Campaign\\014_the_godwall.map", X = 240, Y = 75, Radius = 40, OpenerId = 48, LoopId = 55 } -- Plain Waterworld mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\014_the_godwall.map", X = 280, Y = 75, Radius = 40, OpenerId = 48, LoopId = 55 } -- Plain Waterworld mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\014_the_godwall.map", X = 330, Y = 78, Radius = 20, OpenerId = 48, LoopId = 55 } -- Plain Waterworld mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\014_the_godwall.map", X = 113, Y = 316, Radius = 54, OpenerId = 48, LoopId = 55 } -- Plain Waterworld mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\014_the_godwall.map", X = 79, Y = 342, Radius = 30, OpenerId = 48, LoopId = 55 } -- Plain Waterworld mit Loop


-- 016_mulandir
SndDefineLocationTrack{Map = "map\\Campaign\\016_mulandir.map", X = 245, Y = 310, Radius = 50, OpenerId = 26, LoopId = 46 } -- Battlefields mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\016_mulandir.map", X = 202, Y = 317, Radius = 20, OpenerId = 26, LoopId = 46 } -- Battlefields mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\016_mulandir.map", X = 280, Y = 335, Radius = 35, OpenerId = 26, LoopId = 46 } -- Battlefields mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\016_mulandir.map", X = 310, Y = 350, Radius = 40, OpenerId = 26, LoopId = 46 } -- Battlefields mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\016_mulandir.map", X = 343, Y = 378, Radius = 50, OpenerId = 26, LoopId = 46 } -- Battlefields mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\016_mulandir.map", X = 391, Y = 410, Radius = 70, OpenerId = 26, LoopId = 46 } -- Battlefields mit Loop

-- 018_farlorns_hope
SndDefineLocationTrack{Map = "map\\Campaign\\018_farlorns_hope.map", X = 98, Y = 320, Radius = 30, OpenerId = 23, LoopId = 10 } -- Ogre Battle ohne Loop
SndDefineLocationTrack{Map = "map\\Campaign\\018_farlorns_hope.map", X = 119, Y = 298, Radius = 20, OpenerId = 23, LoopId = 10 } -- Ogre Battle ohne Loop
SndDefineLocationTrack{Map = "map\\Campaign\\018_farlorns_hope.map", X = 72, Y = 334, Radius = 30, OpenerId = 23, LoopId = 10 } -- Ogre Battle ohne Loop
SndDefineLocationTrack{Map = "map\\Campaign\\018_farlorns_hope.map", X = 260, Y = 202, Radius = 47, OpenerId = 50, LoopId = 57 } -- Plain Desertworld mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\018_farlorns_hope.map", X = 266, Y = 302, Radius = 20, OpenerId = 20, LoopId = 40 } -- Deadzone mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\018_farlorns_hope.map", X = 263, Y = 324, Radius = 30, OpenerId = 20, LoopId = 40 } -- Deadzone mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\018_farlorns_hope.map", X = 260, Y = 354, Radius = 50, OpenerId = 20, LoopId = 40 } -- Deadzone mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\018_farlorns_hope.map", X = 256, Y = 397, Radius = 50, OpenerId = 20, LoopId = 40 } -- Deadzone mit Loop

-- 019_the_rift
SndDefineLocationTrack{Map = "map\\Campaign\\019_the_rift.map", X = 250, Y = 260, Radius = 140, OpenerId = 21, LoopId = 41 } -- Forbidden Zone mit Loop

-- 021_southern_godmark
SndDefineLocationTrack{Map = "map\\Campaign\\021_southern_godmark.map", X = 380, Y = 50, Radius = 40, OpenerId = 25, LoopId = 10 } -- Order of Dawn ohne Loop
SndDefineLocationTrack{Map = "map\\Campaign\\021_southern_godmark.map", X = 384, Y = 160, Radius = 65, OpenerId = 35, LoopId = 10 } -- Silence mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\021_southern_godmark.map", X = 396, Y = 394, Radius = 90, OpenerId = 52, LoopId = 59 } -- Plain Mountainworld mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\021_southern_godmark.map", X = 320, Y = 394, Radius = 90, OpenerId = 52, LoopId = 59 } -- Plain Mountainworld mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\021_southern_godmark.map", X = 250, Y = 394, Radius = 90, OpenerId = 52, LoopId = 59 } -- Plain Mountainworld mit Loop

-- 023_nightwhisper_dale
SndDefineLocationTrack{Map = "map\\Campaign\\023_nightwhisper_dale.map", X = 153, Y = 95, Radius = 35, OpenerId = 100, LoopId = 101 } -- Battle Blade Domination Loop
SndDefineLocationTrack{Map = "map\\Campaign\\023_nightwhisper_dale.map", X = 217, Y = 317, Radius = 60, OpenerId = 35, LoopId = 10 } -- Silence
SndDefineLocationTrack{Map = "map\\Campaign\\023_nightwhisper_dale.map", X = 130, Y = 405, Radius = 80, OpenerId = 26, LoopId = 46 } -- Silence

-- 027_sharrowdale

SndDefineLocationTrack{Map = "map\\Campaign\\027_sharrowdale.map", X = 155, Y = 31, Radius = 70, OpenerId = 35, LoopId = 10 } -- Silence
SndDefineLocationTrack{Map = "map\\Campaign\\027_sharrowdale.map", X = 323, Y = 390, Radius = 70, OpenerId = 54, LoopId = 61 } -- Plain Swampworld als Loca mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\027_sharrowdale.map", X = 370, Y = 368, Radius = 60, OpenerId = 54, LoopId = 61 } -- Plain Swampworld als Loca mit Loop
SndDefineLocationTrack{Map = "map\\Campaign\\027_sharrowdale.map", X = 403, Y = 370, Radius = 80, OpenerId = 54, LoopId = 61 } -- Plain Swampworld als Loca mit Loop

-- soundtest
SndDefineLocationTrack{Map = "map\\Test\\soundtest.map", X = 260, Y = 240, Radius = 120, OpenerId = 20, LoopId = 40 } -- Deadzone

-- PvP

SndDefineMapPlain{Map = "map\\Lan\\Ashvale.map", OpenerId = 255, PlainId = 8} 			
SndDefineMapPlain{Map = "map\\Lan\\Circle_Of_Fate.map", OpenerId = 258, PlainId = 148} 		
SndDefineMapPlain{Map = "map\\Lan\\Dunhan_Glades.map", OpenerId = 256, PlainId = 11} 		
SndDefineMapPlain{Map = "map\\Lan\\Glitter_Pass.map", OpenerId = 247, PlainId = 16} 		
SndDefineMapPlain{Map = "map\\Lan\\High_Frontier.map", OpenerId = 245, PlainId = 146} 		
SndDefineMapPlain{Map = "map\\Lan\\Iron_Fields.map", OpenerId = 254, PlainId = 147} 		
SndDefineMapPlain{Map = "map\\Lan\\SOTP_Bloodgate_Fortress.map", OpenerId = 249, PlainId = 4} 
SndDefineMapPlain{Map = "map\\Lan\\SOTP_Carmannon_Hill.map", OpenerId = 253, PlainId = 31} 	
SndDefineMapPlain{Map = "map\\Lan\\SOTP_DesertPVP4.map", OpenerId = 250, PlainId = 238} 	
SndDefineMapPlain{Map = "map\\Lan\\SOTP_Frozen_Wastes.map", OpenerId = 251, PlainId = 32} 	
SndDefineMapPlain{Map = "map\\Lan\\SOTP_JunglePVP2.map", OpenerId = 258, PlainId = 237} 	
SndDefineMapPlain{Map = "map\\Lan\\SOTP_LavaPVP2.map", OpenerId = 245, PlainId = 236} 		
SndDefineMapPlain{Map = "map\\Lan\\SOTP_OsgiliathPVP4.map", OpenerId = 247, PlainId = 148} 	
SndDefineMapPlain{Map = "map\\Lan\\SOTP_Tearwater_Valley.map", OpenerId = 246, PlainId = 146} 	
SndDefineMapPlain{Map = "map\\Lan\\SOTP_The_Barrens.map", OpenerId = 257, PlainId = 147} 	
SndDefineMapPlain{Map = "map\\Lan\\SOTP_The_White_Kingdom.map", OpenerId = 254, PlainId = 237} 	
SndDefineMapPlain{Map = "map\\Lan\\TBoW-Blistering_Vast.map", OpenerId = 253, PlainId = 238} 	
SndDefineMapPlain{Map = "map\\Lan\\TBoW-Dwarven_Plateau.map", OpenerId = 252, PlainId = 236} 	
SndDefineMapPlain{Map = "map\\Lan\\TBoW-Fallfire_Wastes.map", OpenerId = 255, PlainId = 8} 	
SndDefineMapPlain{Map = "map\\Lan\\TBoW-Glacier_Alley.map", OpenerId = 256, PlainId = 238} 	
SndDefineMapPlain{Map = "map\\Lan\\The_Green_Sea.map", OpenerId = 255, PlainId = 73} 		
SndDefineMapPlain{Map = "map\\Lan\\The_Pit.map", OpenerId = 257, PlainId = 32} 		
SndDefineMapPlain{Map = "map\\Lan\\Whisperling_Swamps.map", OpenerId = 249, PlainId = 11} 	
SndDefineMapPlain{Map = "map\\Lan\\Winddancer_Hills.map", OpenerId = 245, PlainId = 12} 	
SndDefineMapPlain{Map = "map\\Lan\\Winterlight_Peak.map", OpenerId = 257, PlainId = 148} 	
SndDefineMapPlain{Map = "map\\Lan\\Winterlight_Peak_Special.map", OpenerId = 250, PlainId = 236} 

-- Coop

SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_01_rpg.map", OpenerId = 255, PlainId = 8} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_02_dark.map", OpenerId = 258, PlainId = 148}  	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_02_light.map", OpenerId = 256, PlainId = 11} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_03_dark.map", OpenerId = 250, PlainId = 236}  	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_03_light.map", OpenerId = 257, PlainId = 148} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_04_rpg.map", OpenerId = 249, PlainId = 11} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_05_dark.map", OpenerId = 254, PlainId = 237} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_05_light.map", OpenerId = 247, PlainId = 148} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_06_dark.map", OpenerId = 250, PlainId = 238}	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_06_light.map", OpenerId = 253, PlainId = 31}	
SndDefineMapPlain{Map = "map\\LanFreeGame\\coop_07_rpg.map", OpenerId = 256, PlainId = 11}	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_08_dark.map", OpenerId = 246, PlainId = 146} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_08_light.map", OpenerId = 258, PlainId = 8} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_09_dark.map", OpenerId = 257, PlainId = 11} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_10_dark.map", OpenerId = 255, PlainId = 12} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_10_light.map", OpenerId = 256, PlainId = 16} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_11_dark.map", OpenerId = 252, PlainId = 31} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_11_light.map", OpenerId = 253, PlainId = 32} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_12_dark.map", OpenerId = 254, PlainId = 73} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_12_light.map", OpenerId = 250, PlainId = 146} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_13_dark.map", OpenerId = 249, PlainId = 147} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_13_light.map", OpenerId = 248, PlainId = 148} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_14_rpg.map", OpenerId = 245, PlainId = 236} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_15_dark.map", OpenerId = 246, PlainId = 237} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_15_light.map", OpenerId = 247, PlainId = 238} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_16_dark.map", OpenerId = 251, PlainId = 147} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_16_light.map", OpenerId = 255, PlainId = 148} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_17_dark.map", OpenerId = 256, PlainId = 236} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_17_light.map", OpenerId = 254, PlainId = 237} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_18_dark.map", OpenerId = 253, PlainId = 238} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_19_dark.map", OpenerId = 257, PlainId = 11} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_19_light.map", OpenerId = 248, PlainId = 8} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_20_dark.map", OpenerId = 251, PlainId = 12} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_20_light.map", OpenerId = 252, PlainId = 16} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_21_rpg.map", OpenerId = 253, PlainId = 31} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_22_rpg.map", OpenerId = 245, PlainId = 32} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_23_dark.map", OpenerId = 247, PlainId = 73} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_23_light.map", OpenerId = 249, PlainId = 146} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_24_dark.map", OpenerId = 248, PlainId = 147} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_24_light.map", OpenerId = 251, PlainId = 148} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_25_rpg.map", OpenerId = 252, PlainId = 236} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_26_dark.map", OpenerId = 253, PlainId = 237} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_26_light.map", OpenerId = 255, PlainId = 238} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_27_dark.map", OpenerId = 256, PlainId = 73} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_27_light.map", OpenerId = 257, PlainId = 146} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_28_dark.map", OpenerId = 258, PlainId = 147} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_28_light.map", OpenerId = 251, PlainId = 148} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_29_dark.map", OpenerId = 245, PlainId = 236} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_29_light.map", OpenerId = 246, PlainId = 238} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_30_dark.map", OpenerId = 247, PlainId = 8} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_30_light.map", OpenerId = 255, PlainId = 12} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_31_dark_Laragh.map", OpenerId = 256, PlainId = 11} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_31_light_Laragh.map", OpenerId = 247, PlainId = 31} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_32_dark_ShalDun.map", OpenerId = 249, PlainId = 32} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_32_light_ShalDun.map", OpenerId = 250, PlainId = 73} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_33_rpg_Tirganach.map", OpenerId = 251, PlainId = 146} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_34_dark_Norimar.map", OpenerId = 258, PlainId = 147} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_34_light_Norimar.map", OpenerId = 257, PlainId = 148} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_35_dark_Mirraw_Thur.map", OpenerId = 256, PlainId = 236} 
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_35_light_Mirraw_Thur.map", OpenerId = 251, PlainId = 237}
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_36_dark_Erindarmap", OpenerId = 247, PlainId = 238} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_36_light_Erindar.map", OpenerId = 257, PlainId = 237} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_37_dark_DraughNar.map", OpenerId = 245, PlainId = 236} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_37_light_DraughNar.map", OpenerId = 246, PlainId = 148} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_38_rpg_Arundale.map", OpenerId = 254, PlainId = 147} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_38_rpg_Arundale.map", OpenerId = 253, PlainId = 146} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_39_dark_Khalazhar.map", OpenerId = 252, PlainId = 73} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_39_light_Khalazhar.map", OpenerId = 251, PlainId = 32} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_40_dark_Orzach.map", OpenerId = 256, PlainId = 31} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_40_light_Orzach.map", OpenerId = 246, PlainId = 11} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_41_dark_Fastholme.map", OpenerId = 247, PlainId = 12} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_41_light_Fastholme.map", OpenerId = 248, PlainId = 8} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_42_rpg_Lordraine.map", OpenerId = 249, PlainId = 146} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_43_dark_Kathai.map", OpenerId = 250, PlainId = 147} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_43_light_Kathai.map", OpenerId = 251, PlainId = 148} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_44_dark_Hazimar.map", OpenerId = 252, PlainId = 238} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_44_light_Hazimar.map", OpenerId = 253, PlainId = 11} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Coop_45_rpg_Anaduine.map", OpenerId = 254, PlainId = 237} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Marketplace.map", OpenerId = 255, PlainId = 238} 	
SndDefineMapPlain{Map = "map\\LanFreeGame\\Questplace.map", OpenerId = 256, PlainId = 147} 	



-- Ui specific remember: make entry for new sounds in UiTypes as well)
SndAddUiSample(kMnuSoundClick,					"ui_default_click.wav")
SndAddUiSample(kMnuSoundError,					"ui_default_error.wav")
SndAddUiSample(kUiSoundAltX,					"dummy_silence.wav")
SndAddUiSample(kUiSoundCheerio,					"ui_cheerio.wav")
SndAddUiSample(kUiSoundAlarm,					"ui_alarm.wav")
SndAddUiSample(kUiSoundMenuOpen,				"ui_default_open.wav")
SndAddUiSample(kUiSoundMenuClose,				"ui_default_close.wav")
SndAddUiSample(kUiSoundGotoSuccess,				"ui_default_click.wav")
SndAddUiSample(kUiSoundGotoFailed,				"ui_default_error.wav")
SndAddUiSample(kUiSoundItemTake,				"ui_default_take.wav")
SndAddUiSample(kUiSoundItemDestroy,				"ui_default_destroy_item.wav")
SndAddUiSample(kUiSoundEquipmentDrop,			"ui_default_drop.wav")
SndAddUiSample(kUiSoundScrollTake,				"ui_plans_scroll_take.wav")
SndAddUiSample(kUiSoundSpellTake,				"ui_default_klick.wav")
SndAddUiSample(kUiSoundSpellToBook,				"ui_spellbook_write_spell.wav")	
SndAddUiSample(kUiSoundSpellMem,				"ui_spellbook_learn_spell.wav")
SndAddUiSample(kUiSoundSpellForget,				"ui_spellbook_spell_forget.wav")
SndAddUiSample(kUiSoundPagingSpellbook,			"ui_default_paging.wav")
SndAddUiSample(kUiSoundRecruitUnit,				"ui_default_click.wav")
SndAddUiSample(kUiSoundPlaceBuilding,			"dummy_silence.wav")
SndAddUiSample(kUiSoundPortal,					"world_enter_portal.wav")
SndAddUiSample(kUiSoundPlanScrollTake,			"ui_plans_scroll_take.wav")
SndAddUiSample(kUiSoundPlanScrollDrop,			"ui_default_drop.wav")
SndAddUiSample(kUiSoundPlanScrollPlace,			"ui_plans_scroll_drop.wav")
SndAddUiSample(kUiSoundPlanBuildingDrop,		"ui_plans_scroll_drop.wav")
SndAddUiSample(kUiSoundQuestboxItemDrop,		"ui_default_drop.wav")
SndAddUiSample(kUiSoundRuneTake,				"ui_runeboard_rune_take.wav")
SndAddUiSample(kUiSoundRuneDrop,				"ui_runeboard_rune_drop.wav")
SndAddUiSample(kUiSoundMonumentActivate,			"ui_runeboard_rune_activate.wav")
SndAddUiSample(kUiSoundMerchantHilight,			"ui_default_click.wav")
SndAddUiSample(kUiSoundBuildingDone,			"ui_building_ready.wav") 
SndAddUiSample(kUiSoundBuildingHit,				"dummy_silence.wav") 
SndAddUiSample(kUiSoundMenuLootOpen,			"ui_other_lootmenu.wav")
SndAddUiSample(kUiSoundSummonHero,				"ui_default_click.wav")	
SndAddUiSample(kUiSoundSummonWorker,			"ui_default_click.wav")
SndAddUiSample(kUiSoundLevelUp,					"ui_level_up.wav")
SndAddUiSample(kUiSoundJingleAttack,			"ui_jingle_attack.wav")
SndAddUiSample(kUiSoundJingleAttackAlliance,	"ui_jingle_attack.wav")
SndAddUiSample(kUiSoundAttackedUnit,			"dummy_silence.wav")
SndAddUiSample(kUiSoundAttackedHero,			"dummy_silence.wav")
SndAddUiSample(kUiSoundEnemySpotted,			"ui_lookout.wav")
SndAddUiSample(kUiSoundKilledHero,				"dummy_silence.wav")
SndAddUiSample(kUiSoundPlayerBind,				"object_bindstone_activate.wav")
SndAddUiSample(kUiSoundInterjection,			"ui_interjection.wav")
SndAddUiSample(kUiSoundSelectBuilding,			"ui_select_building.wav")

SndAddUiSample(kUiSoundArmourLeather,		"ui_equipment_armour_leather.wav")	--todo sound
SndAddUiSample(kUiSoundArmourChain,			"ui_equipment_armour_chain.wav")	--todo sound
SndAddUiSample(kUiSoundArmourPlate,			"ui_equipment_armour_plate.wav")	--todo sound
SndAddUiSample(kUiSoundArmourCloth,			"ui_equipment_armour_cloth.wav")	--todo sound
SndAddUiSample(kUiSoundShieldWood,			"ui_equipment_shield_wood.wav")		--todo sound
SndAddUiSample(kUiSoundShieldMetal,			"ui_equipment_shield_metal.wav")	--todo sound
SndAddUiSample(kUiSoundWeaponSword,			"ui_equipment_weapon_sword.wav")	--todo sound
--SndAddUiSample(kUiSoundWeaponStuff,			"ui_equipment_weapon_stuff.wav")	--todo sound
SndAddUiSample(kUiSoundWeaponMetal,			"ui_equipment_weapon_metal.wav")	--todo sound
SndAddUiSample(kUiSoundWeaponWood,			"ui_equipment_weapon_wood.wav")		--todo sound
SndAddUiSample(kUiSoundWeaponAxe,			"ui_equipment_weapon_axe.wav")		--todo sound
SndAddUiSample(kUiSoundRing,				"ui_equipment_ring.wav")		--todo sound
SndAddUiSample(kUiSoundScroll,				"ui_equipment_scroll.wav")		--todo sound
--Dirks Domain--
SndAddUiSample(kUiSoundBuildHouseSuccess,			"ui_plans_place_building.wav")
SndAddUiSample(kUiSoundBuildHouseFailed,			"ui_default_error.wav")
SndAddUiSample(kUiSoundSetRallyPointSuccess,		"ui_place_flag.wav")
SndAddUiSample(kUiSoundSetRallyPointFailed,			"ui_default_error.wav")
SndAddUiSample(kUiSoundCastSpellFailed,			    "ui_default_error.wav")
SndAddUiSample(kUiSoundStartWorkAtBuildingSuccess,	"ui_select_building.wav")
SndAddUiSample(kUiSoundStartWorkAtBuildingFailed,	"ui_default_error.wav")
SndAddUiSample(kUiSoundAttackSuccess,			    "ui_attack_success.wav")
SndAddUiSample(kUiSoundAttackFailed,			    "ui_default_error.wav")
SndAddUiSample(kUiSoundAttackBuildingSuccess,		"ui_attack_success.wav")
SndAddUiSample(kUiSoundAttackBuildingFailed,		"ui_default_error.wav")
SndAddUiSample(kUiSoundCutTreeSuccess,			    "ui_cut_tree_success.wav")
SndAddUiSample(kUiSoundCutTreeFailed,			    "ui_default_error.wav")
SndAddUiSample(kUiSoundCrushStoneSuccess,			"ui_crush_stone_success.wav")
SndAddUiSample(kUiSoundCrushStoneFailed,			"ui_default_error.wav")
SndAddUiSample(kUiSoundCollectBrushWoodSuccess,		"ui_default_click.wav")
SndAddUiSample(kUiSoundCollectBrushWoodFailed,		"ui_default_error.wav")
SndAddUiSample(kUiSoundCollectCoalSuccess,		    "ui_collect_coal_success.wav")
SndAddUiSample(kUiSoundCollectCoalFailed,			"ui_default_error.wav")
SndAddUiSample(kUiSoundCollectIronSuccess,		    "ui_collect_iron_success.wav")
SndAddUiSample(kUiSoundCollectIronFailed,			"ui_default_error.wav")
SndAddUiSample(kUiSoundFollowSuccess,			    "ui_follow_success.wav")
SndAddUiSample(kUiSoundFollowFailed,			    "ui_default_error.wav")
SndAddUiSample(kUiSoundLootSuccess,				    "ui_default_click.wav")
SndAddUiSample(kUiSoundLootFailed,				    "ui_default_error.wav")
SndAddUiSample(kUiSoundRollLoamSuccess,			    "ui_default_click.wav")
SndAddUiSample(kUiSoundRollLoamFailed,			    "ui_default_error.wav")
SndAddUiSample(kUiSoundTradeSuccess,			    "ui_trade_success.wav")
SndAddUiSample(kUiSoundTradeFailed,				    "ui_default_error.wav")

SndAddUiSample(kUiSoundTalkFailed,			"ui_default_error.wav")
SndAddUiSample(kUiSoundTalkSuccess,		"ui_default_click.wav")

-- Addon2 
SndAddUiSample(kUiSoundobject_attack_signal_troops, "object_attack_signal_troops.wav")  
SndAddUiSample(kUiSoundobject_colosseum_applause, "object_colosseum_applause.wav")   
SndAddUiSample(kUiSoundobject_colosseum_boohs,"object_colosseum_boohs.wav")   
SndAddUiSample(kUiSoundobject_colosseum_cheers, "object_colosseum_cheers.wav")      
SndAddUiSample(kUiSoundobject_dragon_spawn, "object_dragon_spawn.wav")
SndAddUiSample(kUiSoundobject_empyria_bard_1, "object_empyria_bard_1.wav")        
SndAddUiSample(kUiSoundobject_empyria_bard_2, "object_empyria_bard_2.wav")
SndAddUiSample(kUiSoundobject_empyria_bard_3, "object_empyria_bard_3.wav")
SndAddUiSample(kUiSoundobject_empyria_bard_4, "object_empyria_bard_4.wav")
SndAddUiSample(kUiSoundobject_empyria_bazaar_1, "object_empyria_bazaar_1.wav")
SndAddUiSample(kUiSoundobject_empyria_bazaar_2, "object_empyria_bazaar_2.wav")
SndAddUiSample(kUiSoundobject_empyria_crowd_1, "object_empyria_crowd_1.wav")
SndAddUiSample(kUiSoundobject_empyria_crowd_2, "object_empyria_crowd_2.wav")
SndAddUiSample(kUiSoundobject_howling_heads, "object_howling_heads.wav")
SndAddUiSample(kUiSoundobject_pentacle_destroyed, "object_pentacle_destroyed.wav")
SndAddUiSample(kUiSoundobject_sacred_freedom, "object_sacred_freedom.wav")
SndAddUiSample(kUiSoundobject_stoneexplosion, "object_stoneexplosion.wav")
SndAddUiSample(kUiSoundobject_volcano_grumble, "object_volcano_grumble.wav")


