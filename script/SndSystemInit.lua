-- this file initializes the lua side of the sound system
-- it also defines all the functions called from CAppSound, that are:
--		SndTrigger
--		SndPlayUi
--		SndPlayDrw

-- helper function to convert min/sec/milliseconds timing into milliseconds
ms = function(min, sec, milli)
	return ((min * 60) + sec) * 1000 + milli
end

-------------------------------------------------------------------------------
-- SndAddUiSample
-- PURPOSE:
--	This functions adds a sample associated with an event to the sample list
-------------------------------------------------------------------------------
function SndAddUiSample(Event, Filename)
	if Event then
		SndUiEventSamples[Event] = Filename
	else
		assert(Event)	
		print("SndAddUiSample: ERROR: Event undefined! Ignoring filename "..Filename)
	end
end

-------------------------------------------------------------------------------
-- SndAddTrackType
-- PURPOSE:
--	This functions adds a streaming track type with its properties to the track type list
-------------------------------------------------------------------------------
function SndAddTrackType(tracktype)
	local interrupt = {}
	local i

	-- reformat interrupt table to be more easier to use later on
	for i=1, getn(tracktype.Interrupts) do
		interrupt[tracktype.Interrupts[i]] = 1
	end
	tracktype.Interrupts = interrupt

	StreamTrackTypes[tracktype.Name] = tracktype
end

-------------------------------------------------------------------------------
-- SndAddTrack
-- PURPOSE:
--	This functions adds a streaming track with its properties to the track list
-------------------------------------------------------------------------------
function SndAddTrack(track)
	-- und füge den track in die trackliste ein
	assert(track)
	assert(track.Type)
	assert(track.Id)
	if StreamTrackTypes[track.Type] then
		StreamTracks[track.Id] = track
	else
		print("Track rejected: Unknown type")
	end
end

-------------------------------------------------------------------------------
-- SndDefineMapPlain
-- PURPOSE:
--	This functions assigns a pair of tracks (opener, plain) with a specific 
--  map
-------------------------------------------------------------------------------
function SndDefineMapPlain(desc)
    assert(desc.Map)
	if desc.OpenerId ~= nil then
	    assert(desc.OpenerId > 0)
		assert(desc.OpenerId <= getn(StreamTracks))
	end
    if desc.PlainId ~= nil then
	    assert(desc.PlainId > 0)
		assert(desc.PlainId <= getn(StreamTracks))
	end

    MusicPlatformTracks[strlower(desc.Map)] = desc
end

-------------------------------------------------------------------------------
-- SndDefineLocationTrack
-- PURPOSE:
--  This function assigns a pair of tracks (opener, loop) to a region on a map
-------------------------------------------------------------------------------
function SndDefineLocationTrack(desc)
    assert(desc.Map ~= nil)
    assert(desc.OpenerId)
    assert(desc.LoopId)
    assert(desc.X)
    assert(desc.Y)
    assert(desc.Radius)

    desc.Circle = { X = desc.X, Y = desc.Y, Radius = desc.Radius }

    if not MusicRegions[desc.Map] then
        MusicRegions[desc.Map] = {}
    end
    tinsert(MusicRegions[desc.Map], desc)
end

-------------------------------------------------------------------------------
-- SndPlayNextTrack
-- PURPOSE:
--	Selects a new track to play and initiates the transition
-------------------------------------------------------------------------------
function SndPlayNextTrack()
	local track
	
	if nil then
		track = random(getn(StreamTracks))
	end
	
	if StreamTrack == 1 then
		track = 4
	else
		track = 1
	end

	SndStreamTransition(StreamTrack, track, 1)
end

-------------------------------------------------------------------------------
-- SndAvatarInRect(Rect)
-- PURPOSE:
--	Checks, whether the Avatar in currently located within a rect. The Avatar
--	position is retrieved from the global MusicAvatarPosition.
-- PARAMS:
--	Rect: Table{x,y,width,height}		the rect to check as table
-------------------------------------------------------------------------------
function SndAvatarInCircle(Circle)
	local retval
	
	-- erstmal alle parameter auf sinnvolle werte prüfen
	if Circle ~= nil and MusicAvatarPosition ~= nil and MusicAvatarPosition.x ~= nil and MusicAvatarPosition.y ~= nil then
		local x = MusicAvatarPosition.x
		local y = MusicAvatarPosition.y

        -- bestimme abstand avatar<->center
        local dist = (x - Circle[1]) * (x - Circle[1]) + (y - Circle[2]) * (y - Circle[2])

        -- ist der avatar im kreis?
		if dist <= Circle[3]*Circle[3] then
			retval = 1
		end
	end

	return retval
