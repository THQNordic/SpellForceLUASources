-- this file defines the possible transitions between the tracks
-- the format is not yet finished so be aware of changes here

-- Format Description:
--
-- To add a transition between two tracks you call a special function (called SndAddTransition) with a lua 
-- table a parameter. The table describes all properties of the transition. Its fields:
--
--	From:					Filename of the track currently playing
--	To:						Filename of the track to play next
--	Interrupt(optional):	When not set, then the transition is only allowed to take place when the current track is about to 
--							end properly. If set the transition can be started anytime within the from track.
--	Effects:				List of transition effects to use for the transition. The effects field is a lua table, which consists of one or more
--							effect table entries
--
-- Format of an effect entry:
--	
--	An effect entry table has one common field (Type) and other type dependent fields. All possible effects are described here
--
--		Type = "StartTo"
--		Purpose: Start the track from the "To" field of the transition
--		Parameters:
--			Start:			Time to start this track relative to start of the previous track
--			Skip(optional):	Offset into the new track (play position). Time in milliseconds or the keyword "random" (with quotes!)
--							to jump to an arbitary position in the file
--                          NEW: when this value is a table like in 
--                                  Skip = { ms(2,0,0), ms(4,0,0) }
--                          then the new track will start at one of this positions choosen randomly.
--                          Entries at this Skip List can also be tables with begin/end pairs, so you can
--                          specify subranges at which the track starts randomly. Examples:
--                              Skip = { ms(2,0,0), ms(4,0,0) }
--                                  will let the track start either at exact two minutes or exact four minutes
--                          
--                              Skip = {{ ms(2,0,0), ms(4,0,0) }}
--                                  will let the track start at a random position between two and four minutes into the track
--
--                              Skip = { ms(1,0,0), { ms(2,0,0), ms(4,0,0) }, {ms(6,0,0),ms(8,0,0)}}
--                                  will let the track start either exact at one minute OR randomly between 2 and 4 minutes OR randomly between 6 and 8 minutes
--
--		Type = "SetVolumeTo"
--		Purpose: Sets the current volume of the To track
--		Parameters:
--			Volume:		Volume to set (between 0 and 1)
--
--		Type = "FadeFrom"
--		Purpose: Fades the "From" Track from the current volume to the selected one
--		Parameters:
--			Start:		Start time of this fade relative to the beginning of the From track
--			Stop:		Stop time of this fade relative to the beginning of the From track
--			Volume:		Volume to fade to (between 0 and 1)
--
--		Type = "FadeTo"
--		Purpose: Fades the "To" Track from the current volume to the selected one
--		Parameters:
--			Start:		Start time of this fade relative to the beginning of the To track
--			Stop:		Stop time of this fade relative to the beginning of the To track
--			Volume:		Volume to fade to (between 0 and 1)
--
--
--
-- Beware: all field names are case sensitive!
-- Beware: all timings are in milliseconds! So use the 'ms' helper function!

-- generic transitions

SndAddTransition{
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,300), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}

-- SF Add On 2

-- Track 1 Arena

SndAddTransition{
	From = "arena.mp3",
	To = "arena.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,54,800), Stop = ms(0,55,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,54,800), Skip = {ms(0,0,460)}}, 
		{ Type = "FadeTo", Start = ms(0,0,460), Stop = ms(0,0,560), Volume = 1 }
	}
}

-- Track 2 Army of Darkness

SndAddTransition{
	From = "army_of_darkness.mp3",
	To = "army_of_darkness.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(2,08,0), Stop = ms(2,09,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(2,09,0), Skip = {ms(0,0,0)}}, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,200), Volume = 1 }
	}
}

SndAddTransition{
	From = "army_of_darkness.mp3",
	To = "empyria.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,6,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,5,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "army_of_darkness.mp3",
	To = "arena.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,4,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,3,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "army_of_darkness.mp3",
	To = "call_of_the_dead.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,6,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,5,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "army_of_darkness.mp3",
	To = "plains_of_devastation.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,5,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,5,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}


SndAddTransition{
	From = "army_of_darkness.mp3",
	To = "plain_silence.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,5,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,5,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "army_of_darkness.mp3",
	To = "plains_of_myth.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,5,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,5,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "army_of_darkness.mp3",
	To = "plain_world.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,5,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,5,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "army_of_darkness.mp3",
	To = "plains_of_blackwater.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,5,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,5,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}



SndAddTransition{
	From = "army_of_darkness.mp3",
	To = "rune_master.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,3,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,3,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}


-- Track 3 Battle of the Undead

SndAddTransition{
	From = "battle_of_the_undead.mp3",
	To = "battle_of_the_undead.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,59,360), Stop = ms(2,0,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,59,360), Skip = {ms(0,0,500)}}, 
		{ Type = "FadeTo", Start = ms(0,0,500), Stop = ms(0,0,600), Volume = 1 }
	}
}

SndAddTransition{
	To = "battle_of_the_undead.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,250), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,18,0), ms(0,26,700), ms(0,51,200), ms(1,08,660), ms(1,26,140)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,250), Volume = 1 }
	}
}

-- Track 4 Bone Temple

SndAddTransition{
	From = "bone_temple.mp3",
	To = "bone_temple.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(2,30,800), Stop = ms(2,31,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(2,31,800), Skip = {ms(0,0,0)}}, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "bone_temple_whisper.mp3",
	To = "bone_temple.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(2,30,800), Stop = ms(2,31,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(2,31,800), Skip = {ms(0,0,0)}}, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	To = "bone_temple.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,250), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,22,200), ms(0,39,100), ms(1,00,400), ms(1,24,300), ms(2,03,900)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}

