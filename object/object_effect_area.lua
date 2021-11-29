------------------------------------------------------------- stone rain
NewMovie()
Choose{dim=kDrwDimParticle, path=kDrwPathRandom}
Translation{min={5,0,15}, max={0,0,0}, range=2.1, play=kDrwPlayClamped}
Rotation{axis="z", dim=kDrwDimParticle, path=kDrwPathRandom}
Rotation{axis="x", dim=kDrwDimParticle, path=kDrwPathRandom}
Rotation{}
Color{min={0,0,0,0}, max={1,1,1,1}, range=0.5, play=kDrwPlayClamped}
local stone = NewObject{mesh=flics.stones, movie=pMovie}

NewMovie()
Translation{min={5,0,15}, max={0,0,0}, range=2.1, play=kDrwPlayClamped}
Scale{min=0.5, max=1, range=2.2}
Color{min={0,0,0,0}, max={0,0,0,1}, range=2, play=kDrwPlayClamped}
local decal = NewObject{decal=flics.circledark, movie=pMovie}

NewObject{subobject={decal,stone}}
EffectSave("StoneFall")
---------------------
Cloud{time=1, offset={0.4,0,0}, velocity={0.5,0,2}, color1={0.5,0.4,0.3,0.6}, color2={1,1,1,0}}
Clamp{range=1}
local cloud = NewObject{billboard=flics.fog, movie=pMovie, rotate=1}

local particles=7
NewMovie(particles)
Translation{min={0,0,0.2}}
Throw{time=time, particles=particles, velocity={0,0,6},  gravity={0,0,-4.5}, trail=0}
Burst{particles=particles, time=time,  radius1=0.2, radius2=1.7, trail=0}
Color{min={1,1,1,1}, max={0.4,0.1,0.2,0},range=time, path=kDrwPathParabola, play=kDrwPlayClamped}
Scale{min=0.3}
Choose{dim=kDrwDimParticle}
local burst = NewObject{mesh=flics.stones, movie=pMovie, rotate=1}

NewMovie()
Color{min={0,0,0,0.5}, max={0,0,0,0}, range=1, play=kDrwPlayClamped}
Scale{max=2, range=1}
local shadow = NewObject{decal=flics.circledark, movie=pMovie}

NewObject{subobject={burst, cloud, shadow}}
EffectSave("StoneHit")
------------------------------------------------------------- blizzard
local particles, range=11,1

Smoke{particles=particles, color1={0.6,0.8,1,0}, color2={0.6,0.8,1,0.7}, offset={0,0,0}, velocity={0.8,0,0}, gravity={-0.8,0,8}, growth=0.2}
Scale{min=1.5}
local iceflame = NewObject{billboard=flics.circle, movie=pMovie, rotate=1}

NewMovie()
Color{min={0.5,0.8,1,0.2}}
Scale{min=0.6}
local stone = NewObject{mesh=flics.icerocks[4], movie=pMovie, rotate=1}

NewMovie()
Translation{min={10,0,30}, max={0,0,-1}, range=2.1, play=kDrwPlayClamped}
--Translation{min={0,0,3}}
Rotation{axis="y", min=15, max=15, direction=0}
Scale{min=0, max=1, range=0.2, play=kDrwPlayClamped}
local fallout = NewObject{subobject={iceflame, stone}, movie=pMovie}
EffectSave()

NewMovie()
Translation{min={10,0,30}, max={0,0,-1}, range=2.1, play=kDrwPlayClamped}
Scale{min=0.5, max=1, range=2.2}
Color{min={0,0,0,0}, max={0,0,0,0.4}, range=2, play=kDrwPlayClamped}
local decal = NewObject{decal=flics.circledark, movie=pMovie}

NewMovie()
Rotation{min=90, direction=0}
NewObject{subobject={decal,fallout}, movie=pMovie}
EffectSave("BlizzardFall")
---------------------
Cloud{particles=22, time=1, offset={0.4,0,0}, velocity={1,0,2}, color1={0.6,0.8,1,1}, color2={1,1,1,0}, radius2={2,0,0}}
Scale{min=3}
local cloud = NewObject{billboard=flics.ice, movie=pMovie, rotate=1}