end

-------------------------------------------------------------------------------
-- SndFindTrackByType
-- PURPOSE:
--  Small helper function to get a random track of a specified type
-------------------------------------------------------------------------------
function SndFindTrackByType(_Type)
    local track = nil
    local set = {}
    local prevtrack = 0

    foreach(StreamTracks, function(_i, _track)
			assert(_track)
			if _track.Type == %_Type then
	            tinsert(%set, _i)
			end
        end)
        
    if getn(set) > 0 then
        track = set[random(getn(set))]
    end

    return track
end

-------------------------------------------------------------------------------
-- SndGetLocationTrack
-- PURPOSE:
--  Searches for marked region on the current platform for location tracks
-------------------------------------------------------------------------------
function SndGetLocationTrack()
    local regions = MusicRegions[MusicAvatarPosition.Map]
    local retval = { }
    
    if regions and getn(regions) > 0 then

        foreachi(regions, function(_i, _region)
                local circle = tcopy(_region.Circle)

                -- wenn wir schon im Bereich sind, dann wird der Hotspot größer
                if StreamTrack == _region.OpenerId or StreamTrack == _region.LoopId then
                    circle.Radius = circle.Radius + 10
                end
        
                -- ist der avatar im bereich?
                if SndAvatarInCircle{circle.X, circle.Y, circle.Radius} then
                    if StreamTrack == _region.OpenerId or StreamTrack == _region.LoopId then
                        %retval[1] = _region.LoopId
                    else
                        %retval[1] = _region.OpenerId
                    end
                end
            end)
    end

    return retval[1]
end