-- Track 5 Bone Temple Whisper

SndAddTransition{
	From = "bone_temple_whisper.mp3",
	To = "bone_temple_whisper.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(2,30,800), Stop = ms(2,31,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(2,31,800), Skip = {ms(0,0,0)}}, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	To = "bone_temple_whisper.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,250), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,22,200), ms(0,39,100), ms(1,00,400), ms(1,24,300), ms(2,03,900)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}

-- Track 6 City of Souls

SndAddTransition{
	From = "city_of_souls.mp3",
	To = "city_of_souls.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(2,58,0), Stop = ms(2,59,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(2,59,800), Skip = {ms(0,0,0)}}, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	To = "city_of_souls.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(1,10,920), ms(1,32,360), ms(2,15,740), ms(0,36,0), ms(1,10,0)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "city_of_souls.mp3",
	To = "plains_of_myth.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(2,58,0), Stop = ms(2,59,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(2,58,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,800), Volume = 1 }
	}
}

-- Track 7 Combat and Fight

SndAddTransition{
	From = "combat_and_fight.mp3",
	To = "combat_and_fight.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,38,920), Stop = ms(1,41,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,38,920), Skip = {ms(0,1,600)}}, 
		{ Type = "FadeTo", Start = ms(0,1,600), Stop = ms(0,1,700), Volume = 1 }
	}
}

SndAddTransition{
	To = "combat_and_fight.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,250), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,10,800), ms(0,38,100), ms(0,47,340), ms(0,56,600), ms(1,14,740)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,250), Volume = 1 }
	}
}

-- Track 8 Empyria

SndAddTransition{
	From = "empyria.mp3",
	To = "plain_silence.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,40,0), Stop = ms(1,41,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,41,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,200), Volume = 1 }
	}
}

SndAddTransition{
	From = "empyria.mp3",
	To = "plains_of_myth.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,40,0), Stop = ms(1,41,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,41,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,200), Volume = 1 }
	}
}

SndAddTransition{
	To = "empyria.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,250), Volume = 1 }
	}
}


-- Track 9 Plains of Blackwater

SndAddTransition{
	From = "plains_of_blackwater.mp3",
	To = "plains_of_blackwater.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(7,2,0), Stop = ms(7,3,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(7,3,500), Skip = {ms(0,0,0)}}, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	To = "plains_of_blackwater.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,0,0), ms(0,0,0), ms(1,37,800), ms(1,50,300), ms(2,21,900), ms(3,45,140), ms(4,01,180), ms(4,23,600), ms(5,07,600), ms(5,33,500)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,500), Volume = 1 }
	}
}

-- Track 10 Plains of Devastation

SndAddTransition{
	From = "plains_of_devastation.mp3",
	To = "plains_of_devastation.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(6,56,800), Stop = ms(6,57,600), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(6,57,500), Skip = {ms(0,0,200)}}, 
		{ Type = "FadeTo", Start = ms(0,0,200), Stop = ms(0,1,500), Volume = 1 }
	}
}

SndAddTransition{
	To = "plains_of_devastation.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,0,0), ms(0,0,0), ms(1,01,900), ms(1,31,080), ms(2,33,0), ms(2,55,0), ms(3,12,460), ms(4,48,470), ms(5,41,480)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,500), Volume = 1 }
	}
}



-- Track 11 Plains of Myth

SndAddTransition{
	From = "plains_of_myth.mp3",
	To = "plains_of_myth.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(7,0,0), Stop = ms(7,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(7,1,0), Skip = {ms(0,0,0)}}, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,500), Volume = 1 }
	}
}

SndAddTransition{
	To = "plains_of_myth.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,0,0), ms(0,0,0), ms(1,13,800), ms(1,46,300), ms(2,12,700), ms(2,43,080), ms(2,51,200), ms(3,54,280), ms(4,18,660), ms(5,59,0)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,500), Volume = 1 }
	}
}

-- Track 12 The Clockwork Crypts

SndAddTransition{
	From = "the_clockwork_crypts.mp3",
	To = "the_clockwork_crypts.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(2,36,200), Stop = ms(2,36,380), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(2,36,380), Skip = {ms(0,0,200)}}, 
		{ Type = "FadeTo", Start = ms(0,0,200), Stop = ms(0,0,300), Volume = 1 }
	}
}

SndAddTransition{
	To = "the_clockwork_crypts.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,48,0), ms(0,57,700), ms(1,28,200), ms(1,52,800)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}


-- Track 13 The Gorge


SndAddTransition{
	From = "the_gorge.mp3",
	To = "the_gorge.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(2,30,600), Stop = ms(2,30,700), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(2,30,600), Skip = {ms(0,0,200)}}, 
		{ Type = "FadeTo", Start = ms(0,0,200), Stop = ms(0,0,300), Volume = 1 }
	}
}