NewMovie()
Color{min={0.6,0.8,1,1}, max={0,0.3,0.5,0}, range=1, path=kDrwPathParabola, play=kDrwPlayClamped}
Scale{min=4}
local floor = NewObject{decal=flics.circle, movie=pMovie, rotate=1}

particles=11
NewMovie(particles)
Translation{min={0,0,0.2}}
Throw{time=time, particles=particles, velocity={0,0,2},  gravity={0,0,-1.5}, trail=0}
Burst{particles=particles, time=time,  radius1=0.2, radius2=3.7, trail=0}
Color{min={0.3,0.5,1,1}, max={0,0,1,0}, range=1, path=kDrwPathParabola, play=kDrwPlayClamped}
Scale{min=0.1}
Choose{dim=kDrwDimParticle}
local burst = NewObject{mesh=flics.icerocks, movie=pMovie, rotate=1}

NewMovie()
Clamp{range=1}
NewObject{subobject={burst, cloud, floor}, movie=pMovie}
EffectSave("BlizzardHit")
------------------------------------------------------------- Rain of fire
local particles, range=17,1

Smoke{particles=particles, color1={1,0.4,0.1,0}, color2={1,0.4,0.0,0.8}, offset={0,0,0}, velocity={0.8,0,0}, gravity={-0.8,0,8}, growth=0.3}
Scale{min=1.2}
local flame = NewObject{billboard=flics.smoke, movie=pMovie, rotate=1}
EffectSave()

NewMovie()
Color{min={1,0.5,0,0.9}}
Scale{min=1.3}
local stone = NewObject{mesh=flics.stones[1], movie=pMovie, rotate=1}

NewMovie()
Translation{min={10,0,30}, max={0,0,-1}, range=2.15, play=kDrwPlayClamped}
--Translation{min={0,0,3}}
Rotation{axis="y", min=15, max=15, direction=0}
Scale{min=0, max=1, range=0.2, play=kDrwPlayClamped}
local fallout = NewObject{subobject={flame}, movie=pMovie}

NewMovie()
Translation{min={10,0,30}, max={0,0,-1}, range=2.1, play=kDrwPlayClamped}
Scale{min=1.5, max=2, range=2.2}
Color{min={1,0,0,0}, max={1,0,0,0.4}, range=2, play=kDrwPlayClamped}
local decal = NewObject{decal=flics.circle, movie=pMovie}

NewObject{subobject={decal,fallout}}
EffectSave("FireFall")
---------------------------------------------------------------------------
--Smoke{particles=22, color1={1,0.4,0.1,0}, color2={1,0.4,0.0,0.6}, offset={1,0,0}, velocity={3,0,0}, gravity={0,0,5}, growth=0.2}
--Smoke{particles=11, time=1, offset={0.4,0,0}, velocity={1,0,2}, color1={0.6,0.8,1,1}, color2={1,1,1,0}, radius2={2,0,0}}
Cloud{particles=5,time=0.5, offset={0.4,0,0}, velocity={1.5,0,2}, color1={0.8,0.6,0.2,0.3}, color2={0,0,0,0}, size=2}
Scale{min=3}
Clamp{range=0.5}
local cloud = NewObject{billboard=flics.solar, movie=pMovie}
EffectSave()

NewMovie()
Color{min={1,1,0.5,0.3}, max={0.5,0,0,0}, range=1, path=kDrwPathParabola, play=kDrwPlayClamped}
Scale{min=4}
local floor = NewObject{decal=flics.circle, movie=pMovie, rotate=1}
--EffectSave()

particles=22
NewMovie(particles)
Translation{min={0,0,0.2}}
Throw{time=time, particles=particles, velocity={0,0,1.5},  gravity={0,0,-2.5}, trail=0}
Burst{particles=particles, time=time,  radius1=2.2, radius2=3.7, trail=0}
Color{min={1,0.5,0.2,1}, max={0,0,0,0}, range=1, path=kDrwPathParabola, play=kDrwPlayClamped}
Scale{min=0.5}
local burst = NewObject{billboard=flics.solar, movie=pMovie, rotate=1}