-------------------------------------------------------------------------------
-- SndBuildTrackList
-- PURPOSE:
--	Build a list of all mp3 tracks that are considered at the moment
--	Each track has an associated priority and an interrupt flag. The list
--	is sorted by this priority, so that the track with the highest priority is
--	played next. If the interrupt flag is set on the track with the highest
--	priority then the current playing track is interrupted and the new track
--	is started immediately. Else the current track is played till end and then
--	the new track is started
-------------------------------------------------------------------------------
function SndBuildTrackList()
	local tracklist = {}

	-- nur etwas unternehmen, wenn nicht gerade sowieso ein übergang stattfindet
	if Snd:GetTime() > StreamLock then

		-- der hauptmenütrack 
		if not MusicGameRunning then
			tinsert(tracklist, SndFindTrackByType("MainMenu"))
		end

		-- ein binkmovie läuft
		if MusicBinkRunning then
			tinsert(tracklist, SndFindTrackByType("Movie"))
		end

		-- die nacht
		if MusicGameRunning and (MusicPlatformTime < 0.16 or MusicPlatformTime > 0.82) then
			tinsert(tracklist, SndFindTrackByType("Night"))
		end

		-- der ingame basistrack ist immer zu hören (und unterbricht keinen anderen track), zumindest solange wir überhaupt im spiel sind
		if MusicGameRunning and not MusicAvatarDead then
            if SndMusic == 2 and MusicPlatformTracks[strlower(MusicAvatarPosition.Map)] ~= nil and MusicPlatformTracks[strlower(MusicAvatarPosition.Map)].PlainId then
				tinsert(tracklist, MusicPlatformTracks[strlower(MusicAvatarPosition.Map)].PlainId) -- MusicAvatarPosition kann nil sein! defaultwert anpassen?
			else
				tinsert(tracklist, 33) -- plain_silence
	        end
		end

		-- bei kampf kommt noch der kampftrack in frage
		if MusicGameRunning and not MusicAvatarDead and MusicCombatTrack ~= nil then
			tinsert(tracklist, MusicCombatTrack)
		end

		-- Portal durchlaufen und Platform betreten Tracks einfügen
		for i=1, getn(MusicEvents) do
			if MusicEvents[i] == 0 then		-- platform betreten
				MusicOpenerWaitForCutscene = nil
                if MusicPlatformTracks[strlower(MusicAvatarPosition.Map)] ~= nil then
					if MusicPlatformTracks[strlower(MusicAvatarPosition.Map)].OpenerId then
						if MusicPlatformTracks[strlower(MusicAvatarPosition.Map)].OpenerWaitForCutscene then
							-- print("SND: Waiting for Cutscene")
							MusicOpenerWaitForCutscene = 1
						else
							tinsert(tracklist, MusicPlatformTracks[strlower(MusicAvatarPosition.Map)].OpenerId)
						end
					end
                end
			elseif MusicEvents[i] == 1 then	-- fake portal durchlaufen
                if MusicPlatformTracks[strlower(MusicAvatarPosition.Map)] ~= nil then
					if MusicPlatformTracks[strlower(MusicAvatarPosition.Map)].OpenerId then
						tinsert(tracklist, MusicPlatformTracks[strlower(MusicAvatarPosition.Map)].OpenerId)
					end
                end
			elseif MusicEvents[i] == 2 then	-- avatar gestorben
				tinsert(tracklist, SndFindTrackByType("Death"))
			elseif MusicEvents[i] == 3 then
				-- print("SND: Cutscene end")
				if MusicOpenerWaitForCutscene then
					if MusicPlatformTracks[strlower(MusicAvatarPosition.Map)].OpenerId then
						-- print("SND: Cutscene end => playing opener")
						tinsert(tracklist, MusicPlatformTracks[strlower(MusicAvatarPosition.Map)].OpenerId)
					end
				end
			end
		end
		MusicEvents = {} -- alte events löschen

		-- Location based tracks einfügen 
		if MusicGameRunning and not MusicAvatarDead then
            local t = SndGetLocationTrack()
            if t then
                tinsert(tracklist, t)
            end
		end

		-- filter tracks raus, die doch nicht gespielt werden dürfen (MindTheGap, d.h. Mindestzeit zwischen zwei Starts)
		local i
		local newtracklist = {}
		for i = 1, getn(tracklist) do
			--dump(tracklist)
			if not StreamTrackTypes[StreamTracks[tracklist[i]].Type].MindTheGap or not StreamTrackTypes[StreamTracks[tracklist[i]].Type].MindTheGapLastStart or 
				Snd:GetTime() - StreamTrackTypes[StreamTracks[tracklist[i]].Type].MindTheGapLastStart > StreamTrackTypes[StreamTracks[tracklist[i]].Type].MindTheGap then
				tinsert(newtracklist, tracklist[i])
			end
		end
		tracklist = newtracklist

		-- ist überhaupt was da zum abspielen
		if getn(tracklist) > 0 then
			
			-- sortiere die liste nach priorität (höchste priorität vorne)
			sort(tracklist, function(a, b) return StreamTrackTypes[StreamTracks[a].Type].Priority > StreamTrackTypes[StreamTracks[b].Type].Priority end)

			-- %$ TODO: falls mehrere tracks die gleiche priorität haben, dann einen zufallstrack auswählen

			-- weitere action interessiert nur, wenn überhaupt ein anderer track ausgewählt wurde, oder der aktuelle track
			-- fast am ende ist
			if tracklist[1] ~= StreamTrack or Snd:GetTime() > StreamNextTransition then
			
				-- soll der bisherige track unterbrochen werden?
				if tracklist[1] ~= StreamTrack and StreamTrack ~= nil and StreamTrackTypes[StreamTracks[tracklist[1]].Type].Interrupts[StreamTracks[StreamTrack].Type] then
					SndStreamTransition(StreamTrack, tracklist[1], 1)
					StreamTrackTypes[StreamTracks[tracklist[1]].Type].MindTheGapLastStart = Snd:GetTime()
					-- print("Track wird unterbrochen")

				-- ansonsten warte auf den normalen übergang
				else
					-- ist der aktuelle track fast zu ende => dann starte den nächsten
					if Snd:GetTime() > StreamNextTransition then
						SndStreamTransition(StreamTrack, tracklist[1], nil)
						StreamTrackTypes[StreamTracks[tracklist[1]].Type].MindTheGapLastStart = Snd:GetTime()
						-- print("Normaler Track Übergang")
					end
				end
			end
		end
	end
end