SndAddTransition{
	To = "the_gorge.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,28,200), ms(1,04,920), ms(1,30,800), ms(2,01,200)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}


-- Track 14 The Kathai

SndAddTransition{
	From = "the_kathai.mp3",
	To = "plains_of_myth.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,54,500), Stop = ms(1,56,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,55,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}

-- Track 15 Whisper



-- SF Add On 1

-- Track 1 Plain Mystified

SndAddTransition{
	To = "plain_mystified.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,0,0), ms(0,0,0), ms(0,28,470), ms(0,50,770), ms(1,46,590), ms(1,57,760), ms(2,53,720), ms(3,38,240), ms(4,22,870), ms(4,45,220), ms(5,59,820)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "plain_mystified.mp3",
	To = "plain_mystified.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(7,08,560), Stop = ms(7,09,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(7,08,560), Skip = {ms(0,0,300)}}, 
		{ Type = "FadeTo", Start = ms(0,0,300), Stop = ms(0,0,400), Volume = 1 }
	}
}

-- Track 2 Plain Enchanted

SndAddTransition{
	To = "plain_enchanted.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,0,0), ms(0,0,0), ms(1,09,520), ms(1,37,400), ms(2,14,230), ms(4,29,500), ms(5,19,200)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,2,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "plain_enchanted.mp3",
	To = "plain_enchanted.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(6,54,0), Stop = ms(6,56,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(6,54,0), Skip = {ms(0,0,040)}}, 
		{ Type = "FadeTo", Start = ms(0,0,040), Stop = ms(0,0,400), Volume = 1 }
	}
}

-- Track 3 Plain Darkened

SndAddTransition{
	To = "plain_darkened.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,0,0), ms(0,0,0), ms(0,38,680), ms(1,36,540), ms(2,11,0), ms(2,42,020), ms(4,04,520), ms(5,08,200), ms(5,38,600)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "plain_darkened.mp3",
	To = "plain_darkened.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(7,5,440), Stop = ms(7,6,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(7,5,440), Skip = {ms(0,0,120)}}, 
		{ Type = "FadeTo", Start = ms(0,0,120), Stop = ms(0,0,400), Volume = 1 }
	}
}

-- Track 4 Black Gate

SndAddTransition{
	To = "black_gate.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,16,270), ms(0,24,280), ms(0,32,260), ms(1,04,280), ms(1,16,290), ms(1,58,260)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "black_gate.mp3",
	To = "black_gate.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(3,02,400), Stop = ms(3,03,400), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(3,02,400), Skip = {ms(0,0,030)}}, 
		{ Type = "FadeTo", Start = ms(0,0,030), Stop = ms(0,0,400), Volume = 1 }
	}
}

-- Track 5 Despair

SndAddTransition{
	To = "despair.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,20,410), ms(0,56,420), ms(1,22,560), ms(2,06,0), ms(2,22,760)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "despair.mp3",
	To = "despair.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(3,08,0), Stop = ms(3,08,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(3,08,0), Skip = {ms(0,0,420)}}, 
		{ Type = "FadeTo", Start = ms(0,0,420), Stop = ms(0,1,400), Volume = 1 }
	}
}

-- Track 6 Dungeon Dimension

SndAddTransition{
	To = "dungeon_dimension.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,40,0), ms(0,54,0), ms(1,14,0), ms(1,50,870), ms(2,34,740)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "dungeon_dimension.mp3",
	To = "dungeon_dimension.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(3,0,880), Stop = ms(3,2,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(3,0,880), Skip = {ms(0,0,050)}}, 
		{ Type = "FadeTo", Start = ms(0,0,050), Stop = ms(0,1,0), Volume = 1 }
	}
}

-- Track 7 Doomsday

SndAddTransition{
	To = "doomsday.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,42,290), ms(0,49,940), ms(1,21,0), ms(1,36,0)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "doomsday.mp3",
	To = "doomsday.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(3,02,720), Stop = ms(3,03,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(3,02,720), Skip = {ms(0,0,600)}}, 
		{ Type = "FadeTo", Start = ms(0,0,600), Stop = ms(0,1,0), Volume = 1 }
	}
}

-- Track 8 Call of the Dead

SndAddTransition{
	To = "call_of_the_dead.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,500), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "call_of_the_dead.mp3",
	To = "plain_silence.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(2,11,0), Stop = ms(2,12,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(2,12,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,200), Volume = 1 }
	}
}

SndAddTransition{
	From = "call_of_the_dead.mp3",
	To = "city_of_souls.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(2,11,0), Stop = ms(2,12,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(2,12,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,200), Volume = 1 }
	}
}

SndAddTransition{
	From = "call_of_the_dead.mp3",
	To = "call_of_the_dead.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(2,11,0), Stop = ms(2,13,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(2,11,0), Skip = {ms(0,0,910)}}, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "call_of_the_dead.mp3",
	To = "plain_mystified.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,2,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,2,0), Volume = 1 }
	}
}

-- Track 9 Ice Elves

SndAddTransition{
	To = "ice_elves.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,200), Volume = 1 }
	}
}

SndAddTransition{
	From = "ice_elves.mp3",
	To = "ice_elves.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,07,940), Stop = ms(1,09,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,07,940), Skip = {ms(0,0,140)}}, 
		{ Type = "FadeTo", Start = ms(0,0,140), Stop = ms(0,0,500), Volume = 1 }
	}
}