------------------------------------------------------- bouncing burst
particles=22
range = 1
gObjects={}
for particle = 1,particles do
	local start=  - particle * range/particles
	Bounce{start=start, particles=1, velocity={0,0,0}, height=1, bounce=4, trail=-1}
	Scale{min=0.8, max=0, range=0.01, start = start+1, play=kDrwPlayClamped}
	gObjects[particle] = NewObject{billboard=flics.solar, movie=pMovie, restriction=kDrwCsFloor}
end

NewMovie(particles)
Choose{dim=kDrwDimParticle}
Rotation{dim=kDrwDimParticle, path=kDrwPathRandom}
Translation{min={0.2,0,0}, max={4,0,0}, trail=0.5}
Color{min={1,0.5,0.2,1}, max={0,0,0,0}, range=1, path=kDrwPathParabola, play=kDrwPlayClamped}
--Translation{max={3,0,0}, range=1, path=kDrwPathNegParabola, dim=kDrwDimTimeScaled}
local burst = NewObject{subobject=gObjects, movie=pMovie, restriction=kDrwCsWorld}
EffectSave("FireBounce")
-----------------------------------------------------

Cloud{time=1, offset={0.4,0,0}, velocity={0.5,0,2}, color1={0,0,0,0.3}, color2={0,0,0,0}}
Scale{min=0, max=0.8, range=0.3, start = 0.3, play=kDrwPlayClamped}
Clamp{range=1}
local cloud2 = NewObject{billboard=flics.fog, movie=pMovie, rotate=1}
EffectSave("FireCloud")

NewMovie()
Clamp{range=1}
NewObject{subobject={cloud2, burst, cloud, floor}, movie=pMovie}
EffectSave("FireHit")
---------------------------------------------------------------- area test

function AreaHitOld(params)
	local colorrim		= params.colorrim or {1,1,1,1}
	local colormesh		= params.colormesh or 1
	local colorlight	= params.colorlight or {1,1,1,1}

	local size			= params.size or 2			-- rim particle size
	local grow			= params.grow or 2			-- rim particle grow
	local particles		= params.particles or 35	-- number of rim particles

	local billboard		= params.billboard or flics.sparks
	local mesh			= params.mesh or flics.iceshield[1]
	
	NewMovie()
	Translation{min={0,0,size}}
	Rotation{min=-90, axis="x", direction=0}
	Scale{min=size}
	local floorparticles = NewObject{billboard=billboard, movie=pMovie, restriction=kDrwCsFloor}

	NewMovie(particles)
	Rotation{dim=kDrwDimParticle}
	Rotation{range=0.5, path=kDrwPathParabola}
	Translation{min={15,0,0}, max={0,0,0}, range=1.5, play=kDrwPlayClamped, trail=0.2}
	Scale{min=1, max=grow, range=1.5, path=kDrwPathParabola}
	Clamp{range=1.5}
	Color{min=colorrim, max=0, range=1.3, play=kDrwPlayClamped, path=kDrwPathParabola}
	local rim = NewObject{subobject=floorparticles, movie=pMovie}

	NewMovie(1)
	Rotation{range=1}
	Translation{min={0,0,size}}
	Scale{min={15,15,size}}  --, max={0,0,5}, play=kDrwPlayClamped, path=kDrwPathParabola}
	Color{min=colormesh, max=0, range=1.5, play=kDrwPlayClamped}--, path=kDrwPathNegParabola}
	local shield = NewObject{mesh=mesh, movie=pMovie}
	
	NewMovie()
	Color{min=colorlight, max={0,0,0,0}, range=2, play=kDrwPlayClamped}
	local light = NewLight(pMovie, {Att1 = 0, Att2 = 20})

	NewObject{subobject={rim}, light=light}
end

--AreaHit{colorrim=0.02, size=1, grow=0.5}
--EffectSave("AreaHit")


