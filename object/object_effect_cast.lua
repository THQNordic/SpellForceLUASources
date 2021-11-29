gObjects = {}

function Runes(bOn)
	bNoRunes = (bOn == 0)
	ReloadEffects()
end

function RuneCircle(color)
	NewMovie()
	Scale{min=1}
	Rotation{range=6}
	Color{min=0, max=color, range=0.5, play=kDrwPlayClamped}
	local fadein1 = NewObject{decal=flics.runes, movie=pMovie}

	NewMovie()
	Scale{min=0.9}
	Rotation{max=-360, range=4, direction=-1}
	Color{min=0, max=color, range=0.5, play=kDrwPlayClamped}
	local fadein2 = NewObject{decal=flics.runessmall, movie=pMovie}


	NewMovie()
	Color{min=1, max=0, start=-0.5, range=0.5, dim=kDrwDimTimeToEnd, play=kDrwPlayClamped}

	return NewObject{subobject={fadein1, fadein2}, movie=pMovie}
end
----------------------------------------------------------------------- cast white
function CastWhite(params)
	local lTime = 1

	local particles=33
	local time=1
	NewMovie(particles)
	Translation{max={0,0,-4}, dim=kDrwDimParticle, path=kDrwPathRandom}
	Translation{min={0,0,5}}
	Burst{particles=particles, radius1=0.4, radius2=0.4, height=5}
	Scale{min=0.0, max=0.1, range=time/1.5, trail=1, play=kDrwPlayBounce, path=kDrwPathCosine}
	Color{min={1,1,1,0}, max={1,1,1,0.5}, trail=1, range=time/2.4, play=kDrwPlayBounce, path=kDrwPathCosine}
	local flitter = NewObject{billboard=flics.star6point, movie=pMovie}

	-- godfinger1
	NewMovie(1)
	Scale{min={0.5,0.5,5}}
	Rotation{range=8}
	Color{min={1,1,1,0}, max={1,1,1,0.1}, range=0.5, play=kDrwPlayClamped, path=kDrwPathCosine}
	local god1 = NewObject{mesh=flics.cylinder_stripes, movie=pMovie}

	-- godfinger2
	NewMovie(1)
	Scale{min={0.6,0.6,5}}
	Rotation{direction=-1, range=10}
	Color{min={1,1,1,0}, max={1,1,1,0.1}, range=0.5, play=kDrwPlayClamped, path=kDrwPathCosine}
	local god2 = NewObject{mesh=flics.cylinder_stripes, movie=pMovie}

	NewMovie()
	Scale{min=0.9, max=1.1, dim=kDrwDimRandom}
	Scale{min=2}
	FadeScale{path=kDrwPathLinear, fadein=1, fadeout=0}
	local decal = NewObject{decal=flics.star_halo, movie=pMovie}

	if (bNoRunes == nil) then decal = RuneCircle{0.4,0.4,1,1} end

	BodyGlow{time=0.2, size2=3.5, particles=4, radius2=0.2, color1={0.7,0.7,1,0.4}, color2={0.5,0.5,1,0}}
	Scale{min=0.1}
	FadeScale{path=kDrwPathLinear, fadein=0.2, fadeout=0}
	local left = NewObject{billboard=flics.star6point, movie=pMovie, bone=kDrwBoneLeftPalm}
	local right = NewObject{billboard=flics.star6point, movie=pMovie, bone=kDrwBoneRightPalm}

	NewMovie()
	FadeScale{fadein=1, fadeout=0, path=kDrwPathLinear}
	LightMovie{movie=pMovie, offset={0,0,0.5}, size=1.3, deviation=0.1, color={0.3, 0.3, 1, 0.2}}
	local radiosity = Radiosity{movie=pMovie, bone=kDrwBoneHead, restriction=kDrwCsBone + kDrwCsWorld}

	-- now bind together
	NewObject{subobject={decal, flitter, god1, god2, left, right, radiosity}}
end

CastWhite{}
EffectSave("CastWhiteSilent")