SndAddTransition{
	From = "ice_elves.mp3",
	To = "plain_silence.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,07,940), Stop = ms(1,09,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,07,940), Skip = {ms(0,0,0)}}, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}


SndAddTransition{
	From = "ice_elves.mp3",
	To = "plain_world.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,06,0), Stop = ms(1,07,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,06,500), Skip = {ms(0,0,0)}}, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}

-- Track 10 Human Village

SndAddTransition{
	To = "human_village.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,200), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,200), Volume = 1 }
	}
}

SndAddTransition{
	From = "human_village.mp3",
	To = "human_village.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,01,220), Stop = ms(1,03,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,01,220), Skip = {ms(0,0,010)}}, 
		{ Type = "FadeTo", Start = ms(0,0,010), Stop = ms(0,0,300), Volume = 1 }
	}
}

-- Track 11 Rune Master

SndAddTransition{
	To = "rune_master.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,300), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,300), Volume = 1 }
	}
}

SndAddTransition{
	From = "rune_master.mp3",
	To = "rune_master.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,08,850), Stop = ms(1,10,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,08,850), Skip = {ms(0,0,240)}}, 
		{ Type = "FadeTo", Start = ms(0,0,240), Stop = ms(0,0,600), Volume = 1 }
	}
}

SndAddTransition{
	From = "rune_master.mp3",
	To = "plains_of_blackwater.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,07,0), Stop = ms(1,08,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,08,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "rune_master.mp3",
	To = "plain_darkened.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,07,0), Stop = ms(1,08,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,08,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}

-- Track 12 Elvensong Menu

SndAddTransition{
	To = "elvensong_menu.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,300), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,300), Volume = 1 }
	}
}

SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "elvensong_menu.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(2,57,880), Stop = ms(2,59,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(2,57,800), Skip = {ms(0,0,320)}}, 
		{ Type = "FadeTo", Start = ms(0,0,320), Stop = ms(0,0,700), Volume = 1 }
	}
}

SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "plain_silence.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,5,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,5,0), Volume = 1 }
	}
}



SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "plain_desertworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,6,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,5,500) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "entry_waterworld2.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,6,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,6,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "entry_desertworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,6,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,6,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "entry_mountainworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,6,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,6,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}


SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "entry_iceworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,6,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,6,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "entry_lavaworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,6,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,6,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "entry_swampworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,6,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,6,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "entry_waterworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,6,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,6,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "location_opener_silence.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,6,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,6,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "location_opener.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,6,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,6,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "entry_silence.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "ice_elves.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "black_gate.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "rune_master.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "plain_world.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "plain_waterworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "plain_waterworld2.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "plain_mountainworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "plain_swampworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 1 }
	}
}


SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "plain_iceworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "plain_enchanted.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "plain_mystified.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "elvensong_menu.mp3",
	To = "plain_darkened.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 1 }
	}
}


-- Track 13 Battle On

SndAddTransition{
	To = "battle_on.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,250), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,16,800), ms(0,25,100), ms(0,33,450), ms(0,58,500), ms(1,11,050)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,250), Volume = 1 }
	}
}

SndAddTransition{
	From = "battle_on.mp3",
	To = "battle_on.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,59,500), Stop = ms(2,0,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,59,500), Skip = {ms(0,0,100)}}, 
		{ Type = "FadeTo", Start = ms(0,0,100), Stop = ms(0,0,300), Volume = 1 }
	}
}


-- Track 14 Close Combat

SndAddTransition{
	To = "close_combat.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,250), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,10,300), ms(0,19,620), ms(0,28,900), ms(0,39,430), ms(0,57,480)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,250), Volume = 1 }
	}
}

SndAddTransition{
	From = "close_combat.mp3",
	To = "close_combat.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,13,800), Stop = ms(1,15,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,13,800), Skip = {ms(0,0,100)}}, 
		{ Type = "FadeTo", Start = ms(0,0,100), Stop = ms(0,0,300), Volume = 1 }
	}
}





-- SF THE ORDER OF DAWN

-- Track 1 Entry Waterworld

