gObjects = {}

----------------------------------------------------------------------- cast white resolve
function CastWhiteResolve(params)
	local lTime = 1

	-- sparks
	NewMovie(params.particles)
	Translation{min={0,0,3}, max={0,0,2}, dim = kDrwDimTimeScaled, play=kDrwPlayClamped, path=kDrwPathCosine}
	Rotation{dim=kDrwDimParticle}
	Translation{min={3,0,0}, max={4,0,0}, dim = kDrwDimTimeScaled}
	local color = params.flarecolor
	Color{max={color[1], color[2], color[3],0}, min={color[1], color[2], color[3], color[4]}, dim=kDrwDimTimeScaled, play=kDrwPlayClamped}
	Scale{min={0.5,0.5,0.5}}
	Choose{trail=0.1}
	gObjects[1] = NewObject{billboard=(params.flic or flics.flare), movie=pMovie}

	-- godfinger 
	NewMovie(1)
	Scale{min={0.2,0.2,1000}}
	Color{min={1,1,1,0.3}, max={1,1,1,0}, dim=kDrwDimTimeScaled, path=kDrwPathCosine, play=kDrwPlayClamped}
	gObjects[2] = NewObject{mesh=flics.cylinder_stripes, movie=pMovie}

	-- now bind together
	NewMovie()
	----Sound("spell_resolve_white")
	NewObject{subobject={gObjects[2]}, movie=pMovie, light=lights.midrotatewhite}
end

----------------------------------------------------------------------- cast black
function CastBlack(params)
	local lTime = 1

	-- beam cage from ground (not used)
	NewMovie(5)
	Rotation{dim=kDrwDimParticle}
	--Rotation{range=0.4}
	Translation{min={-1.5,0,0}}
	Rotation{axis="y", min=105, max=105, direction=0}--0, direction=1, range=lTime, play=kDrwPlayClamped, start=-lTime, dim=kDrwDimTimeToEnd}
	Rotation{axis="x", min=90, max=90, direction=0}

	Scale{min={0,0,0}, max={5,0.8,0.8}, range=0.2, play=kDrwPlayClamped, range=lTime, play=kDrwPlayClamped, start= -lTime -0.5, dim=kDrwDimTimeToEnd, trail=1/5}
	local color = params.color
	Color{min={color[1], color[2], color[3],0.5}}--, max={color[1], color[2], color[3],0}, range=lTime, play=kDrwPlayClamped, path=kDrwPathCosine, start= -lTime, dim=kDrwDimTimeToEnd}
	gObjects[1] = NewObject{mesh=(params.flic or flics.beampointy2), movie=pMovie}
	
	-- smoke
	local lParticles=params.particles
	local lDuration=1
	local lTrail=lDuration/lParticles
	NewMovie(lParticles)
	Rotation{dim=kDrwDimParticle, path=kDrwPathRandom}
	Translation{min={0,0,-1}, max={0,0,3}, range=lDuration, trail=lTrail}
	Translation{min={1,0,0}, max={2,0,0}, range=lDuration, trail=lTrail, path=kDrwPathCosine}
	Color{min={0,0,0,1}, max={0,0,0,0.1}, range=lDuration, trail=lTrail, path=kDrwPathParabola}
	Scale{min={0,0,0}, max={1.5,1.5,1.5}, range=2, play=kDrwPlayClamped}
	gObjects[2] = NewObject{billboard=flics.circledark, movie = pMovie}

	NewMovie()
	----Sound("spell_cast_black")
	NewObject{subobject={gObjects[2]}, movie=pMovie, light=lights.midrotatered}
end



----------------------------------------------------------------------- cast white resolve
function CastWhiteResolve(params)
	local lTime = 1

	-- sparks
	NewMovie(params.particles)
	Translation{min={0,0,3}, max={0,0,2}, dim = kDrwDimTimeScaled, play=kDrwPlayClamped, path=kDrwPathCosine}
	Rotation{dim=kDrwDimParticle}
	Translation{min={3,0,0}, max={4,0,0}, dim = kDrwDimTimeScaled}
	local color = params.flarecolor
	Color{max={color[1], color[2], color[3],0}, min={color[1], color[2], color[3], color[4]}, dim=kDrwDimTimeScaled, play=kDrwPlayClamped}
	Scale{min={0.5,0.5,0.5}}
	Choose{trail=0.1}
	gObjects[1] = NewObject{billboard=(params.flic or flics.flare), movie=pMovie}

	-- godfinger
	NewMovie(1)
	Scale{min={0.2,0.2,1000}}
	Color{min={1,1,1,0.3}, max={1,1,1,0}, dim=kDrwDimTimeScaled, path=kDrwPathCosine, play=kDrwPlayClamped}
	gObjects[2] = NewObject{mesh=flics.cylinder_stripes, movie=pMovie}

	-- now bind together
	NewMovie()
	--Sound("spell_resolve_white")
	NewObject{subobject={gObjects[2]}, movie=pMovie, light=lights.midrotatewhite}
end

CastWhiteResolve{flic=flics.sparks, particles = 20, flarecolor = {1,1,1,1}, ringcolor={1,1,1,1}}
EffectSave("WhiteResolveOld")


----------------------------------------------------------------------- cast black
function CastBlack(params)
	local lTime = 1

	-- beam cage from ground (not used)
	NewMovie(5)
	Rotation{dim=kDrwDimParticle}
	--Rotation{range=0.4}
	Translation{min={-1.5,0,0}}
	Rotation{axis="y", min=105, max=105, direction=0}--0, direction=1, range=lTime, play=kDrwPlayClamped, start=-lTime, dim=kDrwDimTimeToEnd}
	Rotation{axis="x", min=90, max=90, direction=0}

	Scale{min={0,0,0}, max={5,0.8,0.8}, range=0.2, play=kDrwPlayClamped, range=lTime, play=kDrwPlayClamped, start= -lTime -0.5, dim=kDrwDimTimeToEnd, trail=1/5}
	local color = params.color
	Color{min={color[1], color[2], color[3],0.5}}--, max={color[1], color[2], color[3],0}, range=lTime, play=kDrwPlayClamped, path=kDrwPathCosine, start= -lTime, dim=kDrwDimTimeToEnd}
	gObjects[1] = NewObject{mesh=(params.flic or flics.beampointy2), movie=pMovie}
	
	-- smoke
	local lParticles=params.particles
	local lDuration=1
	local lTrail=lDuration/lParticles
	NewMovie(lParticles)
	Rotation{dim=kDrwDimParticle, path=kDrwPathRandom}
	Translation{min={0,0,-1}, max={0,0,3}, range=lDuration, trail=lTrail}
	Translation{min={1,0,0}, max={2,0,0}, range=lDuration, trail=lTrail, path=kDrwPathCosine}
	Color{min={0,0,0,1}, max={0,0,0,0.1}, range=lDuration, trail=lTrail, path=kDrwPathParabola}
	Scale{min={0,0,0}, max={1.5,1.5,1.5}, range=2, play=kDrwPlayClamped}
	--Scale{min={1,1,1}, max={0,0,0}, range=lTime, start=-lTime, dim=kDrwDimTimeToEnd, play=kDrwPlayClamped}
	gObjects[2] = NewObject{billboard=flics.circledark, movie = pMovie}

	NewMovie()
	--Sound("spell_cast_black")
	NewObject{subobject={gObjects[2]}, movie=pMovie, light=lights.midrotatered}
end

CastBlack{particles = 1, color = {0.4,0,0.3,0.7}}
EffectSave("BlackCastOld")
----------------------------------------------------------------------- cure poison
NewMovie(40)
Tube{}
Color{min={1,1,1,0}, max={0.5,1,0.5,1}, range=0.5, dim=kDrwDimTimeScaled, play=kDrwPlayBounce, path=kDrwPathCosine}

--Sound("spell_hit_healing")
NewObject{billboard=flics.flare, movie=pMovie}


----------------------------------------------------------------------- freeze (blue figure)
function Freeze(type)
	NewMovie()
	Scale{min={0.7,0.7,1}}
	if (type=="Dot") then
		Color{min={0.0,0.2,1,0}, max={0.0,0.2,1,1}, dim=kDrwDimTimeScaled, range=0.5, play=kDrwPlayBounce, path=kDrwPathCosine}
	else
		Color{min={0.0,0.2,1,0}} --, max={0.0,0.2,1,1}, start=0.5, range=2, play=kDrwPlayClamped}
	end
	gObjects[1] = NewObject{mesh=flics.iceblock, movie=pMovie}

	gParams = {particles=31, range=10}
	gParams.trail = 1 

	NewMovie(gParams.particles)
	Rotation{dim=kDrwDimParticle, path=kDrwPathRandom}
	Translation{min={0,0,3}, max={0,0,0}, range=gParams.range, dim=kDrwDimTimeAbsolute, trail=gParams.trail}
	Translation{min={0.2,0,0}, max={1.5,0,0}, range=gParams.range, dim=kDrwDimTimeAbsolute, trail=gParams.trail, path=kDrwPathParabola}
	if (type=="Dot") then
		Color{min={0.3,0.6,1,0}, max={0.3,0.6,1,0.3}, dim=kDrwDimTimeScaled, range=0.5, play=kDrwPlayBounce, path=kDrwPathCosine}
	else
		Color{min={0.3,0.6,1,0}, max={0.3,0.6,1,0.3}, range=0.5, play=kDrwPlayClamped, path=kDrwPathCosine}
	end
	Scale{min={0.2,0.2,0.2}, max={1,1,1}, range=gParams.range, dim=kDrwDimTimeAbsolute, trail=gParams.trail, path=kDrwPathParabola}
	gObjects[2]= NewObject{billboard=flics.circle, movie=pMovie}

	return {gObjects[1], gObjects[2]}	
end

gObjects = Freeze("Dot")
NewMovie()
NewObject{subobject=gObjects, movie=pMovie}

gObjects = Freeze("Hit")
NewMovie()
--Sound("spell_hit_freeze")
EffectSave("FreezeOld")
NewObject{subobject=gObjects, movie=pMovie}
----------------------------------------------------------------------- fireshield & iceshield
function Shield(params)
	NewMovie(1)
	--Color{min={0.3,0.3,1,0}, max={0.3,0.3,1,0.2}, range=0.5, dim=kDrwDimTimeScaled, play=kDrwPlayBounce}-- path=kDrwPathParabola, play=kDrwPlayClamped, 
	Color{min={1,1,1,0.3}, max={1,1,1,1}, range=0.5, dim=kDrwDimTimeScaled, play=kDrwPlayBounce} -- path=kDrwPathParabola, play=kDrwPlayClamped, 
	Translation{min={0,0,1}}
	Scale{min={params.radius, params.radius, params.radius}}
	Rotation{axis="z", dim=kDrwDimParticle}
	Rotation{range=2.3, dim=kDrwDimTimeAbsolute}
	Rotation{axis="y", range=4, trail=0.5, dim=kDrwDimTimeAbsolute}
	Choose{0.2}
	gObjects[1] = NewObject{mesh=params.mesh, movie=pMovie}

	gParams={particles=30, radius=params.radius, trail=0.3}
	NewMovie(gParams.particles)
	Translation{min={0,0,1}}
	local color=params.color
	Color{min={color[1],color[2],color[3],0}, max={color[1],color[2],color[3],color[4]}, range=0.5, dim=kDrwDimTimeScaled, play=kDrwPlayBounce}-- path=kDrwPathParabola, play=kDrwPlayClamped, 
	Rotation{range=3}
	Rotation{axis="z", range=2.5}
	Sphere(gParams)
	--Color{min={1,1,1,1}, max={0,0,0,0}, play=kDrwPlayClamped, range=1, start=-1, dim=kDrwDimTimeToEnd}
	Scale{min={0.1,0.1,0.1}}
	gObjects[2] = NewObject{billboard=params.billboard, movie=pMovie}

	return{gObjects[1], gObjects[2]}
end

gObjects = Shield{radius=1.3, mesh=flics.fireshield, billboard=flics.solar, color={1,1,1,0.5}}
NewMovie()
--Sound("spell_dot_fireshield")
NewObject{subobject=gObjects, movie=pMovie}
EffectSave("FireShieldOld")

