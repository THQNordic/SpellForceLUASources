-------------------------------------------------------------------------------
-- SndAddTransition
-- PURPOSE:
--	This functions adds a track transition to the transition table
-------------------------------------------------------------------------------
function SndAddTransition(transition)

	-- bestimme zeitpunkt, vor dem die transition gestartet sein muß
	local mintime = 10000000
	for _, effect in transition.Effects do
		if effect.Type == "StartTo" or effect.Type == "FadeFrom" then
			mintime = min(mintime, effect.Start)
		elseif effect.Type == "FadeFrom" or effect.Type == "FadeTo" then
			assert(effect.Stop > effect.Start)
		end
	end

	-- trage diese starttime ein
	transition.StartTime = mintime
	
	tinsert(StreamTrackTransitions, transition)
end

-------------------------------------------------------------------------------
-- SndStreamFindTransition
-- PURPOSE:
--	This functions find a suitable transition between two tracks
--	Params: 
--		current:	index of the current track in the StreamTracks table
--		next:		index of the next track in the StreamTracks table
--		interrupt:	should the current track be stopped out before end (~= nil) or
--					should the current track play to its end before the next
--					track starts (== nil)
-------------------------------------------------------------------------------
function SndStreamFindTransition(current, next, interrupt)
	local currentname = StreamTracks[current].File
	local nextname = StreamTracks[next].File
	local possible = {} 
	local possibleinterrupt = {} 
	local possiblegeneric = {}
	local possiblegenericinterrupt = {}
	local retval

	-- durchsuche alle transitions, ob sie die passenden dateinamen beinhalten
	foreachi(StreamTrackTransitions, 
		function(index, value)
			if value.From == %currentname and value.To == %nextname then
				if value.Interrupt ~= nil then
					tinsert(%possibleinterrupt, value)
				end
				if Stream:GetPosition() < value.StartTime then
					tinsert(%possible, value)
				end
			end
			if (value.From == nil or value.From == %currentname) and 
				(value.To == nil or value.To == %nextname) then
                local prio = 0
                if value.From ~= nil then
                    prio = prio + 1
                end
                if value.To ~= nil then
                    prio = prio + 2
                end
				if value.Interrupt ~= nil then
					tinsert(%possiblegenericinterrupt, { value, prio } )
				end
				if Stream:GetPosition() < value.StartTime then
					tinsert(%possiblegeneric, { value, prio })
				end
			end
		end)

    genericcleaner = function(_t)
        local maxp = { 0 }
        foreachi(_t, function(_i, _v) 
                %maxp[1] = max(_v[2], %maxp[1])
            end)
        local newm = {}
        foreachi(_t, function(_i, _v)
                if _v[2] == %maxp[1] then
                    tinsert(%newm, _v[1])
                end
            end)
        return newm
    end

    possiblegenericinterrupt = genericcleaner(possiblegenericinterrupt)
    possiblegeneric = genericcleaner(possiblegeneric)

	-- wenn eine interrupt transition angefordert wurde, dann suche nur dort
	if interrupt then
		if getn(possibleinterrupt) > 0 then
			retval = possibleinterrupt[random(getn(possibleinterrupt))]
		elseif getn(possiblegenericinterrupt) > 0 then
			retval = possiblegenericinterrupt[random(getn(possiblegenericinterrupt))]
		end
	-- es wurde eine normale transition angefordert
	else
		-- gibt es eine?
		if getn(possible) > 0 then
			retval = possible[random(getn(possible))]
		-- gibt es eine generische?
		elseif getn(possiblegeneric) > 0 then
			retval = possiblegeneric[random(getn(possiblegeneric))]
		-- versuche mal die interrupt fades
		elseif getn(possibleinterrupt) > 0 then
			retval = possibleinterrupt[random(getn(possibleinterrupt))]
		elseif getn(possiblegenericinterrupt) > 0 then
			retval = possiblegenericinterrupt[random(getn(possiblegenericinterrupt))]
		-- ansonsten haben wir halt keine
		else
			retval = nil
		end
	end

	return retval
end