NewMovie(211)
Translation{min={0,0,1}}
Choose{dim=kDrwDimParticle}
Rotation{dim=kDrwDimParticle, path=kDrwPathRandom}
Rotation{}
Translation{max={2,0,0}, dim=kDrwDimParticle}
Translation{max={10,0,0}, range=2}
Translation{min={0,0,0}, max={-2,0,0}, range=2, path=kDrwPathParabola}
Scale{min=0.5}
Color{min={1,1,1,0.5}, max={1,1,1,0}, range=2, path=kDrwPathParabola}
NewObject{subobject=mix, movie=pMovie}
EffectSave("AreaEffect")


------------------------------------------------------------- new fog
NewMovie()
Translation{min={0,0,0.8}}
local terrainfog = NewObject{billboard=flics.explo, movie=pMovie, restriction=kDrwCsFloor}

function Fog(params)
	local color1 = params.color1 or {1,1,1,0}
	local color2 = params.color2 or {1,1,1,0.3}
	local fade   = params.fade or 1
	local decal  = params.decal or flics.circle
	local particles = params.particles or 66
	local size   = params.size or 15

	Smoke{color1=color1, color2=color2, particles=particles, offset={0,0,0}, velocity={size,0,0}, gravity={-1,0,0}, time=10}
	Scale{min=size/5}
	--if (fade==1) then FadeScale{path=kDrwPathLinear, fadein=0.5, fadeout=0.5} end
	local fog = NewObject{subobject=%terrainfog, movie=pMovie, boundingradius=15}

	NewMovie()
	Scale{min=size * 18/15}
	Color{min=color2}
	local decal = NewObject{decal=decal, movie=pMovie}

	NewMovie()
	if (fade==1) then FadeScale{path=kDrwPathLinear, fadein=0.5, fadeout=0.5} end
	return NewObject{subobject={decal, fog}, boundingradius=size, movie=pMovie}
end




local fog = Fog{fade=0}
EffectSave("FogForever")

NewMovie()
FadeScale{path=kDrwPathLinear, fadein=0.5, fadeout=0.5}
NewObject{subobject=fog, movie=pMovie, boundingradius=15}
EffectSave("Fog")
------------------------------------------------------------- dark might
Fog{color1={0.5,0.5,0.5,0}, color2={0,0,0,0.4}, decal=flics.circledark}
EffectSave("DarkMight")
------------------------------------------------------------- acidcloud
Fog{color1={0,1,0.5,0}, color2={0,1,0.3,0.6}, particles=11, size=5}
EffectSave("AcidCloud")
------------------------------------------------------------- minifog
Fog{fade=0, particles=11, size=3}
EffectSave("MiniFog")
------------------------------------------------------------- AreaHit Tests
NewMovie(5)
Translation{min={0,0,5}, max={0,0,1}, range=1, trail=-1}
Rotation{axis="x", min=-90, max=-90, direction=0}
Color{min={0.8,0.3,0,0}, max=1, range=0.75, play=kDrwPlayBounce, trail=-1}
Scale{min=15, max=0, range=1, play=kDrwPlayClamped, trail=-1}
--Clamp{range=1.5}
NewObject{mesh=flics.fadeout, movie=pMovie}
EffectSave("AreaHit1")
------------------------------------------------------------- 
Smoke{color1={1,1,0.5,0}, color2={1,1,0.3,0.2}, particles=33, offset={0,0,0.5}, velocity={15,0,0}, gravity={-1,0,0}, time=1}
Scale{min=3}
Clamp{fadein=0.5, fadeout=0.5}
NewObject{decal=flics.particles01, billboard=flics.particles01, movie=pMovie}
EffectSave("AreaHit2")

------------------------------------------------------------- 
NewMovie(5)
--Rotation{axis="x", dim=kDrwDimParticle}
Scale{min={15,15,15}}--, max=15, dim=kDrwDimParticle}
--Color{min=0.2}--, max=0.2, range=1, play=kDrwPlayClamped, trail=-1}
Scale{min=1, max=0, range=0.5, trail=-1, play=kDrwPlayClamped, path=kDrwPathParabola}
Rotation{range=0.1}
NewObject{mesh=flics.sphereparticle, movie=pMovie}
EffectSave("AreaHit3")