gObjects = Shield{radius=1.3, mesh=flics.iceshield4, billboard=flics.spark, color={0.4,0.4,1,0.6}}
NewMovie()
--Sound("spell_dot_iceshield")
NewObject{subobject=gObjects, movie=pMovie}
EffectSave("IceShieldOld")
----------------------------------------------------------------------- decay
NewMovie(5)
Rotation{dim=kDrwDimParticle}
Translation{min={0.3,0,3}, max={0.5,0,3}, dim=kDrwDimParticle, path=kDrwPathRandom}

Translation{min={0,0,0}, max={0,0,-5}, range=1, path=kDrwPathParabola, trail=0.05, dim=kDrwDimTimeAbsolute}
Color{min={1,1,1,1}}
Scale{min={0.1,0.1,0.1}}

NewMovie(7)
Rotation{dim=kDrwDimParticle}
Translation{min={0.3,0,0.3}, max={0.3,0,1.7}, dim=kDrwDimParticle, path=kDrwPathRandom}
Choose{range=1, play=kDrwPlayClamped, trail=0.1}
Color{min={1,1,0.5,0.5}}

--Sound("spell_hit_decay")
NewObject{billboard=flics.explosion, movie=pMovie}

----------------------------------------------------------------------- black hits
function BlackHit(params)
	-- bats
	gParams.particles = (params.bats or 10)
	gParams.range = 1
	gParams.trail = 1
	NewMovie(gParams.particles)
	Translation{min={0,0,3}, max={0,0,0}, play=kDrwPlayClamped}
	Translation{min={0,0,-0.5}, max={0,0,0.2}, dim=kDrwDimParticle, path=kDrwPathRandom}
	Rotation{}
	Burst{radius1=0.1, radius2=0.1}
	Translation{min={4,0,0}, max={0.5,0,0}, play=kDrwPlayClamped}
	Color{max={0,0,0,0.1}, min={0,0,0,0.8}, start=-1, play=kDrwPlayClamped, dim=kDrwDimTimeToEnd}
	Scale{max={0.4,0.4,0.4}, min={0,0,0}, play=kDrwPlayClamped, range=1}
	Choose{range=0.2, trail=0.01}
	gObjects[3] = NewObject{billboard=flics.bat, movie = pMovie}


	NewMovie()
	----Sound(params.sound or "spell_hit_black")
	NewObject{subobject={gObjects[3]}, movie=pMovie, bone=kDrwBoneMain}
end

BlackHit{clouds=15, objects=6, color={0.5,1,0.5,1}, sound="spell_hit_pain"}
BlackHit{clouds=20, objects=10, color={1,0.3,0.3,1}, sound="spell_hit_death"}
BlackHit{clouds=25, objects=14, color={1,1,1,1}, sound="spell_hit_lifetap"}
EffectSave("BlackHitOld")

BlackHit{clouds=10, objects=4, color={0,1,0.5,1}}

------------------------------------------------------------------sparks

local sparks = Sparks{bursts=4, sparks=11, radius=0.2, inner=0, outer=0.2, lifetime=0.7, size=0.1, colorend={0.6,0,0,0.1}} --, flic=flics.flash, size=0.4,colorstart={0.5,0.5,1,1},colorend={0,0,0.6,1}, lifetime=0.5, outer=0.2, radius=0.1}
local lObjects = AttachToBones{object=sparks, bones={kDrwBoneRightFoot, kDrwBoneLeftFoot, kDrwBoneRightKnee, kDrwBoneLeftKnee, kDrwBoneRightShoulder, kDrwBoneLeftShoulder, kDrwBoneRightPalm, kDrwBoneLeftPalm, kDrwBoneRightEllbow, kDrwBoneLeftEllbow, kDrwBoneMain, kDrwBoneChest, kDrwBoneHead, kDrwBoneCrown}}
NewObject{subobject=lObjects}
EffectSave()

local sparks = Sparks{bursts=4, sparks=1, inner=0, outer=0.2, radius=0.1, size=0.3, flic=flics.circle, colorstart={0.5,0.5,1,1}}
local lObjects = AttachToBones{object=sparks, bones={kDrwBoneRightFoot, kDrwBoneLeftFoot, kDrwBoneRightKnee, kDrwBoneLeftKnee, kDrwBoneRightShoulder, kDrwBoneLeftShoulder, kDrwBoneRightPalm, kDrwBoneLeftPalm, kDrwBoneRightEllbow, kDrwBoneLeftEllbow, kDrwBoneMain, kDrwBoneChest, kDrwBoneHead, kDrwBoneCrown}}
NewObject{subobject=lObjects}
EffectSave()

local sparks = Sparks{innerscale=1, flic=flics.star_halo, bursts=3, sparks=3, inner=0.2, outer=0.3, radius=0.2, size=0.2, lifetime=5}
local lObjects = AttachToBones{object=sparks, bones={kDrwBoneRightFoot, kDrwBoneLeftFoot, kDrwBoneRightKnee, kDrwBoneLeftKnee, kDrwBoneRightShoulder, kDrwBoneLeftShoulder, kDrwBoneRightPalm, kDrwBoneLeftPalm, kDrwBoneRightEllbow, kDrwBoneLeftEllbow, kDrwBoneMain, kDrwBoneChest, kDrwBoneHead, kDrwBoneCrown}}
NewObject{subobject=lObjects}
EffectSave()

local sparks = Sparks{bursts=2, sparks=2, inner=0.2, outer=0.3, radius=0.2, size=1, lifetime=6,  colorstart={0.5,0.5,1,0}, colorend={0.5,0.5,1,1}}
local lObjects = AttachToBones{object=sparks, bones={kDrwBoneRightFoot, kDrwBoneLeftFoot, kDrwBoneRightKnee, kDrwBoneLeftKnee, kDrwBoneRightShoulder, kDrwBoneLeftShoulder, kDrwBoneRightPalm, kDrwBoneLeftPalm, kDrwBoneRightEllbow, kDrwBoneLeftEllbow, kDrwBoneMain, kDrwBoneChest, kDrwBoneHead, kDrwBoneCrown}}
NewObject{subobject=lObjects}
EffectSave()

Fire{particles=9, size=0.4, height=0.8, width=0.8, ground=0.2}
Translation{min={0,0,-0.5}}
local x= NewObject{billboard=flics.solar, movie=pMovie}

local lObjects = AttachToBones{object=x, bones={kDrwBoneRightFoot, kDrwBoneLeftFoot, kDrwBoneRightKnee, kDrwBoneLeftKnee, kDrwBoneRightShoulder, kDrwBoneLeftShoulder, kDrwBoneRightPalm, kDrwBoneLeftPalm, kDrwBoneRightEllbow, kDrwBoneLeftEllbow, kDrwBoneMain, kDrwBoneChest, kDrwBoneHead, kDrwBoneCrown}}
--local lObjects = AttachToBones{object=x, bones={kDrwBoneRightPalm, kDrwBoneLeftPalm}}
NewObject{subobject=lObjects}
EffectSave()


---------------------------------------------- flash sphere

local params = {radius=0.3, time=0.2, flashcolor={0,1,1,1}}
local flash1 = FlashSphere(params)
local flash2 = FlashSphere(params)

NewMovie()
Color{min={0,0.5,1,0.7}, max={0,0.5,1,-10}, range=1, path=kDrwPathParabola}
Scale{min={params.radius+0.2, params.radius+0.2, params.radius+0.2}}
local glow = NewObject{billboard=flics.circle, movie=pMovie}

local lObjects =
{
	NewObject{subobject={glow, flash1}, bone=kDrwBoneRightPalm, restriction=kDrwCsBone},
	NewObject{subobject={glow, flash2}, bone=kDrwBoneLeftPalm, restriction=kDrwCsBone},
}

NewObject{subobject=lObjects}
EffectSave("FlashSphere")

---------------------------------------------
function ExploRing(params)
	local time=(params.time or 1)
	local width=(params.width or 1)
	local particles=(params.particles or 11)
	
	NewMovie(particles)
	Rotation{dim=kDrwDimParticle}
	Translation{min={0.5,0,0}, max={width,0,0}, range=params.time, path=kDrwPathLinear}
	Rotation{dim=kDrwDimParticle, path=kDrwPathRandom}
	Scale{min={0.1,0.1,0.1}, max={1,1,1}, range=time, path=kDrwPathLinear}
end

local params={particles=25, time=2, width=15}
Translation{min={0,0,0.3}}
ExploRing(params)
Color{min={0.5,0.5,1,1}, max={0.5,0.5,1,0}, range=params.time, path=kDrwPathParabola}
Rotation{min=-90, max=-90, axis="x", direction=0}
local particles= NewObject{mesh=flics.circle, movie=pMovie, restriction=kDrwCsFloor}

NewMovie(1)
Color{min={0.5,0.5,1,1}, max={0.5,0.5,1,0}, range=params.time}--, path=kDrwPathParabola}
Rotation{min=-90, max=-90, axis="x", direction=0}
Scale{min={0.5,0.5,0.5}, max={params.width, params.width, params.width}, range=params.time}
Scale{min={1.5,1.5,1.5}, max={1.2,1.2,1.2}, range=params.time, path=kDrwPathParabola}
local ring= NewObject{mesh=flics.ring, movie=pMovie}
local decal= NewObject{decal=flics.ring, movie=pMovie}

NewObject{subobject={particles}, bone=kDrwBoneChest}
EffectSave("ExploRing")

--------------------------------------------------------- groundwave
local params={range=6, particles=4, size=3}
NewMovie(params.particles)
Scale{min=0, max=params.size, trail=1, range=params.range}
Color{min=0.5, max=0, trail=1, range=params.range}
local groundwave = NewObject{decal=flics.groundwave, movie=pMovie}
EffectSave("GroundWave")


NewMovie(50)
Rotation{min=0, max=360, dim=kDrwDimParticle, path=kDrwPathRandom}
Translation{max={15,0,0}, dim=kDrwDimParticle, path=kDrwPathNegParabola}
Color{min=0, max=1, range=0.5, dim=kDrwDimTimeScaled, path=kDrwPathCosine, play=kDrwPlayBounce}
NewObject{subobject=groundwave, movie=pMovie}
EffectSave("AreaWave")


----------------------------------------- lightning from sky
local lightning = Lightning{range=1}
NewMovie()
Scale{min={2,2,10}}
Color{min={0.3,0.6,1,0.6}, max={0.3,0.6,1,-10.0}, range=1, path=kDrwPathParabola}
NewObject{subobject=lightning, movie=pMovie, bone=kDrwBoneChest}
EffectSave()

----------------------------------------- lightning from head
local range=0.1
local lightning1 = Lightning{range=range}
local lightning2 = Lightning{range=range}
local lightning3 = Lightning{range=range}

NewMovie()
Translation{min={0,0,-2.1}}
local reverse = 
{
	NewObject{subobject=lightning1, movie=pMovie},
	NewObject{subobject=lightning2, movie=pMovie},
	NewObject{subobject=lightning3, movie=pMovie}
}

NewMovie(3)
Choose{dim=kDrwDimParticle, path=kDrwPathRandom}
Rotation{dim=kDrwDimParticle, axis="x"}
Scale{min={1,1,2}}
Scale{min=0.2}
gObjects[1] = NewObject{subobject=reverse, movie=pMovie}

NewMovie(5)
Rotation{dim=kDrwDimParticle, axis="y"}
NewObject{subobject=gObjects[1], movie=pMovie, bone=kDrwBoneCrown, rotation=0}


EffectSave()

----------------------------------------- lightning from head
local range=0.1
local lightning1 = Lightning{range=range,flic=flics.simplelightning}
local lightning2 = Lightning{range=range,flic=flics.simplelightning}
local lightning3 = Lightning{range=range,flic=flics.simplelightning}

NewMovie()
Translation{min={0,0,-2.1}}
local reverse = 
{
	NewObject{subobject=lightning1, movie=pMovie},
	NewObject{subobject=lightning2, movie=pMovie},
	NewObject{subobject=lightning3, movie=pMovie}
}

NewMovie(3)
Choose{dim=kDrwDimParticle, path=kDrwPathRandom}
Rotation{dim=kDrwDimParticle, axis="x"}
Scale{min={0.8,0.8,1}}
Scale{min=0.2}
Color{min={0.3,0.6,1,0.3}, max={0.3,0.6,1,0.0}, range=0.1}
gObjects[1] = NewObject{subobject=reverse, movie=pMovie}