-------------------------------------------------------------------------------
-- SndStreamPlayTransition
-- PURPOSE:
--	This functions plays a transition between two tracks
-------------------------------------------------------------------------------
function SndStreamPlayTransition(transition, current, next)
	local effect
	local i = 1
	local effecttype
	local action
	local s
	local From = Stream
	local nextname = StreamTracks[next].File
	local To = Snd:CreateStream("sound\\" .. nextname)
	local delay = 0
	local skipto = 0

	-- print("Playing transition ", transition.From, transition.To, transition.Interrupt)

	To:SetBaseVolume(StreamTracks[next].Volume)

	while i <= getn(transition.Effects) do
		effect = transition.Effects[i]
		effecttype = effect.Type

		if effecttype == "StartTo" then
			action = "Start"
			s = To
		elseif effecttype == "SetVolumeTo" then
			action = "SetVolume"
			s = To
		elseif effecttype == "FadeFrom" then
			action = "Fade"
			s = From
		elseif effecttype == "FadeTo" then
			action = "Fade"
			s = To
		else
			print("Illegal transition element type " .. effecttype .. "\n")
			action = nil
		end

		if action == "Start" then
			local starttime 

			-- springe erstmal an eine schöne anfangsposition
			if effect.Skip then
				if effect.Skip == "Random" then
					local r = random()
					local s = r * s:GetLength()
					skipto = s
				elseif type(effect.Skip) == "table" then
					local segment = effect.Skip[random(getn(effect.Skip))]
					if type(segment) == "Table" then
						skipto = segment[1] + random() * (segment[2] - segment[1])
					else
						skipto = segment
					end
				else
					skipto = effect.Skip
				end
				s:SetPosition(skipto)
			end

			-- bei normalen transitions ist die startzeit immer relativ zum beginn des aktuellen tracks
			if not transition.Interrupt then
				if effect.Start < Snd:GetTime() - StreamStart then
					-- print("Calling transition to late\n")
				end
				starttime = effect.Start - (Snd:GetTime() - StreamStart)
				-- print("Play", effect.Start, Snd:GetTime(), StreamStart)
			-- bei interrupt transitions jedoch immer zum aktuellen zeitpunkt
			else
				starttime = effect.Start
			end

			--print("Play starttime = ", starttime)
			Snd:Play(s, starttime)

			if s == To then
				delay = starttime
				StreamStart = Snd:GetTime() + starttime - skipto
				--print("delay = ", delay)
				--print("StreamStart = ", StreamStart)
			end

		elseif action == "Fade" then
			local stop = 0
			
			if s == From then
				stop = 1
			end

			if not transition.Interrupt then
				s:Fade(effect.Start, effect.Stop, effect.Volume, stop)
			else
				local skipoffset = s:GetPosition()
				if s == To then
					skipoffset = skipto
				end
				s:Fade(effect.Start + skipoffset, effect.Stop + skipoffset, effect.Volume, stop)
			end
		elseif action == "SetVolume" then
			s:SetVolume(effect.Volume)
		end

		i = i + 1
	end

	-- assign the playing stream
	Stream = To

	-- calc the time to look for the next track
	--print("Snd:GetTime = ", Snd:GetTime())
	--print("Stream:GetLength = ", Stream:GetLength())
	--print("delay = ", delay)
	--print("skipto = ", skipto)
	StreamNextTransition = Snd:GetTime() + Stream:GetLength() + delay - 15000 - skipto
	if StreamNextTransition < Snd:GetTime() + delay then
		StreamNextTransition = Snd:GetTime() + delay 
	end

	StreamLock = Snd:GetTime() + delay + 10000
	--print("StreamLock = ", StreamLock)
	--print("StreamNextTransition = ", StreamNextTransition)
end

-------------------------------------------------------------------------------
-- SndStreamTransition
-- PURPOSE:
--	This functions schedules the transition from the current playing track to
--	the next track. It looks up a suitable transition pattern and executes it.
--	Params: 
--		current:	index of the current track in the StreamTracks table
--		next:		index of the next track in the StreamTracks table
--		interrupt:	should the current track be stopped out before end (~= nil) or
--					should the current track play to its end before the next
--					track starts (== nil)
-------------------------------------------------------------------------------
function SndStreamTransition(current, next, interrupt)

	local currentname 
	local nextname

	if current ~= nil then
		currentname = StreamTracks[current].File
	end

	if next ~= nil then
		nextname = StreamTracks[next].File
	end

	-- debug log
	if currentname == nil then
		-- print("SndStreamTransistion from nothing to " .. nextname .. "\n")
	elseif nextname == nil then
		-- print("SndStreamTransistion from " .. currentname .. " to nothing\n")
	else
		-- print("SndStreamTransistion from " .. currentname .. " to " .. nextname .. "\n")
	end


	-- if the next track is empty then just let the current one terminate normally => no op
	if nextname == nil then

		-- set the next transition to be in 10 secs
		StreamNextTransition = Snd:GetTime() + 10000

	else
		-- if the currently no music is playing then simply start the next track
		if currentname == nil then
			Stream = Snd:CreateStream("sound\\" .. nextname)
			Stream:SetBaseVolume(StreamTracks[next].Volume)
			Snd:Play(Stream)

			StreamNextTransition = Snd:GetTime() + Stream:GetLength() - 15000
			if StreamNextTransition < Snd:GetTime() then
				StreamNextTransition = Snd:GetTime() 
			end
			StreamStart = Snd:GetTime()
			StreamLock = StreamStart + 1000
		else
			-- look for a transition entry (either current and next specified or only next specified)
			local transition = SndStreamFindTransition(current, next, interrupt)

			-- play this transition
			if transition ~= nil then
				SndStreamPlayTransition(transition, current, next)

			-- else just play the new stream when the old one is finished with a small pause between the tracks
			else
				local delay = 2000

				-- print("Playing default transition")

				-- calculate a delay between the two tracks
				if Stream ~= nil and Stream:IsPlaying() then
					delay = delay + Stream:GetLength() - Stream:GetPosition()
				end

				-- start the next track
				Stream = Snd:CreateStream("sound\\" .. nextname)
				Stream:SetBaseVolume(StreamTracks[next].Volume)
				Snd:Play(Stream, delay)
				StreamStart = Snd:GetTime() + delay
				StreamLock = StreamStart + 1000

				-- calc the time to look for the next track
				StreamNextTransition = Snd:GetTime() + Stream:GetLength() + delay - 15000
				if StreamNextTransition < Snd:GetTime() + delay then
					StreamNextTransition = Snd:GetTime() + delay 
				end
			end
		end
	end

	-- sets the global stream file name
	StreamTrack = next
end