-------------------------------------------------------------------------------
-- SndTrigger
-- PURPOSE:
--	This function gets called regulary from AppSound. Its job is to do regulary
--	upkeep tasks. Currently it's job is to keep the streaming sound playing.
-------------------------------------------------------------------------------
function SndTrigger(_GameRunning, _AvatarDead, _PlatformType, _Time, _bBink)
	if SndMusic ~= nil then
		MusicGameRunning = _GameRunning
		MusicBinkRunning = _bBink
		MusicAvatarDead = _AvatarDead
        MusicPlatformType = _PlatformType
		MusicPlatformTime = _Time

		SndBuildTrackList() 
	end

	collectgarbage()
end


function SndStopMusic()
	if SndMusic ~= nil then
		if Stream then
			Stream:Stop()
			StreamTrack = nil
			StreamNextTransition = 0
		end
	end
end

function SndStopPlain()
	if SndMusic ~= nil then
		if Stream then
			Stream:Stop()
			StreamTrack = nil
			StreamNextTransition = 0
		end
	end
end

-------------------------------------------------------------------------------
-- SndSetAvatarPosition
-- PURPOSE:
--	This function gets called to inform the script system about the current
--	position of the avatar. The map designers can place special music areas
--	in the map and the position of the avatar decides which music gets played.
--	This data influences the mp3 tracks to play.
-------------------------------------------------------------------------------
function SndSetAvatarPosition(_MapName, _x, _y)
	MusicAvatarPosition = { Map = _MapName, x = _x, y = _y }
end

-------------------------------------------------------------------------------
-- SndGlobalEvent
-- PURPOSE:
--	This function gets called to inform the script system about a global event
--	such as entering a platform, walking through a portal....
--	This data influences the mp3 tracks to play.
-------------------------------------------------------------------------------
function SndGlobalEvent(event)
	tinsert(MusicEvents, event)
end

-------------------------------------------------------------------------------
-- SndSetCombatStatus
-- PURPOSE:
--	This function gets called from AppSound to tell the script system about
--	the global combat situation. This data influences the mp3 tracks to play.
--  The function gets six parameters. Each parameter is a table with the same
--  entries:
--      - FigureCount:          Number of Figures that are subject to the aggro
--      - AverageHateValue      Average Hate Value of all subject on all targets
--      - TargetCount           Number of targets that are object of this aggro stat
--      - LevelDiff             Maximum level diff
--  The six parameters distinguish by the figures that are subject/object of 
--  the aggros
--      - AvatarTargets         Stats about the objects that are targeted by the local avatar
--      - HeroTargets           Stats about the objects that are targeted by the heros of the local player
--      - OtherTargets          Stats about the objects that are targeted by all other figures owned by the local player
--      - EnemyAvatar           Stats about the subjects that target the local avatar
--      - EnemyHero             Stats about the subjects that target the heroes of the local player
--      - EnemyOther            Stats about the subjects that target all other figures owned by the local player
-------------------------------------------------------------------------------
function SndSetCombatStatus(AvatarTargets, HeroTargets, OtherTargets, EnemyAvatar, EnemyHero, EnemyOther)

    Sum = { } 
    Sum.FigureCount = AvatarTargets.FigureCount + HeroTargets.FigureCount + OtherTargets.FigureCount + EnemyAvatar.FigureCount + EnemyHero.FigureCount + EnemyOther.FigureCount 
    Sum.AverageHateValue = AvatarTargets.AverageHateValue + HeroTargets.AverageHateValue + OtherTargets.AverageHateValue + EnemyAvatar.AverageHateValue + EnemyHero.AverageHateValue + EnemyOther.AverageHateValue 
    Sum.TargetCount = AvatarTargets.TargetCount + HeroTargets.TargetCount + OtherTargets.TargetCount + EnemyAvatar.TargetCount + EnemyHero.TargetCount + EnemyOther.TargetCount 
    Sum.LevelDiff = max(AvatarTargets.LevelDiff, HeroTargets.LevelDiff, OtherTargets.LevelDiff, EnemyAvatar.LevelDiff, EnemyHero.LevelDiff, EnemyOther.LevelDiff)

    -- tobt eine größere Schlacht oder ein Kampf gegen einen starken Gegner ?
        if Sum.FigureCount >= 7 or Sum.LevelDiff > 7 then
            if MusicCombatTrack == nil then

				MusicCombatTrack = SndFindTrackByType("Battle")

    -- auf Battlemusik switchen falls Kampf zu groß wurde

            elseif Sum.FigureCount >= 12 or Sum.LevelDiff > 6 then

				if MusicCombatTrack and StreamTracks[MusicCombatTrack].Type ~= "Battle" then
					MusicCombatTrack = SndFindTrackByType("Battle")
				end

            end

    -- will jemand was vom Avatar?
        elseif (AvatarTargets.FigureCount > 0 and AvatarTargets.LevelDiff > -5) or 

        (EnemyAvatar.FigureCount > 0 and EnemyAvatar.LevelDiff > -4) or

        ((AvatarTargets.FigureCount > 0 or EnemyAvatar.FigureCount > 0) and Sum.FigureCount >= 5) then

            if MusicCombatTrack == nil then

				MusicCombatTrack = SndFindTrackByType("Combat")

            end

    -- wenn bereits kampfmusik läuft und noch irgendwo auf der karte geprügelt wird, dann lasse die kampfmusik weiterlaufen
        elseif MusicCombatTrack ~= nil and Sum.FigureCount > 0 then

            MusicCombatTrack = MusicCombatTrack

        else

            MusicCombatTrack = nil

        end