NewMovie(5)
Rotation{dim=kDrwDimParticle, axis="y"}
NewObject{subobject=gObjects[1], movie=pMovie, bone=kDrwBoneCrown, rotation=0}
EffectSave("HeadFlash")



---------------------------------------	static cloud
Cloud{time=2, particles=22, color1={1,1,1,1}, color2={0.5,0.7,0.5,0}, offset={0.3,0,1}}
Rotation{axis="x"}
Clamp{range=2}
NewObject{billboard=flics.fog, movie=pMovie}
EffectSave("StaticCloud")

--------------------------------------- fireball
Fire{particles=22, size=0.3, height=2.8, width=1.8, ground=0.2, color1={1,1,1,0.7}, color2={1,0.4,0.2,0}}
Translation{min={0,0,0}}
Scale{min=2}
local fire= NewObject{billboard=flics.solar, movie=pMovie}

NewMovie()
Translation{min={1,0,0}, max={16,0,0}}
Rotation{axis="y", min=-90, max=-90, direction=0}
local firethrust = NewObject{subobject=fire, movie=pMovie}
local lObjects = AttachToBones{object=firethrust, bones={kDrwBoneRightHand}, restriction=kDrwCsBone}

NewMovie()
----Sound("spell_hit_fireball")
NewObject{subobject=lObjects}
EffectSave()

--------------------------------------- fireball with dustcloud
Cloud{particles=11, time=1, velocity={0,0,1}, size=0.1}
local dust = NewObject{billboard=flics.fog, movie=pMovie}

local fireball = NewObject{subobject={firethrust, dust}}

local lObjects = AttachToBones{object=fireball, bones={kDrwBoneRightHand}, restriction=kDrwCsBone}
NewObject{subobject=lObjects}
EffectSave()


----------------------------------- explosion
local time=1
local explosion = Explosion{rolltime=0.4, particles=4, time=time, flic=flics.explo}
NewMovie()
Translation{max={0,0,3}, range=time}
Scale{min=3}
NewObject{subobject=explosion, movie=pMovie, bone=kDrwBoneChest}
EffectSave()

local time=1
local explosion = Explosion{startsizes={1,2,0}, size=0, time=time, flic=flics.fog}
NewMovie()
Translation{max={0,0,1}, range=time}
Scale{min=2}
Clamp{}
NewObject{subobject=explosion, movie=pMovie, bone=kDrwBoneChest}
EffectSave("Explo")
--------------------------- circle trail

CircleTrail{particles=22, time=0.7, startsize=0.3, stopsize=0.1, startcolor={0.2,1,0.5,0.7}, stopcolor={1,0,0,0}}
local trail = NewObject{billboard=flics.circle, movie=pMovie}
local lObjects = AttachToBones{object=trail, bones={kDrwBoneChest}}
NewObject{subobject=lObjects}
EffectSave()

NewMovie(3)
--Rotation{axis="z", dim=kDrwDimParticle}
Rotation{axis="y", dim=kDrwDimParticle}
--Rotation{axis="x", dim=kDrwDimParticle}
local multitrail= NewObject{subobject=trail, movie=pMovie}
local lObjects = AttachToBones{object=multitrail, bones={kDrwBoneChest}}
NewObject{subobject=lObjects}
EffectSave()


CircleTrail{radius=1, particles=22, startsize=0.3, stopsize=0.1, startcolor={0.2,1,0.5,0.7}, stopcolor={1,0,0,0}, time=0.5}
local trail = NewObject{billboard=flics.circle, movie=pMovie}
NewMovie(1)
Scale{min=0.3}
local lObjects = AttachToBones{movie=pMovie, object=trail, bones={kDrwBoneRightPalm, kDrwBoneLeftPalm, kDrwBoneLeftEllbow, kDrwBoneRightEllbow, kDrwBoneLeftShoulder, kDrwBoneRightShoulder}, restriction=kDrwCsBone}
NewObject{subobject=lObjects}
EffectSave()

------------------------------------------ whirlwinds
local whirlwind = Whirlwind{startcolor={0.2,0.5,0.8,0.6}, stopcolor={0.2,0.5,0.8,0.0}}
NewMovie()
Scale{min=0.5}
NewObject{subobject=whirlwind, movie=pMovie, bone=kDrwBoneHead}
EffectSave()

---------------------------------------------------------

local whirlwind = Whirlwind{flic=flics.circle, particles=6, time=0.5, tilt=40, stopsize=0.8, layers=10, radius=1, height=3, startcolor={0.8,0.6,0.4,0.4}, stopcolor={0.9,0.3,0.2,0.0}}
NewMovie()
--Scale{min=0.3}
NewObject{subobject=whirlwind, movie=pMovie, bone=kDrwBoneHead}
EffectSave()


------------------------------------------------------------ bodyglow

BodyGlow{size1=0, size2=1, radius2=0.3, color1={1,1,1,0.7}, color2={1,1,1,0}}
local glow = NewObject{billboard=flics.sol_bb, movie=pMovie}
local lObjects = AttachToBones{object=glow, bones={kDrwBoneMain, kDrwBoneHead, kDrwBoneCrown, kDrwBoneRightFoot, kDrwBoneLeftFoot, kDrwBoneRightKnee, kDrwBoneLeftKnee, kDrwBoneRightShoulder, kDrwBoneLeftShoulder, kDrwBoneRightPalm, kDrwBoneLeftPalm, kDrwBoneRightEllbow, kDrwBoneLeftEllbow, kDrwBoneRightThigh, kDrwBoneLeftThigh}}
NewObject{subobject=lObjects}
EffectSave()

BodyGlow{size1=0, size2=1, radius2=0.3, color1={1,1,1,0.7}, color2={1,1,1,0}}
local glow = NewObject{billboard=flics.sol_bb, movie=pMovie}
local lObjects = AttachToBones{object=glow, bones={kDrwBoneCrown}}
NewObject{subobject=lObjects}
EffectSave()

------------------------------------------
BodyGlow{particles=22, size1=0.1, size2=0.6, radius1=0.2, radius2=0.4, color1={0,0,0,1}, color2={0,0,0,0}}
--BodyGlow{particles=4, size1=0.3, size2=0.7, radius1=0.5, radius2=0.3, color1={0,0,0,0.6}, color2={0,0,0,0}}
local glow = NewObject{billboard=flics.circledark, movie=pMovie}
local lObjects = AttachToBones{object=glow, bones=GetBones{"All"}, restriction=kDrwCsBone}
NewObject{subobject=lObjects}
EffectSave()

-------------------------------------------------------- regenerate old
CircleTrail{radius=0.3, particles=11, startsize=0.4, stopsize=0.1, startcolor={0,0.5,1,0.7}, stopcolor={1,1,1,0}, time=1.0}
local trailvertical = NewObject{billboard=flics.spark, movie=pMovie}
EffectSave("Trail")

NewMovie()
Rotation{axis="y", min=90, max=90, direction=0}
local trail = NewObject{subobject=trailvertical, movie=pMovie}

local TimedScaleIn = MoviesTimedScaleIn{time=2, steps=8, scaletime=2}

gObjects =
{
	NewObject{subobject=trail, movie=TimedScaleIn[7], bone=kDrwBoneRightFoot, restriction=kDrwCsBone},
	NewObject{subobject=trail, movie=TimedScaleIn[6], bone=kDrwBoneLeftFoot, restriction=kDrwCsBone},
	NewObject{subobject=trail, movie=TimedScaleIn[5], bone=kDrwBoneRightKnee, restriction=kDrwCsBone},
	NewObject{subobject=trail, movie=TimedScaleIn[4], bone=kDrwBoneLeftKnee, restriction=kDrwCsBone},
	NewObject{subobject=trail, movie=TimedScaleIn[3], bone=kDrwBoneMain, restriction=kDrwCsBone},
	NewObject{subobject=trail, movie=TimedScaleIn[2], bone=kDrwBoneChest, restriction=kDrwCsBone},
	NewObject{subobject=trail, movie=TimedScaleIn[1], bone=kDrwBoneHead, restriction=kDrwCsBone},
	NewObject{subobject=trail, movie=TimedScaleIn[0], bone=kDrwBoneCrown, restriction=kDrwCsBone},
}
local trails = NewObject{subobject=gObjects}

NewMovie()
FadeScale{path=kDrwPathLinear, fadein=0, fadeout=1}
--Sound("spell_hit_regenerate")
NewObject{subobject={trails}, movie=pMovie}
EffectSave("RegOld")


local particles, time = 55, 2
local trail=1
NewMovie(particles)
Throw{particles=particles, velocity={0,0,6}, gravity={0,0,-8}, time=time}
Burst{particles=particles, radius1=0, radius2=3, time=time}
Scale{max=0.6, min=0, range=time/2, trail=trail*2, play=kDrwPlayBounce, path=kDrwPathCosine}
Color{min={1,1,1,0.2}}
NewObject{billboard=flics.whiteorange, movie=pMovie, bone=kDrwBoneHead}
EffectSave()

Fire{particles=11, color1={1,1,0.5,0.8}, color2={0.4,0,0,0}, ground=0.4, width=0.6, size=0.4, height=1.5}
gObjects[1] = NewObject{billboard=flics.whiteorange, movie=pMovie, bone=kDrwBoneCrown}
EffectSave()

Cloud{particles=7, color1={1,1,1,0.8}, color2={1,0.5,0,0}, velocity={0,0,1}, time=0.5, size=0.2}
Scale{min=1.2}
NewObject{billboard=flics.whiteorange, movie=pMovie, bone=kDrwBoneCrown}
EffectSave()


NewMovie()
Translation{min={0,0,2}, max={0,0,5}, dim=kDrwDimRandom, path=kDrwPathSine, play=kDrwPlayBounce}
object = NewObject{billboard=flics.whiteorange, movie=pMovie}
EffectSave()

NewMovie(3)
Translation{min={0,0,3}}
Rotation{axis="x", dim=kDrwDimParticle}
NewObject{subobject=gObjects[1], movie=pMovie}
EffectSave()


Fire{time=1, buffer=0.4, particles=11, ground=0.2, width=0.4, top=0.1, size=0.4, height=1.8, color1={1,0.5,0,0.6}, color2={1,1,0.6,0}}
gObjects[1] = NewObject{billboard=flics.smoke, movie=pMovie}
gObjects[2] = AttachToBones{object=gObjects[1], bones={kDrwBoneRightPalm, kDrwBoneLeftPalm}}
NewObject{subobject=gObjects[2]}
EffectSave("fire2")

gObjects[1] = CombineParticles{ratio=0.4, flic1=flics.smoke, color1={1,0.5,0,0.6}, color2={1,1,0.6,1}}

NewMovie(10)
ChangeNumbers{min=1, max=10, dim=kDrwDimTimeScaled, range=0.5, play=kDrwPlayBounce}
GlobalTrail{buffer=0.5, range=1, trail=1, path=kDrwPathParabola}
Translation{min={0,0,2}}
Translation{max={0,0,2}, range=1, trail=1}
Color{max={1,1,1,0}, range=1, trail=1}
Scale{min=0.2, max=1, dim=kDrwDimPower}
NewObject{subobject=gObjects[1], movie=pMovie}
--Scale{min=0.1}
--NewObject{billboard=flics.circle, movie=pMovie}
EffectSave("test")


NewMovie()
Choose{range=0.1*100, path=kDrwPathRandom, play=kDrwPlayContinous}
NewObject{mesh=flics.stones, movie=pMovie}
EffectSave("random")


gObjects[1] = CombineParticles{ratio=0.4, flic1=flics.smoke, color1={1,0.5,0,0.6}, color2={1,1,0.6,1}}
Fire{buffer=0.2, particles=11, color1=1, color2=0, ground=0.1, width=0.3, size=0.6, height=1.5}
gObjects[2] = NewObject{subobject=gObjects[1], movie=pMovie, restriction=kDrwCsFloor+kDrwCsBone}
EffectSave("fire1")

----------------------------------------------------------------------

NewMovie(10)
Rotation{dim=kDrwDimParticle}
Rotation{range=3}
Translation{min={2,0,0}}
--Translation{min={-1,0,0}, max={1,0,0}, dim=kDrwDimParticle}
NewObject{subobject=gObjects[2], movie=pMovie, restriction=kDrwCsWorld}
EffectSave("RingOfFire")