SndAddTransition{
	To = "entry_waterworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "entry_waterworld.mp3",
	To = "plain_waterworld.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,41,0), Stop = ms(1,43,200), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,42,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "entry_waterworld.mp3",
	To = "plain_enchanted.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,41,0), Stop = ms(1,43,200), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,42,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

-- Track 2 Entry Waterworld2

SndAddTransition{
	To = "entry_waterworld2.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "entry_waterworld2.mp3",
	To = "plain_waterworld2.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,19,0), Stop = ms(1,21,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,21,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "entry_waterworld2.mp3",
	To = "plains_of_blackwater.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,19,0), Stop = ms(1,21,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,21,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}


-- Track 3 Entry Iceworld

SndAddTransition{
	To = "entry_iceworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "entry_iceworld.mp3",
	To = "plain_mountainworld.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,42,500), Stop = ms(1,45,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,44,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,2,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "entry_iceworld.mp3",
	To = "plains_of_blackwater.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,42,500), Stop = ms(1,45,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,44,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,2,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "entry_iceworld.mp3",
	To = "plain_iceworld.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,42,500), Stop = ms(1,45,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,44,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,2,0), Volume = 1 }
	}
}

-- Track 4 Entry Desertworld

SndAddTransition{
	To = "entry_desertworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "entry_desertworld.mp3",
	To = "plain_desertworld.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,19,0), Stop = ms(1,20,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,19,500) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "entry_desertworld.mp3",
	To = "plains_of_devastation.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,19,0), Stop = ms(1,20,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,19,500) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "entry_desertworld.mp3",
	To = "plain_swampworld.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,17,0), Stop = ms(1,20,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,19,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}



-- Track 5 Entry Lavaworld

SndAddTransition{
	To = "entry_lavaworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "entry_lavaworld.mp3",
	To = "plain_lavaworld.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,58,0), Stop = ms(0,59,300), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,59,300) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
		
	}
}
	
-- Track 6 Entry Mountainworld

SndAddTransition{
	To = "entry_mountainworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "entry_mountainworld.mp3",
	To = "plain_swampworld.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,5,0), Stop = ms(1,8,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,7,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "entry_mountainworld.mp3",
	To = "the_gorge.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,5,0), Stop = ms(1,8,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,7,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "entry_mountainworld.mp3",
	To = "plain_desertworld.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,7,0), Stop = ms(1,9,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,8,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}


-- Track 7 Entry Swampworld

SndAddTransition{
	To = "entry_swampworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "entry_swampworld.mp3",
	To = "plain_swampworld.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,0,0), Stop = ms(1,02,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,01,500) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}


SndAddTransition{
	From = "entry_swampworld.mp3",
	To = "plain_lavaworld.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,0,0), Stop = ms(1,02,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,01,500) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}


-- Track 8 Plain Waterworld

SndAddTransition{
	To = "plain_waterworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,0,0), ms(0,0,0), ms(1,34,120), ms(2,55,450), ms(3,11,754), ms(3,44,251), ms(4,16,768), ms(4,41,350), ms(5,54,445), ms(6,43,353), ms(7,32,078)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}


SndAddTransition{
	From = "plain_waterworld.mp3",
	To = "plain_waterworld.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(9,27,300), Stop = ms(9,28,300), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(9,27,200), Skip = {ms(0,0,442)}}, 
		{ Type = "FadeTo", Start = ms(0,0,442), Stop = ms(0,0,542), Volume = 1 }
	}
}

-- Track 9 Plain Waterworld 2

SndAddTransition{
	To = "plain_waterworld2.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,0,0), ms(0,0,0), ms(0,53,748), ms(1,24,285), ms(2,05,686), ms(2,51,714), ms(3,22,920), ms(4,51,706), ms(6,42,070), ms(7,33,761)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "plain_waterworld2.mp3",
	To = "plain_swampworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,2,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,2,0), Volume = 1 }
	}
}



SndAddTransition{
	From = "plain_waterworld2.mp3",
	To = "plain_waterworld2.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(8,16,024), Stop = ms(8,16,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(8,16,024), Skip = {ms(0,0,450)}}, 
		{ Type = "FadeTo", Start = ms(0,0,450), Stop = ms(0,0,550), Volume = 1 }
	}
}

-- Track 10 Plain Iceworld

SndAddTransition{
	To = "plain_iceworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,0,0), ms(0,0,0), ms(0,47,210), ms(1,17,238), ms(2,09,771), ms(3,23,742), ms(5,02,009), ms(5,15,991), ms(6,23,511), ms(6,45,780)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "plain_iceworld.mp3",
	To = "plain_iceworld.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(8,30,200), Stop = ms(8,30,700), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(8,30,200), Skip = {ms(0,1,677)}}, 
		{ Type = "FadeTo", Start = ms(0,1,677), Stop = ms(0,1,977), Volume = 1 }
	}
}

-- Track 11 Plain Desertworld

SndAddTransition{
	To = "plain_desertworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,0,0), ms(0,0,0), ms(0,35,170), ms(1,32,398), ms(2,12,313), ms(2,35,149), ms(3,03,733), ms(4,34,349), ms(5,05,057), ms(5,46,032), ms(6,51,509)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "plain_desertworld.mp3",
	To = "plain_desertworld.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(8,29,323), Stop = ms(8,29,900), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(8,29,323), Skip = {ms(0,0,879)}}, 
		{ Type = "FadeTo", Start = ms(0,0,879), Stop = ms(0,1,179), Volume = 1 }
	}
}

-- Track 12 Plain Lavaworld

SndAddTransition{
	To = "plain_lavaworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,0,0), ms(0,0,0), ms(0,32,081), ms(1,33,920), ms(3,16,231), ms(4,23,337), ms(4,39,080), ms(5,59,117), ms(6,54,600)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "plain_lavaworld.mp3",
	To = "plain_lavaworld.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(8,12,100), Stop = ms(8,13,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(8,12,100), Skip = {ms(0,0,010)}}, 
		{ Type = "FadeTo", Start = ms(0,0,010), Stop = ms(0,0,300), Volume = 1 }
	}
}

-- Track 13 Plain Mountainworld