----------------------------------------------------------------------- cast mental
function CastMental(params)
	local lTime = 1

	--Concentric rings
	NewMovie(5)
	Scale{min=0, max=1.5, range=1,trail=2}
	Color{min={1,1,0,0.4}, max={0,0.5,1,0}, range=1, trail=2}
	Scale{min=0, max=1, range=0.2, play=kDrwPlayClamped}
	local rings = NewObject{billboard=flics.ring, movie=pMovie, bone=kDrwBoneCrown}

	LightMovie{offset={0,0,0}, size=1.5, deviation=1, color={0, 0.2, 0, 0.4}, flicker=0.1}
	local radiosity = Radiosity{movie=pMovie, bone=kDrwBoneHead, restriction=kDrwCsBone}

	local decal
	if (bNoRunes == nil) then decal = RuneCircle{0,1,0.5,1} end

	NewObject{subobject={decal, rings, radiosity}}
end

CastMental{}
EffectSave("CastMentalSilent")
--------------------------------------------------------------- cast ice
Smoke{trail=-1, time=2, particles=22, offset={0,0,-0.2}, growth=1, velocity={0.5,0.2,2}, gravity={-1,0,-4}, color1={0.15,0.3,0.5,0}, color2={0.15,0.3,0.5,0.8}}
Scale{min=0.1, max=1, path=kDrwPathParabola, trail=-1, range=2}
Scale{min=0, max=1, play=kDrwPlayClamped, trail=-1, range=1}
GlobalTrail{buffer=1, range=1, trail=-1}
local smoke = NewObject{billboard=flics.circle, movie=pMovie}
------------------------------------------ for addon
local hand = NewObject{billboard=flics.circle, movie=pMovie, bone=kDrwBoneLeftHand}
------------------------------------------ end for addon
local smoke = NewObject{subobject=AttachToBones{object=smoke, bones={kDrwBoneRightHand, kDrwBoneLeftHand}}}

Smoke{time=2, particles=11, growth=0, velocity={2,0,0}, color1={0.15,0.3,0.5,0.0}, color2={0.15, 0.3,0.5,0.3}}
Scale{min=4}
Scale{min=0, max=1, start=1.5, play=kDrwPlayClamped, range=3}
local ground = NewObject{decal=flics.circle, movie=pMovie}

Cloud{size=2, time=2.5, particles=5, color1={0.6,0.6,1,0.4}, color2={0.6,0.6,1,0}, offset={0.5,0.5,1}, velocity={0,0,0}}
Rotation{axis="x"}
Clamp{range=2.5}
local cloud= NewObject{billboard=flics.circle, movie=pMovie}

LightMovie{offset={0,0.5,0}, size=1, deviation=0.1, color={0, 0.2, 0.7, 0.5}}
FadeScale{fadein=1, path=kDrwPathLinear}
local radiosity = Radiosity{movie=pMovie, bone=kDrwBoneMain, restriction=kDrwCsBone}

local decal=nil
if (bNoRunes == nil) then decal = RuneCircle{0,0.5,1,1} end

NewMovie()
Scale{min=1.05}
NewObject{subobject={decal, ground, smoke, radiosity}, movie=pMovie}
EffectSave("CastIceSilent")

------------------------------------------ for addon
local icehand = NewObject{subobject={ground, hand, radiosity}} 
------------------------------------------ end for addon

------------------------------------------ flashes from ground
function GroundFlash(params)
	local time= (params.time or 0.1)
	local flashcolor=(params.flashcolor or {0.5,0.8,1,1})	
	local groundcolor=(params.groundcolor or flashcolor)	
	local glowcolor=(params.glowcolor or flashcolor)	

	local lightning = Lightning{range=time,flic=flics.simplelightning, mode=params.mode}
	NewMovie()
	Scale{min={-0.5, -0.5, -1.5}}
	Color{min=flashcolor, max={flashcolor[1], flashcolor[2], flashcolor[3], -12}, range=1, path=kDrwPathParabola}
	local flash = NewObject{subobject=lightning, movie=pMovie}

	local time=(params.time or flashes/5)		
	NewMovie(1)
	Color{min=groundcolor, max={groundcolor[1], groundcolor[2], groundcolor[3], -12}, range=1, path=kDrwPathParabola}
	Scale{min=0.4, max=1, dim=kDrwDimRandom, path=kDrwPathParabola}
	local ground = NewObject{decal=flics.circle, movie=pMovie}

	NewMovie(1)
	Color{min=glowcolor, max={glowcolor[1], glowcolor[2], glowcolor[3], -12}, range=1, path=kDrwPathParabola}
	Scale{min={0.3,0.3,0.3}}
	local glow = NewObject{billboard=flics.circle, movie=pMovie}

	return NewObject{subobject={ground, glow, flash}}