NewMovie(10)
--ChangeNumbers{min=1, max=10, start=0, range=3, dim=kDrwDimTargetSize, play=kDrwPlayClamped}
--GlobalTrail{buffer=0.5, range=1, trail=1, path=kDrwPathParabola}
Scale{min=0, max=5, start=0, range=10, dim=kDrwDimTargetSize, play=kDrwPlayClamped, path=kDrwPathLinear}
Translation{min={0,0.5,0}}
Translation{max={0,0,1}, range=1, trail=1}
Scale{min=0.5}
gObjects[2] = NewObject{subobject=gObjects[1], movie=pMovie}
--NewMovie()
--Translation{min={0,0.5,0}}
--NewObject{subobject=gObjects[2], movie=pMovie}
EffectSave("SizeTest")


NewMovie(10)
Rotation{dim=kDrwParticle}
Translation{min={5,0,0}}
--Scale{min=0.2}
NewObject{billboard=flics.circle, movie=pMovie}
EffectSave("TestRot")


Smoke{wind={3,0,0}, particles=15, offset={0,0,0}, velocity={0.5,0,6}, gravity={0,0,0}, time=5, growth=2, color2={0.1,0.1,0.1,0}, color1={0.4,0.4,0.4,0.5}, colorplay=kDrwPlayLooped}
--Rotation{range=15}
--GlobalTrail{buffer=1, range=3, trail=1}--, path=kDrwPathParabola}
local path
path=Path{{0,0},{0.2,0.8}, {1,1}}
Scale{min=0, max=1, path=path, trail=1, range=5}
--Scale{min=0, max=1, path=kDrwPathNegParabola, trail=1, range=3}
NewObject{billboard=flics.plasma, movie=pMovie, restriction=kDrwCsWorld}
EffectSave("PlasmaSmoke")


local particle = CombineParticles{ratio=0.2, color1=1, color2=1, flic2=flics.skull, flic1=flics.circle}
Smoke{trail=1, particles=22, offset={0.5,0,0.0}, velocity={0,0,0.3}, gravity={0,0,4}, time=2, growth=1, color2={1,0,0,0}, color1={1,0,0,1}, colorplay=kDrwPlayLooped}
Scale{min=0.2}
local glowingtube = NewObject{subobject=particle, movie=pMovie, restriction=kDrwCsResetRotation}
EffectSave("SingleGlowingTube")

NewMovie(2)
Translation{min={0,0,1}}
--Rotation{range=5}
Rotation{dim = kDrwDimParticle}
Rotation{axis="x", dim = kDrwDimParticle}
Translation{min={0,0,0.2}}
NewObject{subobject=glowingtube, movie=pMovie}
EffectSave("GlowingTube")



gParams.particles=22
NewMovie(gParams.particles)
Translation{min={0,0,1}}
PowerScale{powerscale = 3}
Burst{radius2=1, particles=gParams.particles}
Scale{min=0.5, max=0.2, trail=1}
Color{min=1, max=0, trail=1, path=kDrwPathSine}
NewObject{billboard=flics.star4point, movie=pMovie, bone=kDrwBoneCrown, restriction=kDrwCsResetRotation}
EffectSave("Sparkle4Point")


gParams={particles=33, time=0.5}
NewMovie(gParams.particles)
--Rotation{range=3}
PowerScale{powerscale = 3}
Translation{max={0,0,-0.3}, path=kDrwPathParabola, range=gParams.time, trail=1}
Burst{radius1=0.5, radius2=0.6, particles=gParams.particles, time=gParams.time}
Scale{min=0.2}
Color{min=1, max=0, trail=1, path=kDrwPathNegParabola, range=gParams.time}
local spark = NewObject{billboard=flics.spark, movie=pMovie, bone=kDrwBoneChest, restriction=kDrwCsResetRotation}
EffectSave("Spark")

NewMovie()
FadeScale{}
NewObject{subobject=spark, movie=pmovie}
EffectSave("SparkNext")



--------------------------------------------------- Chain
NewMovie(20)
Scale{min=0, max=2, start=0, range=10, dim=kDrwDimTargetSize, play=kDrwPlayClamped, path=kDrwPathLinear}
Translation{max={0,0,-2}, dim=kDrwDimParticle}
Translation{max={-0.5,0,0}, dim=kDrwDimParticle, path=kDrwPathParabola}
Rotation{range=2, trail=1, play=kDrwPlayBounce}
Translation{min={-0.02,0,0}, max={0.02,0,0}, trail=1, path=kDrwPathCosine, play=kDrwPlayBounce}
Translation{min={0,-0.02,0}, max={0,0.02,0}, range=1.2, trail=1, path=kDrwPathCosine, play=kDrwPlayBounce}
Color{min={0.8,0.8,0.8,1}, max={0.8,0.8,1,1}, dim=kDrwDimParticle, path=kDrwPathRandom}
Scale{min=0.045}
Scale{min={1,1,2}}
--ale{min=1.5}
Scale{min=1, max=1.3, dim=kDrwDimParticle, path=kDrwPathRandom}
GlobalTrail{buffer=0.3, trail=1, dim=kDrwDimParticle}
local chain=NewObject{billboard=flics.chain, movie=pMovie, restriction=kDrwCsResetRotation}
EffectSave("SingleChain")

local chainright= NewObject{subobject=chain, bone=kDrwBoneRightHand, restriction=kDrwCsObject}

NewMovie(1)
Rotation{min=180, max=180, direction=0}
local chainleft = NewObject{subobject=chain, bone=kDrwBoneLeftHand, restriction=kDrwCsObject, movie=pMovie}

NewObject{subobject={chainright, chainleft}}
EffectSave("Chain")

---------------------------------- Charm Chain
NewMovie(4)
Translation{min={0,2,1}}
Scale{min=0, max=0.7, range=0.5,trail=1}
Color{min={1,1,0,0.4}, max={0,0.5,1,0.2}, range=0.5, trail=1}
local lead1 = NewObject{movie=pMovie, billboard=flics.ring, bone=kDrwBoneHead, bonesource=kDrwBoneHead, restriction=kDrwCsAim+kDrwCsSwap}

NewMovie(4)
Translation{min={0,2,1}}
Scale{min=0.3, max=0, range=0.5,trail=1}
Color{min={1,1,0,0}, max={1,0,0,1}, range=0.5, trail=1}
local lead2 = NewObject{movie=pMovie, billboard=flics.ring, bone=kDrwBoneHead, bonesource=kDrwBoneHead, restriction=kDrwCsAim+kDrwCsSwap}

NewMovie(10)
Translation{min={0,2,1}}
Burst{radius2=0.5}
Color{min=0.4, max=0, range=1, trail=1}
Scale{min=0.5}
local lead3 = NewObject{movie=pMovie, billboard=flics.star6point, bone=kDrwBoneHead, bonesource=kDrwBoneHead, restriction=kDrwCsAim+kDrwCsSwap}

local lead4 = NewObject{movie=pMovie, billboard=flics.star4point, bone=kDrwBoneHead, bonesource=kDrwBoneHead, restriction=kDrwCsAim+kDrwCsSwap}

------------------ addon2
NewMovie(10)
Translation{min={0,2,1}}
Burst{radius2=0.5}
Color{min=1, max={0,0,0,0}, range=1, trail=1}
Scale{min={0.5,0.1,0.1}}
local lead5 = NewObject{movie=pMovie, mesh=flics.flashsphere[1], bone=kDrwBoneHead, bonesource=kDrwBoneHead, restriction=kDrwCsAim+kDrwCsSwap}

NewMovie(3)
Choose{path=kDrwPathRandom, range=2}
Translation{min={0,2,1}}
Scale{min=0.4}
Color{min={0.7,0,0.4,0.4}, max={0.2,0,0.7,0.4}, dim=kDrwDimRandom, range=200}
Rotation{dim=kDrwDimRandom, range=200}
local lead5 = NewObject{movie=pMovie, billboard=flics.circle, mesh=flics.flashsphere, bone=kDrwBoneHead, bonesource=kDrwBoneHead, restriction=kDrwCsAim+kDrwCsSwap}
------------------

NewMovie(20)
Translation{max={0,2,-2}, dim=kDrwDimParticle}
Translation{max={0,0,3}, dim=kDrwDimParticle, path=kDrwPathParabola}
Translation{min={-0.02,0,0}, max={0.02,0,0}, trail=1, path=kDrwPathCosine, play=kDrwPlayBounce}
Translation{min={0,-0.02,0}, max={0,0.02,0}, range=1.2, trail=1, path=kDrwPathCosine, play=kDrwPlayBounce}
Color{min={0.8,1,0.8,0.5}, max={0.8,1,0.8,0.9}, dim=kDrwDimParticle, range=0.5, play=kDrwPlayBounce}
Scale{min=0.065}
Scale{min=1, max=1.5, dim=kDrwDimParticle}
Scale{min=1, max=1.3, dim=kDrwDimParticle, path=kDrwPathRandom}
GlobalTrail{buffer=0.05, trail=1, dim=kDrwDimParticle}
local charmchain=NewObject{billboard=flics.chain, movie=pMovie, bone=kDrwBoneHead, bonesource=kDrwBoneHead, restriction=kDrwCsAim+kDrwCsSwap}

NewMovie()
Color{min=0, max=1, range=0.3, play=kDrwPlayBounce, path=kDrwPathCosine}
local charmchain2 = NewObject{subobject=charmchain, movie=pMovie}

NewMovie()
Scale{min=0, max=2, start=0, range=10, dim=kDrwDimTargetSize, play=kDrwPlayClamped, path=kDrwPathLinear}
NewObject{subobject={charmchain, lead1}, movie=pMovie}
EffectSave("CharmChain")

NewObject{subobject={charmchain2, lead2}, movie=pMovie}
EffectSave("CharmChain2")

NewObject{subobject={charmchain, lead3}, movie=pMovie}
EffectSave("CharmChainWhite")

NewObject{subobject={charmchain2, lead4}, movie=pMovie}
EffectSave("CharmChainWhite2")

NewObject{subobject={charmchain, lead5}, movie=pMovie}
EffectSave("CharmChainBlack")

NewMovie()
Scale{min=6}
Color{min=0.2, max=0.7, range=0.06, play=kDrwPlayBounce}
local glow=NewObject{billboard=flics.flare, movie=pMovie}
local chain =NewObject{billboard=flics.chain}

NewMovie(20)
Translation{max={0,2,-2}, dim=kDrwDimParticle}
Translation{max={0,0,3}, dim=kDrwDimParticle, path=kDrwPathParabola}
Rotation{axis="y", dim=kDrwDimParticle, path=kDrwPathRandom}
Translation{max={0,0,1}, range=0.8, play=kDrwPlayClamped}
Color{max=0, min=1, range=0.8, play=kDrwPlayClamped}
Scale{min=0.065}
Scale{min=1, max=1.5, dim=kDrwDimParticle}
NewObject{subobject={glow, chain}, movie=pMovie, bone=kDrwBoneHead, bonesource=kDrwBoneHead, restriction=kDrwCsAim+kDrwCsSwap}
EffectSave("CharmChainBreak")

-------------------------------------------------
NewMovie(20)
Translation{max={0,10,0}, trail=-1, range=1, play=kDrwPlayLooped}
Scale{min=0.2}
NewObject{mesh=flics.sphere, movie=pMovie, bone=kDrwBoneLeftHand, bonesource=kDrwBoneRightHand, restriction=kDrwCsAim}
EffectSave("Aim")


Fire{time=1, particles=11, ground=0.2, width=0.4, top=0.1, size=0.4, height=2.8, color1={1,0.5,0,0.6}, color2={1,1,0.6,0}}
local fireball = NewObject{billboard=flics.smoke, movie=pMovie}

NewMovie()
Rotation{axis="x", min=90, direction=0}
fireball = NewObject{subobject=fireball, movie=pMovie}

NewMovie()
NewObject{subobject=fireball, movie=pMovie, bone=kDrwBoneLeftHand, bonesource=kDrwBoneRightHand, restriction=kDrwCsProjectile, boundingradius=30}
EffectSave("Projectile")


local lightning = Lightning{range=0.08, flic=flics.simplelightning, mode=0}
NewMovie()
Rotation{axis="x", min=-90, direction=0}
Scale{min=0.5}
lightning = NewObject{subobject=lightning, movie=pMovie}