------------------------------------------------------------- 
NewMovie(2)
--Rotation{range=0.01}
Scale{min={0,0,5},  max={15,15,5}, dim=kDrwDimParticle}
Color{min=0.2, max=0, start=0.2, range=0.5, play=kDrwPlayClamped, trail=-1}
Scale{min=1, max=0, play=kDrwPlayClamped, trail=-1}
NewObject{mesh=flics.fireshield[1], movie=pMovie}
EffectSave("AreaHit4")

------------------------------------------------------------- 
NewMovie(3)
Scale{min=15}--, dim=kDrwDimParticle}
Rotation{axis="x", dim=kDrwDimParticle}
Rotation{range=10}
Color{min=1, max=0, start=0.5, range=0.5, play=kDrwPlayClamped}
local areahit5 = NewObject{mesh=flics.sphereparticle, movie=pMovie}

NewMovie()
Scale{min={1,1,0.5}}
NewObject{subobject=areahit5, movie=pMovie}
EffectSave("AreaHit5")


------------------------------------------------------------- Actual Area Hit
function AreaHit(params)
	-- particle parameters
	local color1	=	params.color1 or {1,0,0,1}
	local color2	=	params.color2 or {1,1,1,1}
	local ratio		=	params.ratio or 0.5
	local flic1		=	params.flic1 or flics.circle
	local flic2		=	params.flic2 or flic1

	-- light parameter
	local light1	= params.light1 or {1,1,1,1}
	local light2	= params.light2 or {0,0,0,0}


	local combine = CombineParticles{ratio=ratio, color1=color1, color2=color2, flic1=flic1, flic2=flic2}

	NewMovie()
	Translation{min={0,0,1}}
	Color{min=light1, max=light2, range=1.5, dim=kDrwDimParabola, play=kDrwPlayClamped}
	Scale{min=1, max=0, range=2, play=kDrwPlayClamped, path=kDrwPathLinear}
	local light = NewLight(pMovie, {Att1 = 0, Att2 = 15})

	NewMovie()
	Translation{min={0,0,1}}
	local particle = NewObject{movie=pMovie, restriction=kDrwCsFloor, subobject=combine}

	NewMovie(90)
	Clamp{mode="parabola"}
	Rotation{dim=kDrwDimParticle, path=kDrwPathRandom}
	Translation{min={-15,0,0}}
	Translation{max={10,0,0}, path=kDrwPathParabola, trail=1}
	Color{max=0, trail=1}

	local blast = NewObject{subobject=particle, movie=pMovie}

	NewMovie()
	Color{min=1, max=0, start=0.5, range=0.3, dim=kDrwDimTimeScaled, play=kDrwPlayClamped}
	return NewObject{subobject=blast, light=light, movie=pMovie, boundingradius=15}
end

AreaHit{color1=0.4, color2=1, ratio=0.4}
EffectSave("AreaHit")

AreaHit{color1={1,1,1,0.3}, color2={0.8,0.8,1,1}, ratio=0.5, flic2=flics.star6point, light2={0.5,0.5,1,0}}
EffectSave("AreaHitWhite")

AreaHit{color1={1,0,1,0.3}, color2={1,1,0,1}, ratio=0.2, light1={1,0,1,1}}
EffectSave("AreaHitBlack")

AreaHit{color1={1,0,0,0.3}, color2={1,0.5,0,1}, ratio=0.3, light1={1,0.5,0,1}, light2={1,0,0,0}}
EffectSave("AreaHitFire")

AreaHit{color1={0,0,1,0.2}, color2={0.8,0.8,1,1}, ratio=0.45, flic2=flics.star_halo, light1={0.5,0.8,1,1}, light2={0,0,1,0}}
EffectSave("AreaHitIce")

AreaHit{color1={0.5,0.3,0,0.6}, color2={0.6,0.4,0,0.8}, ratio=0.45, light1={1,1,0,1}, light2={0,0,0,0}}
EffectSave("AreaHitEarth")