SndAddTransition{
	To = "plain_mountainworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,0,0), ms(0,0,0), ms(0,44,844), ms(1,17,917), ms(1,29,683), ms(3,51,054), ms(4,53,100), ms(6,01,395), ms(6,08,973)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "plain_mountainworld.mp3",
	To = "plain_mountainworld.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(8,35,512), Stop = ms(8,36,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(8,35,512), Skip = {ms(0,0,100)}}, 
		{ Type = "FadeTo", Start = ms(0,0,100), Stop = ms(0,0,300), Volume = 1 }
	}
}

SndAddTransition{
	From = "plain_mountainworld.mp3",
	To = "plain_iceworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,2,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,1,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,00), Stop = ms(0,1,0), Volume = 1 }
	}
}


-- Track 14 Plain Swampworld

SndAddTransition{
	To = "plain_swampworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,0,0), ms(0,0,0), ms(0,43,210), ms(2,37,349), ms(3,22,955), ms(4,00,638), ms(4,09,138), ms(4,51,380), ms(5,27,0), ms(5,57,511)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "plain_swampworld.mp3",
	To = "plain_swampworld.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(8,03,427), Stop = ms(8,04,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(8,03,427), Skip = {ms(0,1,800)}}, 
		{ Type = "FadeTo", Start = ms(0,1,800), Stop = ms(0,2,100), Volume = 1 }
	}
}

SndAddTransition{
	From = "plain_swampworld.mp3",
	To = "forbidden_zone.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,3,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,2,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,3,0), Volume = 1 }
	}
}


-- Track 15 Plain World

SndAddTransition{
	To = "plain_world.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,0,0), ms(0,0,0), ms(1,28,392), ms(1,54,274), ms(0,20,292), ms(2,39,774), ms(4,17,681), ms(4,41,981), ms(6,35,296), ms(7,0,976)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "plain_world.mp3",
	To = "plain_world.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(7,59,375), Stop = ms(8,0,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(7,59,375), Skip = {ms(0,1,090)}}, 
		{ Type = "FadeTo", Start = ms(0,1,090), Stop = ms(0,1,390), Volume = 1 }
	}
}


-- Track 16 Entry Silence

SndAddTransition{
	From = "entry_silence.mp3",
	To = "plain_iceworld.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,28,0), Stop = ms(0,29,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,28,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}


SndAddTransition{
	To = "entry_silence.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,2,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,2,0), Volume = 1 }
	}
}


-- Track 17 Night Silence

SndAddTransition{
	To = "night_silence.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,10,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,10,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "night_silence.mp3",
	To = "night_silence.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,29,900), Stop = ms(0,30,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,29,900) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,100), Volume = 1 }
	}
}

SndAddTransition{
	From = "night_silence.mp3",
	To = "plain_waterworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,2,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,1,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,5,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "night_silence.mp3",
	To = "plain_waterworld2.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,2,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,1,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,5,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "night_silence.mp3",
	To = "plain_mountainworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,2,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,1,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,5,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "night_silence.mp3",
	To = "plain_swampworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,2,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,1,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,5,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "night_silence.mp3",
	To = "plain_world.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,2,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,1,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,5,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "night_silence.mp3",
	To = "plain_desertworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,2,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,1,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,5,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "night_silence.mp3",
	To = "plain_iceworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,2,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,1,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,5,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "night_silence.mp3",
	To = "plain_lavaworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,2,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,1,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,5,0), Volume = 1 }
	}
}

-- Track 18 Plain Silence

SndAddTransition{
	To = "plain_silence.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}


SndAddTransition{
	From = "plain_silence.mp3",
	To = "plain_silence.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,29,999), Stop = ms(0,30,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,29,999) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,1), Volume = 1 }
	}
}

SndAddTransition{
	From = "plain_silence.mp3",
	To = "spellforce.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,100), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,100), Volume = 1 }
	}
}

SndAddTransition{
	From = "night_silence.mp3",
	To = "spellforce.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,100), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,100), Volume = 1 }
	}
}
	
-- Track 19 Location Opener Silence

SndAddTransition{
	To = "location_opener_silence.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "location_opener_silence.mp3",
	To = "location_opener_silence.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,29,999), Stop = ms(0,30,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,29,999) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,1), Volume = 1 }
	}
}

SndAddTransition{
	From = "location_opener_silence.mp3",
	To = "location_loop_silence.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,29,999), Stop = ms(0,30,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,29,999) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,1), Volume = 1 }
	}
}

-- Track 20 Location Loop Silence

SndAddTransition{
	To = "location_loop_silence.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,1,800) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,200), Volume = 1 }
	}
}

SndAddTransition{
	From = "location_loop_silence.mp3",
	To = "location_loop_silence.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,29,999), Stop = ms(0,30,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,29,999) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,1), Volume = 1 }
	}
}

-- Track 21 Combat 1


SndAddTransition{
	To = "combat_music1.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,1,0), ms(0,5,471), ms(0,23,248), ms(0,41,020), ms(0,58,320), ms(1,15,580), ms(1,32,860), ms(1,50,640), ms(2,08,420)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,100), Volume = 1 }
	}
}


SndAddTransition{
	From = "combat_music1.mp3",
	To = "combat_music1.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(2,56,0), Stop = ms(2,56,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(2,56,0) }, 
		{ Type = "FadeTo", Start = ms(0,1,030), Stop = ms(0,1,200), Volume = 1 }
	}
}