NewMovie()
--Translation{min={0.0,0.5,0}}
NewObject{subobject=lightning, movie=pMovie, bone=kDrwBoneLeftHand, bonesource=kDrwBoneRightHand, restriction=kDrwCsSpan}
EffectSave("Span")
 

NewMovie()
TargetColor{min={0,1,1,1}, max={1,1,1,1}, range=0.2, path=kDrwPathCosine, play=kDrwPlayBounce}
local targetcolor = NewObject{movie=pMovie}
EffectSave("TargetColor")

NewObject{subobject={particleglow, targetcolor}}
EffectSave("Target")



------------------------------------------------------------------flexibility dot
BodyGlow{figurescale=5, particles=4, size1=0.1, size2=0.5, radius1=0, radius2=0.1, color1={1,0.5,1,0.3}, color2={0,0,1,0}}
local glow = NewObject{billboard=flics.star_halo, movie=pMovie}
local lObjects = AttachToBones{object=glow, bones=GetBones{"Legs", "Arms"}, restriction=kDrwCsBone}
NewObject{subobject=lObjects}
EffectSave("BelialGlow")

BodyGlow{figurescale=5, particles=4, size1=0.1, size2=0.5, radius1=0, radius2=0.1, color1={0.7,1,0.3,0.4}, color2={1,0,0,0}}
local glow = NewObject{billboard=flics.star_halo, movie=pMovie}
local lObjects = AttachToBones{object=glow, bones=GetBones{"Legs", "Arms"}, restriction=kDrwCsBone}
NewObject{subobject=lObjects}
EffectSave("DefaultGlow")

----------------------------fish
NewMovie()
Translation{min={0,0,-0.4}}
Throw{time=2, velocity={0,0,6}, gravity={0,0,-6}}
Rotation{axis="x", min=-90, direction=0}
Rotation{axis="x", range=1.3}
Scale{min=6}

local fish = NewObject{mesh=flics.fish}


NewMovie(10)
Rotation{range=10, dim=kDrwDimTimeAbsolute}
Choose{path=kDrwPathRandom, range=100*1, play=kDrwPlayContinous, trail=2}
ChangeNumbers{dim=kDrwDimPower}
Rotation{dim=kDrwDimParticle, path=kDrwPathRandom}
Translation{min={0,0.5,-0.5}, max={0,1.5, -1}, dim=kDrwDimParticle}
Throw{time=1, velocity={0,-2,6}, gravity={0,0,-6}}
--Color{min=0, max=1, range=0.5, play=kDrwPlayBounce, path=kDrwPathNegParabola, trail=2}
Rotation{axis="x", min=-90, direction=0}
Rotation{range=1, axis="x", max=-180, trail=1}
local fishjump = NewObject{subobject={fish, gNoEffect, gNoEffect}, movie=pMovie}

NewMovie(10)
ChangeNumbers{dim=kDrwDimPower}
Translation{min={0,0,-0.2}}
Translation{max={0,0,-0.5}, dim=kDrwDimParticle, path=kDrwPathRandom}
Rotation{range=10, max=-360, direction=-1, trail=2, play=kDrwPlayBounce, path=kDrwPathCosine}
Translation{min={0.2,0,0}}
Rotation{range=6, trail=-1}
Translation{min={0.3,0,0}}
Rotation{range=2, max=-360, direction=-1, trail=3}
Translation{min={0.4,0,0}}
local fishswim = NewObject{mesh=flics.fish, movie=pMovie}

NewObject{subobject={fishswim, fishjump}}
EffectSave("Fish")

-------------------- Building Fire
local fireparticle = CombineParticles{ratio=0.4, flic1=flics.smoke, color1={1,0.5,0,1}, color2={1,1,0.6,1}}
Fire{powerscale = {0.3, 1}, size2=0.5, time=2, particles=11, color1={1,1,1,1}, color2={1,0,0,0}, ground=0.3, width=0.3, top=0.5, size=3, height=2.5, noplopp=1}
local fire = NewObject{subobject=fireparticle, movie=pMovie}

Smoke{powerscale={0.1,1}, wind={1,0,0}, particles=15, offset={0,0,2}, velocity={1,0,10}, gravity={0,0,0}, time=3, growth=2, color2={0.1,0.1,0.1,0}, color1={0.4,0.4,0.4,0.9}, colorplay=kDrwPlayLooped}
Scale{min=2}
local smoke = NewObject{billboard=flics.plasma, movie=pMovie, restriction=kDrwCsWorld}

NewMovie()
Scale{min=0.7}
NewObject{subobject={smoke, fire}, movie=pMovie}
EffectSave("BuildingFire")


-------------------- Building Flag
local flagpole = NewObject{mesh=flics.flagpole, shadow=1}

NewMovie()
Animation{file="building_flag", range=10, dim=kDrwDimTimeAbsolute}
Color{dim=kDrwDimPlayer}
local flag = NewObject{skin=flics.flag, movie=pMovie, restriction=kDrwCsWorld, shadow=1}

NewMovie()
Color{min=0.99}
NewObject{subobject={flag, flagpole}, movie=pMovie}
EffectSave("BuildingFlag")

NewMovie()
Animation{file="building_flag_occupied", range=11}
Color{min=0.99}
local flag_occupied = NewObject{skin=flics.flag_occupied, movie=pMovie, restriction=kDrwCsWorld}

NewObject{subobject={flag_occupied, flag, flagpole}, movie=pMovie}
EffectSave("BuildingFlagOccupied")

------------------------------------- Rally point flag

NewMovie()
Animation{file="effect_flag_rallypoint", range=10, dim=kDrwDimTimeAbsolute}
--Color{dim=kDrwDimPlayer}
local flag = NewObject{skin=flics.rallyflag, movie=pMovie, restriction=kDrwCsWorld, shadow=1}

NewMovie()
Color{min={1,1,1,0.4}, max={1,1,1,0}, range=1, play=kDrwPlayClamped}
Scale{min=0.1, max=3.0, range=1}
local shadow = NewObject{decal=flics.groundwave, movie=pMovie}

NewObject{subobject={flag}}
EffectSave("Rally")

NewMovie()
Scale{min=1}
Color{max=0, path=kDrwPathParabola, dim=kDrwDimTimeScaled}
NewObject{subobject={flag, shadow}, movie=pMovie}
EffectSave("RallyFade")


-------------------- Dialog
NewMovie()
Translation{min={0,0,0.5}}
Rotation{range= 2, dim=kDrwDimTimeAbsolute}
Scale{min= 0.5}
Color{range=3, min= 0.4, max= 0.8, play=kDrwPlayBounce, path=kDrwPathCosine}
NewObject{mesh=flics.attention, movie=pMovie, bone=kDrwBoneCrown}
EffectSave("DialogImportant")

NewMovie()
Translation{min={0,0,0.5}}
Rotation{range=2, dim=kDrwDimTimeAbsolute}
Scale{min=0.5}
Color{range=3, min= 0.4, max= 0.8, play=kDrwPlayBounce, path=kDrwPathCosine}
NewObject{mesh=flics.question, movie=pMovie, bone=kDrwBoneCrown}
EffectSave("Dialog")

NewMovie()
Translation{min={0,0,2}}
Rotation{range=2, dim=kDrwDimTimeAbsolute}
Scale{min=0.5}
Color{range=3, min= 0.4, max= 0.8, play=kDrwPlayBounce, path=kDrwPathCosine}
NewObject{mesh=flics.question, movie=pMovie}
EffectSave("DialogRieseSpecial")


-------------------- Merchant
NewMovie()
Translation{min={0,0,0.5}}
Rotation{range=2, dim=kDrwDimTimeAbsolute}
Scale{min=0.5}
Color{range=3, min=0.7, max=1, play=kDrwPlayBounce, path=kDrwPathCosine}
NewObject{mesh=flics.coin, movie=pMovie, bone=kDrwBoneCrown}
EffectSave("Merchant")


--------------------- Building Build/Destroy
NewMovie()
Translation{min={0,0,1}}--, max={0,0,-1}, trail=1}
local puff = NewObject{billboard=flics.plasma, movie=pMovie, restriction=kDrwCsFloor}

Smoke{random=1, particles=40, time=4, offset={0,0,1}, gravity={0,0,-2}, velocity={6,0,1}, color2={0.9,0.8,0.7,0.7}, color1={0.9,0.8,0.7,0}, rolltime=4}
Scale{min=1}
Translation{max={0,0,1}, dim=kDrwDimParticle, path=kDrwPathRandom}
--Rotation{axis="z", range=5}
local cloud = NewObject{subobject=puff, movie=pMovie}	

NewMovie()
--Color{min=0, max=2, start=0, range=1, dim=kDrwDimPower, play=kDrwPlayClamped, path=kDrwPathParabola}
NewObject{subobject=cloud, movie=pMovie}
EffectSave("Destroy")

NewMovie()
Color{min=0, max=1, start=0, range=1, dim=kDrwDimPower, play=kDrwPlayClamped, path=kDrwPathParabola}
Scale{min=0.8}
NewObject{subobject=cloud, movie=pMovie}
EffectSave("Build")



------------------------- Test Anim-Effect
NewMovie(3)
Rotation{range=6, max=-360, trail=1}
Translation{min={3,0,0}}
Animation{file="figure_dwarf_run", range=0.3, trail=1}
Color{min=0, max=1, range=0.5, play=kDrwPlayBounce, dim=kDrwDimTimeScaled}
NewObject{skin=flics.dwarf, movie=pMovie, restriction=kDrwCsFloor + kDrwCsWorld}
EffectSave("Dwarf")

function ugauga()
	TestEffect{effect="Dwarf", time=50, noreload=1}
end


--------------------------- Arrows
NewMovie(10)
Rotation{axis="y", dim=kDrwDimParticle, path=kDrwPathRandom}
Translation{max={0,-1.5,0}, trail=1, range=0.2}
Translation{max={0,0,-0.1}, trail=1, range=0.2, path=kDrwPathNegParabola}
Color{min={0.5,0.5,1,0.9}, max=0, trail=1, range=0.2}
Scale{min=0.2}
local smoke = NewObject{billboard=flics.star_halo, movie=pMovie, restriction=kDrwCsProjectile, bone=kDrwBoneChest, bonesource=kDrwBoneLeftHand, boundingradius=30}

NewMovie(8)
--Translation{min={0,-0.7,0}, max={0,-1,0}, dim=kDrwDimParticle}
Translation{min={0,-0.7,0}}
GlobalTrail{buffer=0.03, range=0.03, trail=-1}
--Color{max=0, dim=kDrwDimParticle}
Color{max=0, range=0.03, trail=-1}
Scale{min=1.5}
local arrow = NewObject{mesh=flics.arrow,  movie=pMovie, restriction=kDrwCsProjectile, bone=kDrwBoneChest, bonesource=kDrwBoneLeftHand, boundingradius=30, shadow=1}
EffectSave("Arrow")

NewObject{subobject={smoke, arrow}, boundingradius=30}
EffectSave("ArrowIce")

Fire{ground=0, size=0.3, color1=1, color2=0, time=0.2}--height=0.2, size=0.2}
--GlobalTrail{buffer=0.1, range=0.2, trail=1}
local fire = NewObject{billboard=flics.solar, movie=pMovie}

NewMovie()
Rotation{min=90, axis="x", direction=0}
local fire2 = NewObject{subobject=fire, movie=pMovie, restriction=kDrwCsProjectile, bone=kDrwBoneChest, bonesource=kDrwBoneLeftHand, boundingradius=30}

NewObject{subobject={fire2, arrow}, boundingradius=30}
EffectSave("ArrowFire")

NewMovie(11)
Burst{radius1=0, radius2=0.5, trail=1, time=0.5}
Scale{min=0.1}
Color{min={0,1,0,1}, max=0, trail=1, range=0.5}
GlobalTrail{buffer=0.5, range=0.5, trail=1}
local bubbles=NewObject{billboard=flics.bubble, movie=pMovie, restriction=kDrwCsProjectile, bone=kDrwBoneChest, bonesource=kDrwBoneLeftHand, boundingradius=30}

NewObject{subobject={bubbles, arrow}, boundingradius=30}
EffectSave("ArrowPoison")


CircleTrail{particles=11, radius=0.25, time=0.1, startsize=0.2, stopsize=0, length=0.5, startcolor=1, stopcolor=1}
local trail = NewObject{billboard=flics.sol_pb, movie=pMovie, restriction=kDrwCsProjectile, bone=kDrwBoneChest, bonesource=kDrwBoneLeftHand, boundingradius=30}