AreaHit{color1={0,1,0.5,0.4}, color2={1,0,0,1}, ratio=0.25, flic2=flics.ring, light1={0.5,0.8,1,1}, light2={0,0,1,0}}
EffectSave("AreaHitMental")
----------------------------------------------------------------------- illuminate
Fire{particles=11, size=1, size1=1, size2=0, height=-1.2, top=0.1, width=0.1, ground=0.3, time=1, color1={1,0.8,0.6,0.5}}
gObjects[1] = NewObject{billboard=flics.solar, movie=pMovie}

NewMovie(1)
Translation{min={0,0,4.2}}
gObjects[3] = NewObject{subobject=gObjects[1], movie=pMovie}


gParams={particles=20, radius=0.5, height=4, trail=6}
NewMovie(gParams.particles)
Rotation{range=3}
Rotation{axis="z", range=2.5}
Translation{min={0,0,4}}
Sphere(gParams)
Color{min={1,1,0.5,1}} --, max={0,0,0,0}, play=kDrwPlayClamped, range=1, start=3}-- -1, dim=kDrwDimTimeToEnd}
Scale{min={0.1,0.1,0.1}}
--Scale{max={1,1,1}, min={0,0,0}, play=kDrwPlayClamped, range=1}
gObjects[2] = NewObject{billboard=flics.flare, movie=pMovie}

NewMovie()
FadeScale{path=kDrwPathLinear}
NewObject{subobject={gObjects[3], gObjects[2]}, movie=pMovie, light=lights.highrotateyellow, boundingradius=15}
EffectSave("Illuminate")


-------------------------------------------------------- Addon2
------------------------------------ occlude
Fire{particles=55, spintime=1000, noplopp=1, size1=2, size2=0, height=4.5, top=0.5, width=0.8, ground=0.5, time=30, color1={0.4,0.4,0.4,1}, color2={1,1,1,0}}
--Smoke{particles=10, color1={0,0,0,1}, color2=0, offset={0,0,0}, velocity={0.8,0,2.6}, gravity={0,0,-0.6}, growth=0.2}
local occlude = NewObject{billboard=flics.circledark, movie=pMovie, restriction=kDrwCsWorld}

NewMovie()
Translation{min={0,0,0.7}}
Scale{min=2}
FadeScale{fadein=0.5, fadeout=0, path=kDrwPathLinear}
Color{min=1, max=0, range=1, start=-1, dim=kDrwDimTimeToEnd}
TargetColor{max=0, path=Path{{0,0},{0.1,1},{0.9,1},{0.99,0}}, play=kDrwPlayClamped, dim=kDrwDimTimeScaled}
local occludeBlack = NewObject{subobject=occlude, movie=pMovie}
EffectSave("OccludeBlack")

NewMovie()
Scale{min=3.5}
NewObject{subobject=occludeBlack, movie=pMovie, boundingradius=20}
EffectSave("OccludeBlackBig")

Fire{particles=55, spintime=10, noplopp=1, size1=3, size2=0, height=4.5, top=1, width=0.5, ground=0.5, time=3, color1={0.5,0.5,0.3,1}}
--Smoke{particles=10, color1={0,0,0,1}, color2=0, offset={0,0,0}, velocity={0.8,0,2.6}, gravity={0,0,-0.6}, growth=0.2}
local occlude = NewObject{billboard=flics.star_halo, movie=pMovie, restriction=kDrwCsWorld}

NewMovie()
--FigureScale(3)
Translation{min={0,0,0.7}}
FadeScale{fadein=0.5, fadeout=0, path=kDrwPathLinear}
Color{min=1, max=0, range=1, start=-1, dim=kDrwDimTimeToEnd}
TargetColor{max=0, path=Path{{0,0},{0.1,1},{0.9,1},{0.99,0}}, play=kDrwPlayClamped, dim=kDrwDimTimeScaled}
local occludeWhite = NewObject{subobject=occlude, decal=flics.circle, movie=pMovie}
EffectSave("OccludeWhite")

NewMovie()
Scale{min=3.5}
NewObject{subobject=occludeWhite, movie=pMovie, boundingradius=20}
EffectSave("OccludeWhiteBig")