SndAddTransition{
	From = "combat_music1.mp3",
	To = "night_silence.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}


-- Track 22 Combat 2

SndAddTransition{
	To = "combat_music2.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,200), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,0,350), ms(0,24,160), ms(0,39,960), ms(0,55,780), ms(1,11,600), ms(1,27,417), ms(1,35,329), ms(1,43,233)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,200), Volume = 1 }
	}
}

SndAddTransition{
	From = "combat_music2.mp3",
	To = "combat_music2.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(2,01,100), Stop = ms(2,01,700), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(2,01,100) }, 
		{ Type = "FadeTo", Start = ms(0,0,350), Stop = ms(0,0,400), Volume = 1 }
	}
}

SndAddTransition{
	From = "combat_music2.mp3",
	To = "night_silence.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}

-- Track 23 Battle 1

SndAddTransition{
	To = "battle_music1.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,200), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,0,450), ms(0,9,260), ms(0,18,0), ms(0,35,500), ms(0,44,240), ms(1,01,750), ms(1,10,800), ms(1,15,200)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,200), Volume = 1 }
	}
}

SndAddTransition{
	From = "battle_music1.mp3",
	To = "battle_music1.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,37,650), Stop = ms(1,38,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,37,650) }, 
		{ Type = "FadeTo", Start = ms(0,0,450), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "battle_music1.mp3",
	To = "night_silence.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}

-- Track 24 Battle 2

SndAddTransition{
	To = "battle_music2.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,200), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,0,300), ms(0,10,900), ms(0,21,030), ms(0,36,200), ms(0,46,330), ms(1,06,0), ms(1,06,500), ms(1,26,750)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,200), Volume = 1 }
	}
}


SndAddTransition{
	From = "battle_music2.mp3",
	To = "battle_music2.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(2,12,800), Stop = ms(2,13,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(2,12,800) }, 
		{ Type = "FadeTo", Start = ms(0,0,300), Stop = ms(0,0,400), Volume = 1 }
	}
}

SndAddTransition{
	From = "battle_music2.mp3",
	To = "night_silence.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}

-- Track 25 Blade 

SndAddTransition{
	To = "blade_battle.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,200), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0), Skip = {ms(0,0,990), ms(0,12,130), ms(0,20,270), ms(0,38,292), ms(0,48,600), ms(1,09,150), ms(1,16,900), ms(1,30,600)}},
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,200), Volume = 1 }
	}
}

SndAddTransition{
	From = "battle_blade.mp3",
	To = "battle_blade.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,51,570), Stop = ms(1,52,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,51,570) }, 
		{ Type = "FadeTo", Start = ms(0,0,990), Stop = ms(0,1,050), Volume = 1 }
	}
}

SndAddTransition{
	From = "battle_blade.mp3",
	To = "night_silence.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}

-- Track 26 Death

SndAddTransition{
	To = "death_music.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,200), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,200), Volume = 1 }
	}
}

-- Track 27 Elves & Angels

SndAddTransition{
	To = "elves_and_angels.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,750), Volume = 1 }
	}
}

SndAddTransition{
	From = "elves_and_angels.mp3",
	To = "elves_and_angels.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(3,08,0), Stop = ms(3,09,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(3,08,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,200), Stop = ms(0,0,500), Volume = 1 }
	}
}

-- Track 28 Strategy & Gameplay

SndAddTransition{
	To = "strategy_and_gameplay.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "strategy_and_gameplay.mp3",
	To = "strategy_and_gameplay.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(2,06,500), Stop = ms(2,08,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(2,06,500) }, 
		{ Type = "FadeTo", Start = ms(0,0,900), Stop = ms(0,1,0), Volume = 1 }
	}
}

-- Track 29 Runewarrior

SndAddTransition{
	To = "runewarrior.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,2,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,1,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "runewarrior.mp3",
	To = "runewarrior.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,58,850), Stop = ms(1,59,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,58,850) }, 
		{ Type = "FadeTo", Start = ms(0,0,370), Stop = ms(0,0,400), Volume = 1 }
	}
}

SndAddTransition{
	From = "runewarrior.mp3",
	To = "the_clockwork_crypts.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,58,850), Stop = ms(1,59,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,58,850) }, 
		{ Type = "FadeTo", Start = ms(0,0,370), Stop = ms(0,0,400), Volume = 1 }
	}
}


-- Track 30 Kraga & Braga

SndAddTransition{
	To = "kraga_and_braga.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,500) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "kraga_and_braga.mp3",
	To = "kraga_and_braga.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(3,03,600), Stop = ms(3,04,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(3,03,600) }, 
		{ Type = "FadeTo", Start = ms(0,0,800), Stop = ms(0,0,900), Volume = 1 }
	}
}

-- Track 31 Order of Dawn

SndAddTransition{
	To = "order_of_dawn.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,500) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "order_of_dawn.mp3",
	To = "order_of_dawn.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,12,0), Stop = ms(1,13,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,12,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,320), Stop = ms(0,0,420), Volume = 1 }
	}
}

SndAddTransition{
	From = "order_of_dawn.mp3",
	To = "location_loop_silence.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,11,0), Stop = ms(1,11,750), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,11,749) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,10), Volume = 1 }
	}
}