NewObject{subobject={trail, arrow}, boundingradius=30}
EffectSave("ArrowAmok")


NewMovie(7)
Scale{min=0.1, max=0.3, trail=1, range=0.15}
Translation{max={0,-8,0}, trail=1, range=0.15}
Color{min={0,1,0.5,0.6}, max={1,0.8,0,0.5}, dim=kDrwDimParticle}
local rings = NewObject{billboard=flics.ring, movie=pMovie, restriction=kDrwCsProjectile, bone=kDrwBoneChest, bonesource=kDrwBoneLeftHand, boundingradius=30}

NewObject{subobject={rings, arrow}, boundingradius=30}
EffectSave("ArrowMental")



NewMovie(11)
Translation{max={0,-4,0}, trail=1, range=0.2}--, play=kDrwPlayContinous}
--Burst{radius1=0, radius2=0.5, trail=1, time=0.15}
Scale{min=0.2, max=0.5, path=kDrwPathParabola, range=0.2, trail=1}
Color{min={1,1,0,0.5}, max={1,0.5,0,0}, trail=1, range=0.2, path=kDrwPathNegParabola}
--GlobalTrail{buffer=1, range=1, trail=1}
local dust=NewObject{billboard=flics.fog, movie=pMovie, restriction=kDrwCsProjectile, bone=kDrwBoneChest, bonesource=kDrwBoneLeftHand, boundingradius=30}

NewObject{subobject={dust, arrow}, boundingradius=30}
EffectSave("ArrowEarth")


--------------------------- Melee Hit
NewMovie(7)
FigureScale(3)
Throw{trail=0, velocity={0,0,0}, gravity={0,0,-1}, time=1}
Burst{radius1=0.3, radius2=0.8, trail=-0.2, time=1, path=kDrwPathCosine}
Color{min={0.5,0.1,0,0.8}, max=0, trail=-0.2, range=1, path=kDrwPathCosine}
Scale{min=0.5, max=1.4, dim=kDrwDimParticle}
Scale{min=0.8}
Clamp{range=1}
NewObject{mesh=flics.rock, movie=pMovie, bone=kDrwBoneChest, restriction=kDrwCsWorld}
EffectSave("MeleeHit")

--------------------------- Orc Titan
Smoke{wind={1,0,0}, particles=15, offset={0,0,2.2}, velocity={0.5,0,2}, gravity={0,0,0}, time=2, growth=1, color2={0.5,0.5,0.5,0}, color1={0,0,0,0.6}, colorplay=kDrwPlayLooped}
Clamp{range=3, fadein=1, fadeout=1.5}
Scale{min=0.3}
local smoke = NewObject{billboard=flics.plasma, movie=pMovie, restriction=kDrwCsWorld}

NewMovie(10)
TargetColor{max={1,0.7,0.7,0}, range=0.1, path=kDrwPathRandom}
Rotation{axis="y", trail=0.7}
Translation{min={0.5,0,0}}
Scale{min=0.1}
NewObject{billboard = flics.circle, movie=pMovie, bone="tail04"}
EffectSave("Titan2")


Fire{buffer=0.2, path=kDrwPathParabola, size1=0.5, size2=0.5, time=2, particles=10, color1={1,0.8,0.1,1}, color2={0.5,0,0,0}, ground=0.1, width=0.1, top=0, size=3, height=0.22}
local fire = NewObject{billboard=flics.fire, movie=pMovie, restriction=kDrwCsResetRotation}

local fireparticle = CombineParticles{ratio=0.4, flic1=flics.smoke, color1={1,0.5,0,1}, color2={1,1,0.6,1}}
Fire{buffer=0.4, path=kDrwPathParabola, size2=0.4, time=2, particles=20, color1={1,0.8,0.1,1}, color2={0.5,0,0,0}, ground=0, width=0.1, top=0, size=3, height=0.8}
local fire2 = NewObject{billboard=flics.fire, movie=pMovie, restriction=kDrwCsResetRotation}

--local fire = NewObject{subobject={fire01, smoke}}
--local fire2 = NewObject{subobject={fire02, smoke}}

local lObjects = AttachToBones{object=fire2, bones={kDrwBoneRightFoot, kDrwBoneLeftFoot, kDrwBoneHead}}
local headfoot = NewObject{subobject=lObjects}

NewMovie()
Rotation{axis="y", min=90, direction=0}
local handL = NewObject{subobject=fire2, movie=pMovie, bone=kDrwBoneLeftHand, restriction=kDrwCsBone}
NewMovie()
Rotation{axis="y", min=-90, direction=0}
local handR = NewObject{subobject=fire2, movie=pMovie, bone=kDrwBoneRightHand, restriction=kDrwCsBone}

NewMovie()
Scale{min=1}
local lObjects = AttachToBones{object=fire, movie=pMovie, bones={"tail02", "tail03", "tail04", "tail05", "tail06"}}--, restriction=kDrwCsBone}
local tail = NewObject{subobject=lObjects}

LightMovie{offset={0,0,0.5}, size=2, color={0.8,0.5,0.2,0.1}}
local radiosity = Radiosity{movie=pMovie}

NewMovie()
TargetColor{max={1,0.5,0,1}, range=0.2, path=kDrwPathRandom}
NewObject{subobject={tail, headfoot, radiosity}, movie=pMovie}
EffectSave("Titan")


------------------------------------- loot
NewMovie()
TargetColor{max={0,1,0,1}, min={1,0,0,1}, range=1, path=kDrwPathCosine, play=kDrwPlayBounce, dim=kDrwDimTimeAbsolute}
NewObject{movie=pMovie}
EffectSave("Loot")

NewMovie(11)
TargetColor{max={1,0.8,0,1}, min={1,1,0.5,1}, range=0.2, path=kDrwPathCosine, play=kDrwPlayBounce, dim=kDrwDimTimeAbsolute}
Translation{min={0,0,0.05}}
FigureScale(3)
Translation{max={0,0,0.2}, path=kDrwPathParabola, trail=1, range=2}
Rotation{range=15}
Rotation{dim=kDrwDimParticle, path=kDrwPathRandom}
Rotation{axis="y", min=0, max=-90, direction=0, dim=kDrwDimParticle}
Translation{min={0.1,0,0}, max={0.5,0,0}, trail=1, range=2}
Scale{min=0.05, max=0.1, path=kDrwPathRandom, trail=1}
Color{min={1,1,0.5,1}, max=0, path=kDrwPathParabola, trail=1, range=2}
local loot = NewObject{billboard=flics.star6point, movie=pMovie, bone=kDrwBoneChest}

LightMovie{offset={0,0,0.5}, size=1.0, color={0.8,0.5,0.2,0.2}, flicker=10}
local radiosity = Radiosity{movie=pMovie, restriction=kDrwCsFloor, bone=kDrwBoneChest}

NewMovie()
Translation{min={0,0,0.5}}
Scale{min=3}
NewObject{subobject={radiosity}, movie=pMovie}
EffectSave("LootTreasure")

BodyGlow{figurescale=7, particles=3, size1=0.1, size2=0.5, radius1=0, radius2=0.1, color1={0.7,1,0.3,0.4}, color2={1,0,0,0}}
local glow = NewObject{billboard=flics.star_halo, movie=pMovie}
local lObjects = AttachToBones{object=glow, bones=GetBones{"Torso"}, restriction=kDrwCsBone}
local loot2 = NewObject{subobject=lObjects}

NewMovie()
Translation{min={0,0,0.1}}
NewObject{subobject={loot, loot2}, movie=pMovie}
-- pObject:Dump()
EffectSave("Loot")




----------------------------- pathtest
NewMovie(20)
local path
path=Path{{0.25,0},{0.5,1},{0.75,1},{1,0}}
Translation{max={1,0,0}, path=path, trail=1}
path=Path{{0.25,1},{0.5,1},{0.75,0},{1,0}}
Translation{max={0,0,1}, path=path, trail=1}
Scale{min=0.1}
NewObject{billboard=flics.circle, movie=pMovie}
EffectSave("Pathtest")


------------------------------ selectiontest
NewMovie()
Translation{min={0,0,0.2}}
Scale{min=0.1}
Rotation{min=-90, direction=0, axis="x"}
Rotation{min=-45, direction=0, axis="y"}
local part = NewObject{mesh=flics.beampointy, movie=pMovie, restriction=kDrwCsFloor}

NewMovie(8)
Rotation{dim=kDrwDimParticle}
Rotation{range=10}
Translation{min={0.5,0,0}}
Color{min={0,1,0,0.9}}
NewObject{subobject=part, movie=pMovie, restriction=kDrwCsWorld}
EffectSave("Select")


-------------------------------- decaltest
NewMovie()
Scale{min=0.12}
NewObject{decal=flics.runes, movie=pMovie}
EffectSave("Decal")


---------------------------------- bloodtest
NewMovie(7)
FigureScale(4)
Translation{min={0,0,0.0}}
Translation{max={0,0,-0.5}, path=kDrwPathParabola}
Rotation{dim=kDrwDimParticle, path=kDrwPathRandom}
Rotation{min=-40, max=40, direction=0, dim=kDrwDimParticle, axis="y"}
Translation{max={0.6,0,0}, trail=-0.2}
Rotation{min=-90, direction=0, axis="y"}
Rotation{max=130, direction=1, axis="y", trail=-1, play=kDrwPlayClamped}
Scale{min=0.5, max=1.4, dim=kDrwDimParticle, path=kDrwPathRandom}
Scale{min=0.8}
Clamp{range=1}
local blood=NewObject{mesh=flics.rock, movie=pMovie}

NewMovie()
Color{min={0.3,0.1,0,0.8}, max=0, trail=-0.2, range=1, path=kDrwPathParabola}
NewObject{subobject=blood, movie=pMovie, bone=kDrwBoneChest, restriction=kDrwCsWorld}
EffectSave("BloodRed")

NewMovie()
Color{min={0.1,0.1,0.1,0.8}, max=0, trail=-0.2, range=1, path=kDrwPathParabola}
NewObject{subobject=blood, movie=pMovie, bone=kDrwBoneChest, restriction=kDrwCsWorld}
EffectSave("BloodBlack")


---------------------------------- player color
NewMovie()
Translation{min={1,0,0}}
Color{dim=kDrwDimPlayer}
NewObject{billboard=flics.circle, movie=pMovie, bone=kDrwBoneHead}
EffectSave("Player")


NewMovie()
Rotation{}
Translation{min={1,0,0}}
Color{min={1,1,1,0.5}}
NewObject{mesh=flics.question, movie=pMovie, bone=kDrwBoneHead}
EffectSave("Test")


--------------------------- Throw Stone
NewMovie(8)
--Translation{min={0,-0.7,0}}
GlobalTrail{buffer=0.03, range=0.03, trail=-1}
Color{max=0, range=0.03, trail=-1}
Scale{min=0.5}
NewObject{mesh=flics.stones[1],  movie=pMovie, restriction=kDrwCsProjectile, bone=kDrwBoneChest, bonesource=kDrwBoneRightHand, boundingradius=30, shadow=1}
EffectSave("ThrowStone")
 
NewMovie(8)
--Translation{min={0,-0.7,0}}
GlobalTrail{buffer=0.03, range=0.03, trail=-1}
Color{min={1,0.5,0,0.8}, max={1,0,0,0}, range=0.03, trail=-1}
Scale{min=0.5}
NewObject{mesh=flics.stones[1],  movie=pMovie, restriction=kDrwCsProjectile, bone=kDrwBoneChest, bonesource=kDrwBoneRightHand, boundingradius=30, shadow=1}
EffectSave("ThrowLavaStone")

NewMovie(8)
--Translation{min={0,-0.7,0}}
GlobalTrail{buffer=0.03, range=0.03, trail=-1}
Color{min={0.3,0.5,1,0.5}, max=0, range=0.03, trail=-1}
Scale{min=0.5}
NewObject{mesh=flics.icerocks[4],  movie=pMovie, restriction=kDrwCsProjectile, bone=kDrwBoneChest, bonesource=kDrwBoneRightHand, boundingradius=30, shadow=1}
EffectSave("ThrowIceStone")