end
--------------------------------------------------------------- new black magic cast
local params = {time=0.1, flashcolor={0.8,0.5,0.2,1}, mode=0}
local lObjects = 
{
	NewObject{subobject={GroundFlash(params)}, bone=kDrwBoneRightPalm},
	NewObject{subobject={GroundFlash(params)}, bone=kDrwBoneLeftPalm},
}

--NewMovie()
--Translation{min = {0,0.6,0}}
--Scale{min=1.5, max=2, range=0.1, play=kDrwPlayBounce}
--Scale{min=0.9, max=1.1, dim=kDrwDimRandom}
--Color{min={1,0,0,0.2}}
--local radiosity = Radiosity{movie=pMovie, bone=kDrwBoneMain, restriction=kDrwCsBone}
 
LightMovie{offset={0,0.6,0}, size=1.25, deviation=0.25, color={1,0,0,0.2}}
local radiosity = Radiosity{movie=pMovie, bone=kDrwBoneMain, restriction=kDrwCsBone}

local decal=nil
if (bNoRunes == nil) then decal = RuneCircle{1,0,1,1} end

NewObject{subobject={decal, lObjects[1], lObjects[2], radiosity}}

EffectSave("CastBlackSilent")


---------------------------------------	element cast fire
Cloud{time=2, particles=22, color1={1,0.5,0.0,1}, color2={0.3,0,0.0,0}, offset={0.6,0,1}, velocity={0,0,1}}
Rotation{axis="x"}
Scale{min=1.5}
Clamp{range=2}
local cloud= NewObject{billboard=flics.smoke, movie=pMovie}

Fire{buffer=0.4, particles=9, size=1, size1=0.9, size2=0.2, height=1, top=0, width=0.1, ground=0, color1={1,0.8,0,0.7}, color2={1,0.2,0,0.4}, path=kDrwPathParabola}
Scale{min=0, max=1, start=0.0, range=0.2, play=kDrwPlayClamped}
Scale{min=1}
local fire= NewObject{billboard=flics.smoke, movie=pMovie}
local lObjects = AttachToBones{object=fire, bones={kDrwBoneRightPalm, kDrwBoneLeftPalm}}
local fires=NewObject{subobject=lObjects}

if (bNoRunes == nil) then decal = RuneCircle{1,0.2,0,1} end

NewObject{subobject={decal, fires, radiosity}}
EffectSave("CastFireSilent")

------------------------------------------ for addon
local hand = NewObject{subobject=fire, bone=kDrwBoneRightHand}
local CastElemental = NewObject{subobject={icehand, decal, hand}} 
EffectSave("CastElementalSilent")
------------------------------------------ end for addon

---------------------------------------	element cast air
local whirl = Whirlwind{startcolor={0.2,0.5,0.8,0.6}, stopcolor={0.2,0.5,0.8,0.0}}
NewMovie()
Scale{min=0, max=1, start=0.6, range=1, play=kDrwPlayClamped}
Scale{min=0.5}
local whirlwind = NewObject{subobject=whirl, movie=pMovie, bone=kDrwBoneChest}

Cloud{time=2, particles=22, color1={0.6,0.8,1.0,0.5}, color2={0.6,0.8,1.0,0}, offset={0.3,0,1}, velocity={0,0,1}}
Rotation{axis="x"}
Clamp{range=2}
local cloud= NewObject{billboard=flics.fog, movie=pMovie}

NewMovie()
Scale{min={0,0,0}, max={3,3,3}, play=kDrwPlayClamped, range=1}
Scale{min=0.9, max=1.1, dim=kDrwDimRandom}
Color{min= {0.1,0.3,1,0.2}}
local decal = NewObject{decal=flics.star_halo, movie=pMovie}

if (bNoRunes == nil) then decal = RuneCircle{0.5,0.5,1,1} end

NewMovie()
FadeScale{fadein=1, fadeout=0, path=kDrwPathLinear}
LightMovie{movie=pMovie, offset={0,0.5,0}, size=1.5, deviation=0.1, color={0, 0.8, 1, 0.4}, flicker=0.5}
local radiosity = Radiosity{movie=pMovie, bone=kDrwBoneChest, restriction=kDrwCsBone}