-- Track 32 Sharrowdale

SndAddTransition{
	To = "sharrowdale.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "sharrowdale.mp3",
	To = "sharrowdale.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,36,380), Stop = ms(1,37,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,36,380) }, 
		{ Type = "FadeTo", Start = ms(0,0,630), Stop = ms(0,0,730), Volume = 1 }
	}
}

SndAddTransition{
	From = "sharrowdale.mp3",
	To = "location_loop_silence.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,34,380), Stop = ms(1,37,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,36,400) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,100), Volume = 1 }
	}
}

-- Track 33 Ogre Battle

SndAddTransition{
	To = "ogre_battle.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "ogre_battle.mp3",
	To = "ogre_battle.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,49,400), Stop = ms(1,50,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,49,400) }, 
		{ Type = "FadeTo", Start = ms(0,0,500), Stop = ms(0,0,600), Volume = 1 }
	}
}

-- Track 34 Forbidden Zone

SndAddTransition{
	To = "forbidden_zone.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "forbidden_zone.mp3",
	To = "forbidden_zone.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(2,23,600), Stop = ms(2,25,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(2,23,600) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,2,0), Volume = 1 }
	}
}
	
-- Track 35 Deadzone

SndAddTransition{
	To = "deadzone.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "deadzone.mp3",
	To = "deadzone.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(3,33,600), Stop = ms(3,34,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(3,33,600) }, 
		{ Type = "FadeTo", Start = ms(0,0,500), Stop = ms(0,1,0), Volume = 1 }
	}
}

-- Track 36 Battlefields

SndAddTransition{
	To = "battlefields.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "battlefields.mp3",
	To = "battlefields.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(3,04,600), Stop = ms(3,07,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(3,04,0) }, 
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,2,0), Volume = 1 }
	}
}

-- Track 37 Era of the Orcs

SndAddTransition{
	To = "era_of_the_orcs.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "era_of_the_orcs.mp3",
	To = "era_of_the_orcs.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(1,41,670), Stop = ms(1,42,200), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(1,41,670) }, 
		{ Type = "FadeTo", Start = ms(0,0,900), Stop = ms(0,1,0), Volume = 1 }
	}
}


-- Track 38 Celtic March

SndAddTransition{
	To = "celtic_march.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,1,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "celtic_march.mp3",
	To = "celtic_march.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(2,52,400), Stop = ms(2,53,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(2,52,400) }, 
		{ Type = "FadeTo", Start = ms(0,0,700), Stop = ms(0,0,800), Volume = 1 }
	}
}

SndAddTransition{
	From = "celtic_march.mp3",
	To = "plain_silence.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,2,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,2,0), Volume = 1 }
	}
}

-- Track 39 Spellforce

SndAddTransition{
	To = "spellforce.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,0,300), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,300), Volume = 1 }
	}
}

SndAddTransition{
	From = "spellforce.mp3",
	To = "spellforce.mp3",
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(3,55,000), Stop = ms(3,55,500), Volume = 0 }, -- Fade startet bei 3:55 des ersten Tracks und dauert 500 ms
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(3,54,500), Skip = {ms(1,55,800)}}, -- Startpunkt für neuen Track ist 3:54:500 im alten Track. Der neue wird ab 1:55:800 gespielt
		{ Type = "FadeTo", Start = ms(1,55,800), Stop = ms(1,56,0), Volume = 1 } -- Fadezeit des neuen Track beginnt bei 1:55:800 und dauert bis 1:56 also 200ms
	}
}


SndAddTransition{
	From = "spellforce.mp3",
	To = "plain_silence.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,5,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,5,0), Volume = 1 }
	}
}



SndAddTransition{
	From = "spellforce.mp3",
	To = "plain_desertworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,6,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,5,500) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "spellforce.mp3",
	To = "entry_waterworld2.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,6,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,6,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "spellforce.mp3",
	To = "entry_desertworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,6,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,6,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "spellforce.mp3",
	To = "entry_mountainworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,6,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,6,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}


SndAddTransition{
	From = "spellforce.mp3",
	To = "entry_iceworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,6,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,6,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "spellforce.mp3",
	To = "entry_lavaworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,6,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,6,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "spellforce.mp3",
	To = "entry_swampworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,6,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,6,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "spellforce.mp3",
	To = "location_opener_silence.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,6,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,6,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,0,500), Volume = 1 }
	}
}

SndAddTransition{
	From = "spellforce.mp3",
	To = "entry_silence.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "spellforce.mp3",
	To = "plain_world.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "spellforce.mp3",
	To = "plain_waterworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "spellforce.mp3",
	To = "plain_waterworld2.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "spellforce.mp3",
	To = "plain_mountainworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 1 }
	}
}

SndAddTransition{
	From = "spellforce.mp3",
	To = "plain_swampworld.mp3",
	Interrupt = 1,
	Effects = 
	{
		{ Type = "FadeFrom", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 0 },
		{ Type = "SetVolumeTo", Volume = 0 },
		{ Type = "StartTo", Start = ms(0,0,0) },
		{ Type = "FadeTo", Start = ms(0,0,0), Stop = ms(0,7,0), Volume = 1 }
	}
}



