------------------------------------------------- ThrowHammer
NewMovie(8)
Translation{min={0,0,0}}
Rotation{axis="x", min=-90, direction=0}--, trail=1}
Rotation{axis="x", max=-360, range=0.3}--, trail=1}
Rotation{min=90, direction=0}
GlobalTrail{buffer=0.1, range=0.1, trail=-1}
Color{max=0, range=0.1, trail=-1}
Scale{min=0.5}
NewObject{mesh=flics.hammer,  movie=pMovie, restriction=kDrwCsProjectile, bone=kDrwBoneChest, bonesource=kDrwBoneRightHand, boundingradius=30, shadow=1}
EffectSave("ThrowHammer")

------------------------------- Aria Fountain
NewMovie()
Translation{min={0,0,-0.4}, max={0,0,0.0}, dim=kDrwDimPower}
local aria = NewObject{mesh=flics.aria, movie=pMovie}


local particle = CombineParticles{ratio=0.1, color1=0.1, color2=1, flic2=flics.circle, flic1=flics.circle}

NewMovie(44)
ChangeNumbers{min=10, max=44, dim=kDrwDimPower}
Translation{min={0, 2, 3.2}}
Translation{min={-0.1,0,0}, max={0.1,0,0}, dim=kDrwDimParticle, path=kDrwPathRandom}
Translation{min={0,0,-0.1}, max={0,0,0.1}, range=8, trail=8}
--Translation{min={-0.3,0.2,2.2}}
Translation{max={0,0,-3}, path=kDrwPathParabola, trail=1}
Translation{max={0,-1.5,0}, trail=1}
Color{min={0.3,0.5,1,0.2}, max={0.3,0.7,1,0.6}, dim=kDrwDimParticle, path=kDrwPathRandom}
Scale{min=0.5}
local ariastream = NewObject{subobject=particle, movie=pMovie}

NewObject{subobject={aria, ariastream}, mesh=flics.ariafountain, shadow=1}
EffectSave("AriaFountain")



--------------------------- Tower-Arrow
NewMovie(8)
GlobalTrail{buffer=0.03, range=0.03, trail=-1}
--Color{max=0, dim=kDrwDimParticle}
Color{max=0, range=0.03, trail=-1}
Scale{min=2.5}
NewObject{mesh=flics.arrow,  movie=pMovie, restriction=kDrwCsProjectile, bonesource="Shoot", bone=kDrwBoneChest, boundingradius=30, shadow=1}
EffectSave("ArrowTower")



--------------------------------- Obelix
local obelisk = NewObject{mesh=flics.obelisk}

NewMovie()
Translation{min={0,0.3,2.6}}
Rotation{max=-360, range=26}
Scale{min={1.1,1.1,100}}
Color{min=0.1}
local cyl1 = NewObject{mesh=flics.cylinder_stripes, movie=pMovie}

NewMovie()
Translation{min={0,0.3,2.6}}
Rotation{range=29.1}
Scale{min={1.1,1.1,100}}
Color{min=0.1}
local cyl2 = NewObject{mesh=flics.cylinder_stripes, movie=pMovie}

NewMovie()
Translation{min={0,0.3,9}}
Rotation{}
Rotation{axis="y", min=-5, max=5, play=kDrwPlayBounce, path=kDrwPathCosine, range=5, direction=0}
Rotation{max=-360, range=12}
Translation{max={0,0,0.1}, play=kDrwPlayBounce, path=kDrwPathCosine, range=0.9}
Translation{max={0,0,-0.1}, play=kDrwPlayBounce, path=kDrwPathCosine, range=1.6}
local crystal = NewObject{mesh=flics.crystal, movie=pMovie}

LightMovie{offset={0,0.3,9}, size=1.5, deviation=0.1, color={0.0,0.5,1,0.4}}
local radiosity = Radiosity{movie=pMovie}


NewObject{subobject={cyl1, cyl2, crystal, radiosity}, boundingradius=30}
EffectSave("Obelisk")


NewMovie()
Translation{min={0,0,2.6}}
Rotation{max=-360, range=26}
Scale{min={1.1,1.1,100}}
Color{min={0.4,0.5,1,0.3}}
local cyl1 = NewObject{mesh=flics.cylinder_stripes, movie=pMovie}

NewMovie()
Translation{min={0,0,2.6}}
Rotation{range=29.1}
Scale{min={1.1,1.1,100}}
Color{min={0.3,0.3,1,0.3}}
local cyl2 = NewObject{mesh=flics.cylinder_stripes, movie=pMovie}

NewObject{subobject={cyl1, cyl2}, boundingradius=30}
EffectSave("ObeliskBeam")


----------------------------------------------------------------- Melee -Abilities
NewMovie()
Rotation{range=5, direction=-1, max=-360}
Color{min={1,0.9,0.2,1}}
Scale{min=1.3}
NewObject{decal=flics.decal_berserk, movie=pMovie}
EffectSave("DecalBerserk")

NewObject{decal=flics.decal_blessing, movie=pMovie}
EffectSave("DecalBlessing")
NewObject{decal=flics.decal_trueshot, movie=pMovie}
EffectSave("DecalTrueshot")
NewObject{decal=flics.decal_salvo, movie=pMovie}
EffectSave("DecalSalvo")
NewObject{decal=flics.decal_steelskin, movie=pMovie}
EffectSave("DecalSteelskin")
NewObject{decal=flics.decal_durability, movie=pMovie}
EffectSave("DecalDurability")
NewObject{decal=flics.decal_shelter, movie=pMovie}
EffectSave("DecalShelter")
NewObject{decal=flics.decal_shiftlife, movie=pMovie}
EffectSave("DecalShiftLife")
NewObject{decal=flics.decal_riposte, movie=pMovie}
EffectSave("DecalRiposte")
NewObject{decal=flics.decal_criticalhits, movie=pMovie}
EffectSave("DecalCriticalHits")





-------------------------------------------------------------------- tower mental
local tower = NewObject{mesh=flics.tower_mental}

NewMovie()
--Translation{min={0,0,8}}
Rotation{range=10, play=kDrwPlayBounce, path=kDrwPathCosine}
Rotation{range=4, play=kDrwPlayBounce, path=kDrwPathCosine}
Rotation{axis="x", min=-30, max=30, range=3, play=kDrwPlayBounce, path=kDrwPathCosine, direction=1}
local eye = NewObject{mesh=flics.tower_mental_eye, movie=pMovie}

NewObject{subobject={eye}, bone="Shoot"}
EffectSave("TowerMentalIdle")

NewMovie()
Rotation{min=180, direction=0}
NewObject{mesh=flics.tower_mental_eye, bonesource="Shoot", bone=kDrwBoneHead, restriction=kDrwCsAim, movie=pMovie}
EffectSave("TowerMentalCast")

NewMovie()
Scale{min=0.4}
Rotation{min=180, direction=0}
NewObject{mesh=flics.tower_mental_eye, bonesource=kDrwBoneHead, bone=kDrwBoneHead, restriction=kDrwCsAim, movie=pMovie}
EffectSave("Resident")


function Resident()
	TestEffect{effect="Resident", time=10000, figure=1, source=2}
end


------------------------------------------------------------------- Animals
local nAnimals = 10
local Animals = {}

function Cow(iAnimal)
	NewMovie()
	Translation{min={0,-1.5,0}}
	Rotation{min=180 -30 + 60 * iAnimal / %nAnimals, direction=0}
	Animation{file="figure_animal_cattle_normal_idle", range=15, dim=kDrwDimTimeAbsolute, start=iAnimal * 15/%nAnimals}
	return NewObject{skin=flics.cow, movie=pMovie, shadow=1, restriction=kDrwCsObject}
end

function Pig(iAnimal)
	NewMovie()
	Rotation{min=360 * iAnimal / %nAnimals, direction=0}
	Animation{file="figure_animal_wildboar_normal_idle", range=13, dim=kDrwDimTimeAbsolute, start=iAnimal * 13/%nAnimals}
	return NewObject{skin=flics.pig, movie=pMovie, shadow=1, restriction=kDrwCsObject}
end

function Boar(iAnimal)
	NewMovie()
	Translation{min={-0.8,0,0}}
	Rotation{min=-90 - 20 + 40 * iAnimal / %nAnimals, direction=0}
	Animation{file="figure_animal_wildboar_normal_idle", range=13, dim=kDrwDimTimeAbsolute, start=iAnimal * 13/%nAnimals}
	return NewObject{skin=flics.boar, movie=pMovie, shadow=1, restriction=kDrwCsObject}
end



for iAnimal = 1,nAnimals do
	Animals[iAnimal] = Cow(iAnimal)
end

NewMovie()
Choose{dim=kDrwDimParticle, path=kDrwPathRandom}
NewObject{subobject=Animals, movie=pMovie}
EffectSave("Cow")

for iAnimal = 1,nAnimals do
	Animals[iAnimal] = Pig(iAnimal)
end

NewMovie()
Choose{dim=kDrwDimParticle, path=kDrwPathRandom}
NewObject{subobject=Animals, movie=pMovie}
EffectSave("Pig")


for iAnimal = 1,nAnimals do
	Animals[iAnimal] = Boar(iAnimal)
end

NewMovie()
Choose{dim=kDrwDimParticle, path=kDrwPathRandom}
NewObject{subobject=Animals, movie=pMovie}
EffectSave("Boar")

--------------------------------------------- Level Stars
NewMovie(5)
Translation{min={0,0,0.2}}
Translation{max={0,0,0.5}, dim=kDrwDimParticle}
Rotation{}
Scale{min=0.1}
NewObject{billboard=flics.star6point, movie=pMovie, bone=kDrwBoneCrown}
EffectSave("LevelA")

NewMovie(2)
Rotation{max=360, dim=kDrwDimParticle}
local star2sided= NewObject{mesh=flics.star6point, movie=pMovie}


NewMovie(5)
Translation{min={0,0,0.2}}
Translation{max={0,0,0.5}, dim=kDrwDimParticle}
Rotation{trail=1, range=2}
Scale{min=0.1}
NewObject{subobject=star2sided, movie=pMovie, bone=kDrwBoneCrown}
EffectSave("LevelB")

NewMovie(5)
ChangeNumbers{dim=kDrwDimPower}
Rotation{axis="z", min=-60, direction=0}
Rotation{axis="z", max=-150, dim=kDrwDimParticle, direction=1}
Translation{min={0,0.2,0}}
Rotation{axis="x", range=2, trail=0.5}
Scale{min=0.1}
Color{min={1,1,0.5,1}}
NewObject{subobject=star2sided, movie=pMovie, bone=kDrwBoneCrown, restriction=kDrwCsBone}
EffectSave("LevelC")

NewObject{billboard=flics.star6point, movie=pMovie, bone=kDrwBoneCrown, restriction=kDrwCsBone}
EffectSave("LevelD")


--------------------------------------------- Blitzwesen
local Bones={}
local lightning = Lightning{range=0.1, mode=10, flic=flics.simplelightning}


NewMovie()
TargetColor{min=0.2}
Color{min={0, 0, 0.8, 0.5}, max={0.2,0.4, 1, 0.5}, range=1, path=kDrwPathRandom}
Rotation{axis="x", min=-90, direction=0}
Scale{min={0.7,0.7,0.5}}


--local params = {radius=1, time=0.2, flashcolor={1,1,1,1}}
--local lightning = FlashSphere{params}

--NewMovie()
--Translation{min={0,0.5,0}}
--local lightning = NewObject{subobject=lightning, movie=pMovie}

--NewMovie()
--TargetColor{min=0}
--Scale{min={0.1,1,0.1}}
--Color{min={0.5, 0.5, 1, 0.9}}--, max={0.5,0.5, 1, -12}, range=1, path=kDrwPathParabola}

Bones[1] = NewObject{bonesource=kDrwBoneLeftHand, bone=kDrwBoneLeftEllbow, subobject=lightning, movie=pMovie, restriction=kDrwCsSpan}
Bones[2] = NewObject{bonesource=kDrwBoneLeftEllbow, bone=kDrwBoneLeftShoulder, subobject=lightning, movie=pMovie, restriction=kDrwCsSpan}
Bones[3] = NewObject{bonesource=kDrwBoneLeftFoot, bone=kDrwBoneLeftThigh, subobject=lightning, movie=pMovie, restriction=kDrwCsSpan}
--Bones[4] = NewObject{bonesource=kDrwBoneLeftKnee, bone=kDrwBoneLeftThigh, subobject=lightning, movie=pMovie, restriction=kDrwCsSpan}