end

-------------------------------------------------------------------------------
-- SndPlayUi
-- PURPOSE:
--	This function gets called to play a UI sound
-------------------------------------------------------------------------------
function SndPlayUi(Event)
	
	-- get the sample
	local sample_name = SndUiEventSamples[Event]

	-- play the sample
	if sample_name ~= nil and sample_name ~= "" then
		return "sound\\" .. sample_name
	end

	return ""
end


-------------------------------------------------------------------------------
-- SndPlayDrw
-- PURPOSE:
--	This function gets called to play a Drw sound
-------------------------------------------------------------------------------
function SndPlayDrw(Event, iCamStd)
	
	-- get the sample
	local sampledata = SndDrwEventSamples[Event]

	-- play the sample
	if sampledata ~= nil then
		local sample_name = sampledata.File
		while type(sample_name) == "table" do
			-- when it is a table - randomly choose one of it
			-- (and when the chosen entry is a table again - repeat!)
			sample_name = sample_name[random(getn(sample_name))]
		end
		local fallofmin = 10
		local fallofmax = 70
		if iCamStd ~= 1 then
			fallofmin = sampledata.FallOffMin
			fallofmax = sampledata.FallOffMax
		end

		return sample_name, sampledata.Atmo, fallofmin, fallofmax, sampledata.Volume, sampledata.Length

	else
		print("SndPlayDrw - undefined event: ",Event) -- debug
	end

	return "", nil, nil, nil, nil, nil
end


-------------------------------------------------------------------------------
-- File body
-- PURPOSE:
--	global init stuff
-------------------------------------------------------------------------------

-- init random
local time = Snd:GetTime()
randomseed(time)

-- init some vars
StreamFilename = nil
StreamNextTransition = 0
StreamTrackTypes = {}
StreamTracks = {}
StreamTrackTransitions = {}
StreamStart = 0				-- zu diesem Zeitpunkt wurde der aktuelle Stream gestartet
SndUiEventSamples = {}
SndDrwEventSamples = {}
StreamTrack = nil			-- die aktuell gespielte Tracknummer
Stream = nil				-- der aktuell gespielte Track (type SndStream)
StreamLock = 0				-- bis zu diesem Zeitpunkt darf kein neuer Stream gestartet werden, da gerade ein Übergang stattfindet 
MusicCombatTrack = nil		-- ein maß für das ausmaß von kämpfen zur zeit
MusicGameRunning = 0		-- läuft gerade ein Spiel (== 1) oder ist der Spieler im Hauptmenü? (== nil)
MusicAvatarPosition = nil	-- aktuelle position des avatars in der welt oder nil, wenn ungültige karte oder hauptmenü
MusicEvents = {}            -- liste aktueller events
MusicPlatformType = 0       -- welche Plattformtyp (Ozean, Eis, etc.)
MusicPlatformTracks = {}    -- welche Tracks zu welcher Platform gehören
MusicRegions = {}           -- Location Tracks
MusicPlatformTime = 0		-- Uhrzeit auf der Platform
MusicBinkRunning = nil

-- load the transition engine
dofile("script\\SndTransitionEngine.lua")

-- load the track descriptions
dofile("script\\SndTracks.lua")

-- load the track transitions
dofile("script\\SndTrackTransitions.lua")

-- Drw specific samples
dofile("script/DrwFiles.lua")
dofile("script/DrwSound.lua")


--	Environmental Sounds
dofile("script/SndEnvSounds.lua")