NewObject{subobject={decal, whirlwind, radiosity}}
EffectSave("CastAirSilent")

----------------------------------------------------------- earth cast
local whirlwind = Whirlwind{startsize=0.1, stopsize=1, flic=flics.smoke, particles=3, time=0.3, tilt=0, layers=5, radius=1, height=2, startcolor={0.8,0.6,0.4,1}, stopcolor={0.9,0.3,0.2,0}}
NewMovie()
Scale{min=-1}
local suckup1 = NewObject{subobject=whirlwind, movie=pMovie, bone=kDrwBoneRightHand}
local suckup2 = NewObject{subobject=whirlwind, movie=pMovie, bone=kDrwBoneLeftHand}
EffectSave()

NewMovie()
local decal = NewObject{decal=flics.explo, movie=pMovie}
local billboard = NewObject{billboard=flics.smoke, movie=pMovie}
local mix = NewObject{subobject={billboard, decal}}

Smoke{figurescale=0.6, random = 1, color2 = {0.6,0.4,0.1,0.8}, color1 = {0.3,0.2,0.1,0.2}, particles=11, time=1, offset={1.5,0,0}, velocity={-2.5,0,0}, gravity={1,0,3}, growth=1}
local floor = NewObject{subobject=mix, movie=pMovie}
EffectSave()

NewObject{subobject={suckup1, suckup2, floor}}
EffectSave("CastEarth1")

--Smoke{random = 0, color2 = {0.6,0.4,0.1,0.8}, color1 = {0.3,0.2,0.1,0.2}, particles=11, time=1, offset={1,0,0}, velocity={-2,0,0}, gravity={1,0,3}, growth=1}
--Scale{min=0.5}
--local floor = NewObject{subobject=mix, movie=pMovie}
--EffectSave()

NewMovie()
FadeScale{fadein=1, fadeout=0, path=kDrwPathLinear}
LightMovie{movie=pMovie, offset={0,0,0}, size=1.5, deviation=0.1, color={0.6, 0.4, 0, 0.2}, flicker=2}
local radiosity = Radiosity{movie=pMovie, bone=kDrwBoneRoot, restriction=kDrwCsBone}

local decal = nil
if (bNoRunes == nil) then decal = RuneCircle{0.6,0.4,0,1} end

NewObject{subobject={decal, suckup1, suckup2, floor, radiosity}}
EffectSave("CastEarthSilent")



local radius = 1
NewMovie(10)
Rotation{dim=kDrwDimParticle, path=kDrwPathRandom}
Translation{min={radius,0,0}, max={0,0,0}, path=kDrwPathNegParabola, trail=1}
FigureScale(10)
Translation{max={0,0,0.5}, path=kDrwPathParabola, trail=1}
Scale{min=0.3, max=0.1, trail=1}
Color{min={0.8,0.6,0.4,0.5}, max={0.8,0.6,0.4,0.8}, trail=1}

local suck = NewObject{billboard=flics.smoke, movie=pMovie}

NewMovie()
local suckup1 = NewObject{subobject=suck, movie=pMovie, bone=kDrwBoneRightHand, restriction=kDrwCsFloor}
local suckup2 = NewObject{subobject=suck, movie=pMovie, bone=kDrwBoneLeftHand, restriction=kDrwCsFloor}

NewMovie(5)
Translation{max={0,1,0}, trail=1}
FigureScale(10)
--Translation{max={0,0,-1}, trail=1}
--Translation{max={0,0,1}, trail=1, path=kDrwPathNegParabola}
Scale{min=0.1, max=0.05, trail=1}
Color{max={0.8,0.6,0.4,1}, min={0.8,0.6,0.4,0.6}, trail=1}
local tohand1 = NewObject{billboard=flics.smoke, movie=pMovie, bonesource=kDrwBoneRightShoulder, bone=kDrwBoneRightHand, restriction=kDrwCsSpan}
local tohand2 = NewObject{billboard=flics.smoke, movie=pMovie, bonesource=kDrwBoneLeftShoulder, bone=kDrwBoneLeftHand, restriction=kDrwCsSpan}


NewObject{subobject={suckup1, suckup2, radiosity}}

EffectSave("CastEarthSilent")