Bones[5] = NewObject{bonesource="l sense 01", bone="l sense", subobject=lightning, movie=pMovie, restriction=kDrwCsSpan}
Bones[6] = NewObject{bonesource="l sense", bone=kDrwBoneRightShoulder, subobject=lightning, movie=pMovie, restriction=kDrwCsSpan}
Bones[7] = NewObject{bonesource=kDrwBoneRightFoot, bone=kDrwBoneRightThigh, subobject=lightning, movie=pMovie, restriction=kDrwCsSpan}
--Bones[8] = NewObject{bonesource=kDrwBoneRightKnee, bone=kDrwBoneRightThigh, subobject=lightning, movie=pMovie, restriction=kDrwCsSpan}

Bones[9] = NewObject{bonesource=kDrwBoneLeftThigh, bone=kDrwBoneRightThigh, subobject=lightning, movie=pMovie, restriction=kDrwCsSpan}
Bones[10] = NewObject{bonesource=kDrwBoneLeftShoulder, bone=kDrwBoneRightShoulder, subobject=lightning, movie=pMovie, restriction=kDrwCsSpan}

Bones[11] = NewObject{bonesource=kDrwBoneMain, bone=kDrwBoneChest, subobject=lightning, movie=pMovie, restriction=kDrwCsSpan}
Bones[12] = NewObject{bonesource=kDrwBoneLeftShoulder, bone=kDrwBoneChest, subobject=lightning, movie=pMovie, restriction=kDrwCsSpan}
Bones[13] = NewObject{bonesource=kDrwBoneRightShoulder, bone=kDrwBoneChest, subobject=lightning, movie=pMovie, restriction=kDrwCsSpan}
Bones[14] = NewObject{bonesource="head 01", bone="head 02", subobject=lightning, movie=pMovie, restriction=kDrwCsSpan}

NewObject{subobject=Bones}
EffectSave("Blitzwesen")

function Blitzwesen()
	TestEffect{time=1000, figure=1, source=1, effect="Blitzwesen"}
end



------------------------------------------------------------------ Avatar/Hero -Glow
NewMovie()
Scale{min=0.5}
Color{dim=kDrwDimPlayer}
local glow = NewObject{billboard=flics.blurry, movie=pMovie}

NewMovie()
Color{min=0.5}
local lObjects = AttachToBones{object=glow, bones=GetBones{"Arms", "Legs"}, restriction=kDrwCsBone, movie=pMovie}
local aura = NewObject{subobject=lObjects}
EffectSave("Aura")


NewMovie(3)
Scale{min=0.6, max=0.02, trail=1}
Color{min=0, max=1, trail=1}
NewObject{subobject=glow, movie=pMovie}
EffectSave("AuraRing")


NewMovie()
Translation{min={0,0,0.10}}
Color{dim=kDrwDimPlayer}
Scale{min=0.45}
Rotation{axis="x", min=-90, direction=0}
local ring = NewObject{mesh=flics.fadein, movie=pMovie, restriction=kDrwCsWorld+kDrwCsFloor, bone=kDrwBoneMain}
EffectSave("Aura2")

NewMovie()
Color{range=0.5, min=0.3, max=1, play=kDrwPlayBounce, path=kDrwPathCosine}
NewObject{subobject=ring, movie=pMovie}
EffectSave("Aura2Avatar")

NewMovie()
Translation{min={0,0,0.10}}
Color{dim=kDrwDimPlayer}
Scale{min=0.9}
Rotation{axis="x", min=-90, direction=0}
local ring = NewObject{mesh=flics.fadein, movie=pMovie, restriction=kDrwCsWorld+kDrwCsFloor, bone=kDrwBoneMain}
EffectSave("Aura2Titan")


NewObject{subobject={aura, ring}}
EffectSave("Aura3")

NewMovie()
Color{dim=kDrwDimPlayer}
Scale{min=0.6}
local glow = NewObject{decal=flics.playerdecal, movie=pMovie, restriction=kDrwCsWorld}
EffectSave("Aura4")


-----------------------------------------------------------------
NewMovie()
Color{min=1}
local portal = NewObject{mesh=flics.portal_time, movie=pMovie}

local whirl = Whirlwind{startcolor={0.5,0,0,1}, stopcolor={0.0,0.5,1,0.0}}
NewMovie()
Translation{min={0,0,6}}
local whirlwind = NewObject{subobject=whirl, movie=pMovie, bone=kDrwBoneChest}


NewMovie(2)
Translation{min={-0.15,0,2.95}}
Translation{max={0.3,0,0}, range=5, play=kDrwPlayBounce, path=kDrwPathCosine, trail=2}
Translation{max={0,0,-0.08}, range=7, play=kDrwPlayBounce, path=kDrwPathCosine, trail=2}
--Translation{max={0,-0.1,0}, dim=kDrwDimParticle}
Rotation{axis="y", dim=kDrwDimParticle}
Color{min={0.6,0.0,0,0.2}}
Scale{min={1.7,1,3}}
local caustic = NewObject{mesh=flics.caustic1, movie=pMovie}

NewMovie(2)
Translation{min={0,0.2,0}}
Scale{min={2.1,2.1,1.53}}
Rotation{dim=kDrwDimParticle}
local caustic = NewObject{subobject=caustic, movie=pMovie}

NewObject{subobject={whirlwind, caustic}, boundingradius=15}
EffectSave("PortalTime")

---------------------------------------------------------------- Bindstone Defense
local lightning = Lightning{range=0.08, flic=flics.simplelightning, mode=0}
NewMovie()
Rotation{axis="x", min=-90, direction=0}
Scale{min=0.5}
lightning = NewObject{subobject=lightning, movie=pMovie}

NewMovie()
Color{min={1,0,0,1}, max={1,0,0,0}, dim=kDrwDimTimeScaled, path=kDrwPathParabola}
Scale{min=0, max=1, range=0.5, play=kDrwPlayClamped}
local zap = NewObject{subobject=lightning, movie=pMovie, bone=kDrwBoneChest, restriction=kDrwCsSpan+kDrwCsSwap}
EffectSave("BindstoneResolve")

Fire{color1={0.2,0.6,0.3,1}, color2={1,0,0,0.2}, buffer=0.2, particles=11, size=0.5, size1=1, size2=0.5, height=1.5, width=0.3, ground=0.2, top=0}
Translation{min={0,0,2}, min={0,0,1}, dim=kDrwDimTimeScaled}
Scale{min=8, max=1, range=1, dim=kDrwDimTimeScaled}
NewObject{billboard=flics.star_halo, movie=pMovie, restriction=kDrwCsProjectile+kDrwCsFloor+kDrwCsSwap}
EffectSave("BindstoneResolve")


local light = NewLight(gNoMove, {Att1 = 1, Att2 = 1})

NewMovie()
Rotation{range=0.5}
Color{min={0.5,0,1,1}}
Translation{min={-2,0,4}, max={2,0,4}, path=kDrwPathRandom, range=10}
Scale{min=4}
NewObject{light=light, movie=pMovie}
EffectSave("Bindstone")


BodyGlow{powerscale=1, figurescale=2, particles=7, size1=0, size2=1.8, radius1=0, radius2=0, color1={1,1,1,1}, color2={1,1,1,0}}
FadeScale{fadein=0.1, fadeout=0.1, path=kDrwPathLinear}
local glow = NewObject{billboard=flics.particles01, movie=pMovie}
local lObjects = AttachToBones{object=glow, bones=GetBones("Torso"), restriction=kDrwCsBone}
local particleglow = NewObject{subobject=lObjects}
EffectSave("ParticleGlow")
EffectSave("BindstoneHit")


-------------------------------------------------------- ADDON
local particle = CombineParticles{flic2=flics.smoke, ratio=1, flic1=flics.plasma, color1={1,0,0,0.3}, color2=1}
--Fire{buffer=0.5, time=1, path=kDrwPathParabola, particles=11, size1=5, size2=0.5, ground=0.5, width=0, top=0, size=1, height=-5, color1=1, color2=0}

Fire{buffer=0.3, time=1, path=kDrwPathParabola, particles=11, size1=3.7, size2=0.5, ground=0.5, width=0, top=0, size=0.7, height=-10, color1={1,0.6,0,0.8}, color2={0,0,0,0.4}}
--local firetest = NewObject{billboard=flics.smoke, movie=pMovie}
local firetest = NewObject{subobject=particle, movie=pMovie}

local lLeft = AttachToBones{object=firetest, bones={"wing_upperarm_l", "wing_elbow_wrist_add_l", "wing_elbow_l", "wing_wrist_l", "wing_thumb_01_l", "wing_thumb_02_l", "wing_thumb_03_l"}}
--local lLeft = AttachToBones{object=firetest, bones={"wing_elbow_l", "wing_wrist_l", "wing_thumb_01_l", "wing_thumb_02_l", "wing_thumb_03_l"}}

local lRight = AttachToBones{object=firetest, bones={"wing_upperarm_r", "wing_elbow_wrist_add_r", "wing_elbow_r", "wing_wrist_r", "wing_thumb_01_r", "wing_thumb_02_r", "wing_thumb_03_r"}}

local left = NewObject{subobject=lLeft}
local right = NewObject{subobject=lRight}
NewObject{subobject={left, right}}
EffectSave("Wing")





local stone = NewObject{mesh=flics.dragonstone}

Smoke{time=5, particles=33, offset={0.5,0.2,3.5}, growth=1, velocity={1,0,2}, gravity={0,0,-7}, color1={0.3,0.6,1,0.0}, color2={0.3,0.6,1,0.5}}
local smoke= NewObject{billboard=flics.circle, movie=pMovie}

NewMovie(13)
Rotation{range=25}
Translation{min={0,0,3}}
Throw{trail=0, velocity={0,0,1}, gravity={0,0,-3}, time=3}
Burst{radius1=0.5, radius2=2.8, trail=1, time=3}
Color{min={0.1,0.5,1,0.8}, max=0, trail=1, range=3}
Scale{min=0.1}
local burst=NewObject{billboard=flics.star_halo, movie=pMovie}

local ice=NewObject{subobject={smoke, burst}}
EffectSave("DragonStone")




local particle = CombineParticles{flic2=flics.smoke, ratio=0.5, flic1=flics.plasma, color1=1, color2=1}

NewMovie(44)
Rotation{axis="y", dim=kDrwDimParticle, path=kDrwPathRandom}
Translation{min={0.1,0,0}, max={0.6,0,0}, range=0.5, trail=1, dim=kDrwDimTimeScaled, path=kDrwPathCosine, play=kDrwPlayBounce}
Translation{max={0,-10,0}, trail=1, range=1}--, path=kDrwPathNegParabola}
GlobalTrail{buffer=1, trail=1}
Color{min={0.2,0.6,1,1}, max=0, trail=1, range=1}
Scale{min=0.3, max=1, path=kDrwNegParabola, trail=1, range=1}
Scale{min=2.5}
Scale{min=1, max=0, dim=kDrwDimTimeToEnd, trail=-1, range=0.1, start=-0.1, path=kDrwPathParabola, play=kDrwPlayClamped}

local firetest = NewObject{subobject=particle, movie=pMovie, restriction=kDrwCsSwap+kDrwCsObject, bone="jaw2"}
--local firetest = NewObject{billboard=flics.plasma, movie=pMovie, restriction=kDrwCsSwap+kDrwCsObject, bone="jaw2"}
EffectSave("DragonBreathIce")



local particle = CombineParticles{flic2=flics.smoke, ratio=1, flic1=flics.particles01, color1=0.3, color2={0.2,0.4,1,1}}
Fire{buffer=1,time=1, particles=44, size1=0.2, size2=2, ground=0, width=0.2, top=0.5, size=1, height=10, color1=0.6, color2=0}
Scale{min=1, max=0, dim=kDrwDimTimeToEnd, trail=-1, range=0.1, start=-0.1, path=kDrwPathParabola, play=kDrwPlayClamped}
local firetest = NewObject{subobject=particle, movie=pMovie}

NewMovie()
Rotation{min=90, direction=0, axis="x"}
NewObject{subobject=firetest, movie=pMovie, restriction=kDrwCsSwap+kDrwCsObject, bone="jaw2"}
EffectSave("DragonBreathIce")
