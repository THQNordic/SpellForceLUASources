gObjects = {}

-------------------------------------------------------------------------- resolve elemental
function CastElementalResolve(params)
	-- colored ring
	local lTime = 1
	NewMovie(1)
	Translation{min={0,0,1.2}}
	Scale{min={0.0, 1, 0.0}, max={3,3,3}, play=kDrwPlayClamped, dim = kDrwDimTimeScaled}
	local color = params.ringcolor
	Color{min={1,1,1,color[4]}, max={color[1], color[2], color[3], 0.0}, play=kDrwPlayClamped, dim = kDrwDimTimeScaled}

	NewObject{billboard=flics.ring2, movie=pMovie}
end

------------------------------------------------------------- standard resolve
CastElementalResolve{ringcolor={1,1,1,1}}
EffectSave("Resolve")

CastElementalResolve{ringcolor={1,1,0,1}}
EffectSave("ResolveYellow")


function CastBlackResolve(params)                        -------------------- old black resolve
	local lTime = 1
	-- beam cage from ground (not used)
	NewMovie(5)
	Rotation{dim=kDrwDimParticle}
	--Rotation{range=0.4}
	Translation{min={-1.5,0,0}}
	Rotation{axis="y", min=105, max=0, direction=1, range=lTime, play=kDrwPlayClamped}
	Rotation{axis="x", min=90, max=90, direction=0}

	Scale{min={5,0.8,0.8}}
	local color = params.color
	Color{min={color[1], color[2], color[3],0.5}, max={color[1], color[2], color[3],0}, range=lTime, play=kDrwPlayClamped, path=kDrwPathCosine, start= -lTime, dim=kDrwDimTimeToEnd}
	gObjects[4] = NewObject{mesh=(params.flic or flics.beampointy2), movie=pMovie}
	
	-- bats
	local lParticles=params.particles * 2
	local lDuration=1
	local lTrail=1
	NewMovie(lParticles)
	Translation{min={0,0,0}, max={0,0,5}}
	Burst{radius1=1, radius2=1, trail=0}
	Translation{min={0,0,0}, max={2,0,0}}
	Color{min={0,0,0,0.8}, max={0,0,0,0.1}, play=kDrwPlayClamped, path=kDrwPathParabola, dim=kDrwTimeScaled}
	Scale{min={0,0,0}, max={0.4,0.4,0.4}, range=0.2, play=kDrwPlayClamped}
	Choose{range=0.2, trail=0.01}
	gObjects[1] = NewObject{billboard=flics.bat, movie = pMovie, restriction=kDrwCsResetRotation}

	-- smoke
	lParticles=params.particles
	lDuration=1
	lTrail=1
	NewMovie(lParticles)
	Rotation{dim=kDrwDimParticle, path=kDrwPathRandom}
	Translation{min={0,0,-1}, max={0,0,3}, range=lDuration, trail=lTrail}
	Translation{min={1,0,0}, max={2,0,0}, range=lDuration, trail=lTrail, path=kDrwPathCosine}
	Color{min={0,0,0,1}, max={0,0,0,0.1}, range=lDuration, trail=lTrail, path=kDrwPathParabola}
	--Scale{min={0,0,0}, max={1.5,1.5,1.5}, range=2, play=kDrwPlayClamped}
	Scale{min={1,1,1}, max={0,0,0}, range=lTime, start=-lTime, dim=kDrwDimTimeToEnd, play=kDrwPlayClamped}
	gObjects[2] = NewObject{billboard=flics.circledark, movie = pMovie}

	-- hole in ground
	-- skull
	NewMovie(1)
	Translation{min={0,0,2.5}}
	local color = params.color
	Color{min={1,1,1, color[4]}, max={color[1], color[2], color[3],0.0}, play=kDrwPlayClamped, dim=kDrwDimTimeScaled}
	Scale{min={0,0,0}, max={3,3,3}, play=kDrwPlayClamped, dim=kDrwDimTimeScaled}
	gObjects[3] = NewObject{billboard=flics.skull, movie = pMovie, restriction=kDrwCsResetRotation}

	NewObject{subobject={gObjects[1], gObjects[2], gObjects[3]}, light=lights.midrotatered}
end

--CastBlackResolve{particles = 8, color = {0.1,0.1,0.2,0.7}}
--EffectSave("ResolveBlackSilent")


--------------------------------------------------------------- Black resolve
local lightning = Lightning{range=0.08, flic=flics.simplelightning, mode=0}
NewMovie()
Rotation{axis="x", min=-90, direction=0}
Scale{min=0.5}
lightning = NewObject{subobject=lightning, movie=pMovie}

NewMovie()
Color{min={0.8,0.5,0.2,1}, max={0.8,0.5,0.2,0}, dim=kDrwDimTimeScaled, path=kDrwPathParabola}
Scale{min=0, max=1, range=0.1, start=0.5, play=kDrwPlayClamped}
local right = NewObject{subobject=lightning, movie=pMovie, bone=kDrwBoneChest, bonesource=kDrwBoneRightHand, restriction=kDrwCsSpan}
local left = NewObject{subobject=lightning, movie=pMovie, bone=kDrwBoneChest, bonesource=kDrwBoneLeftHand, restriction=kDrwCsSpan}
NewObject{subobject={right,left}}
EffectSave("ResolveBlackSilent")

NewObject{subobject=lightning, movie=pMovie, bone=kDrwBoneChest, bonesource="Shoot", restriction=kDrwCsSpan}
EffectSave("ResolveBlackTower")


------------------------------------------------------------------ Resolve Mental
function CastMentalResolve(params)
	local lTime = 1

	--Flash Circle
	NewMovie(1)
	Scale{min={0,0,0}, max={2,2,2}, range=0.1, play=kDrwPlayClamped}
	Color{min={1,1,1,0.8}, max={1,1,1,0}, range=lTime, play=kDrwPlayClamped, path=kDrwPathParabola}
	flashcenter = NewObject{billboard=flics.circle, movie=pMovie}

	--Flash Beam
	local lDuration=0.2
	NewMovie(1)
	Scale{min={0,0,0}, max={4,0.1,0.1}, range=lDuration, play=kDrwPlayClamped}
	Color{min={1,1,1,0.8}, max={1,1,1,0}, range=lTime - lDuration, start=lDuration, play=kDrwPlayClamped, path=kDrwPathParabola}
	flash = NewObject{billboard=flics.diamond, movie=pMovie, restriction=kDrwCsResetRotation}


	local ring1 = NewObject{mesh=flics.hypno}
	NewMovie()
	Rotation{axis="x", min=90, max=90, direction=0}
	Scale{min={1,1,0.1}}
	local ring2 = NewObject{mesh=flics.cylinder, movie=pMovie}
	local mix = NewObject{subobject={ring1, ring2}}

	NewMovie(13)
	Translation{max={0,1,0}, trail=-1}
	Scale{min=0.8, max=0.3, trail=-1}
	Color{max={1,1,0,0.4}, min={0,1,0.5,0.4}, dim=kDrwDimParticle}-- range=1, trail=-1}
	FadeScale{fadeout=0.2, fadein=0}

	local rings=NewObject{billboard=flics.ring, movie=pMovie}

	return rings
end


NewObject{subobject=CastMentalResolve{}, bonesource=kDrwBoneCrown, bone=kDrwBoneHead, restriction = kDrwCsSpan}
EffectSave("ResolveMentalSilent")

NewObject{subobject=CastMentalResolve{}, bonesource="Shoot", bone=kDrwBoneHead, restriction = kDrwCsSpan}
EffectSave("ResolveMentalTower")

-------------------------------------------- burst from hands
function ResolveBurst(params)
	local color1	=(params.color1 or {1,1,1,0})		--initial and final particle color
	local color2	=(params.color2 or {1,1,1,0.4})		--middle particle color

	Smoke{moveable=0, time=0.4, particles=22, gravity={-1.5,0.5,0}, offset={-0.5,-0.3,0}, velocity={5,0.7,0}, axis="x", color2=color2, color1=color1, growth=0.1}
	Scale{min=1, max=1.2, range=0.5, play=kDrwPlayBounce}
	Scale{min=0.9, max=1.1, path=kDrwPathRandom, range=0.1*100}
	Clamp{range=1, fadeout=0.4}

	return pMovie
end

local FlameThrow = ResolveBurst{}

---------------------------------------------------------------------------		fire resolve enemy
NewMovie()
Translation{min={0,0,0}, max={1,0,0}, range=0.5, start=0.5, play=kDrwPlayClamped}
Scale{min=0.2, max=1, range=0.8, play=kDrwPlayClamped, path=kDrwPathParabola}
Clamp{range=1}
local ScaleInOut=pMovie

local burst = NewObject{billboard=flics.solar, movie=FlameThrow}

Cloud{particles=11, time=1.0, velocity={0,0,1}, size=0.1, color1={0.3,0,0,1}, color2={0,0,0,0}}
local dust = NewObject{billboard=flics.fog, movie=pMovie}

local burstcloud = NewObject{subobject={dust,burst}}

local lObjects = AttachToBones{movie=ScaleInOut, object=burstcloud, bones={kDrwBoneRightHand, kDrwBoneLeftHand}, restriction=kDrwCsBone}
NewObject{subobject=lObjects}
EffectSave("ResolveFireSilent")

local burst = NewObject{billboard=flics.sol_br, movie=FlameThrow}
local lObjects = AttachToBones{object=burst, bones={kDrwBoneRightHand}, restriction=kDrwCsBone}
NewObject{subobject=lObjects}
EffectSave()

local burst = NewObject{billboard=flics.sol_bg, movie=FlameThrow}
local lObjects = AttachToBones{object=burst, bones={kDrwBoneRightHand}, restriction=kDrwCsBone}
NewObject{subobject=lObjects}
EffectSave()

---------------------------------------------------------------------------	earth resolve enemy
local burst = NewObject{billboard=flics.sol_gy, movie=FlameThrow}

Cloud{particles=11, time=1.0, velocity={0,0,1}, size=0.1, color1={0.8,0.5,0,0.5}, color2={0,0,0,0}}
local dust = NewObject{billboard=flics.circle, movie=pMovie}

local burstcloud = NewObject{subobject={dust,burst}}

local lObjects = AttachToBones{movie=ScaleInOut, object=burstcloud, bones={kDrwBoneRightHand, kDrwBoneLeftHand}, restriction=kDrwCsBone}
NewObject{subobject=lObjects}
EffectSave("ResolveEarthSilent")


local burst = NewObject{billboard=flics.sol_rp, movie=FlameThrow}
local lObjects = AttachToBones{object=burst, bones={kDrwBoneRightHand}, restriction=kDrwCsBone}
NewObject{subobject=lObjects}
EffectSave()

local burst = NewObject{billboard=flics.sol_pb, movie=FlameThrow}
local lObjects = AttachToBones{object=burst, bones={kDrwBoneRightHand}, restriction=kDrwCsBone}
NewObject{subobject=lObjects}
EffectSave()


------------------------------------------------------------------------------ white resolve enemy
ResolveBurst{color2={1,1,1,0.2}, color1={0.5,0.5,0.5,0}}
Scale{min=2}
gObjects[1] = NewObject{billboard=flics.star6point, movie=pMovie}

NewMovie()
Rotation{axis="z", min=-90, max=-90, direction=0}
gObjects[2] = NewObject{subobject=gObjects[1], movie=pMovie}
gObjects[3] = AttachToBones{object=gObjects[2], bones={kDrwBoneChest}}
NewObject{subobject=gObjects[3]}
EffectSave("ResolveWhiteSilent")



function ResolveDistant(params)
	local particles = params.particles or 10
	local size1		= params.size1 or 1
	local size2		= params.size2 or 0.5
	local color1	= params.color1 or 1
	local color2	= params.color2 or 0
	local distance	= params.distance or 1

	NewMovie(particles)
	Translation{max={0,distance,0}, trail=-1}
	Scale{min=size1, max=size2, trail=-1}
	Color{max=color2, min=color1, dim=kDrwDimParticle}-- range=1, trail=-1}
	FadeScale{fadeout=0.2, fadein=0}
	return pMovie
end


local resolvemovie 
local resolve1 
local resolve2 

resolvemovie = ResolveDistant{distance=3, color1={1,0.8,0,0.7}, color2={1,0.2,0,0.4}}
resolve1 = NewObject{billboard=flics.smoke, movie=resolvemovie, restriction = kDrwCsAim, bonesource=kDrwBoneRightHand, bone=kDrwBoneChest}
resolve2 = NewObject{billboard=flics.smoke, movie=resolvemovie, restriction = kDrwCsAim, bonesource=kDrwBoneLeftHand, bone=kDrwBoneChest}
NewObject{subobject={resolve1, resolve2}}
EffectSave("ResolveFireSilent")

resolvemovie = ResolveDistant{particles=10, distance=1, color1={0.3,0.3,1,0.3}, color2={0.7,0.7,1,0}}
resolve1 = NewObject{billboard=flics.star_halo, movie=resolvemovie, restriction = kDrwCsSpan, bonesource=kDrwBoneRightHand, bone=kDrwBoneChest}
resolve2 = NewObject{billboard=flics.star_halo, movie=resolvemovie, restriction = kDrwCsSpan, bonesource=kDrwBoneLeftHand, bone=kDrwBoneChest}
NewObject{subobject={resolve1, resolve2}}
EffectSave("ResolveIceSilent")

resolvemovie = ResolveDistant{particles=20, distance=1, color1={0.3,0.3,1,1}, color2={0.7,0.7,1,0}}
NewObject{billboard=flics.star_halo, movie=resolvemovie, restriction = kDrwCsSpan, bonesource="Shoot", bone=kDrwBoneChest}
EffectSave("ResolveIceTowerSilent")

resolvemovie = ResolveDistant{distance=3, color1={0.6,0.4,0.1,0.8}, color2={0.3,0.2,0.1,0.2}}
resolve1 = NewObject{billboard=flics.smoke, movie=resolvemovie, restriction = kDrwCsAim, bonesource=kDrwBoneRightHand, bone=kDrwBoneChest}
resolve2 = NewObject{billboard=flics.smoke, movie=resolvemovie, restriction = kDrwCsAim, bonesource=kDrwBoneLeftHand, bone=kDrwBoneChest}
NewObject{subobject={resolve1, resolve2}}
EffectSave("ResolveEarthSilent")


NewMovie()
Rotation{axis="x",min=-90, direction=0}
Scale{min={0.2,0.2,0}, max={0.2,0.2,1}, path=kDrwPathNegParabola, dim=kDrwDimTimeScaled, play=kDrwPlayClamped, range=0.5}
Color{min=1, max=0, path=kDrwPathParabola, dim=kDrwDimTimeScaled}

NewObject{mesh=flics.cylinder_stripes, movie=pMovie, restriction = kDrwCsSpan, bonesource="Shoot", bone=kDrwBoneChest}
EffectSave("ResolveWhiteTowerSilent")

resolve1 = NewObject{mesh=flics.cylinder_stripes, movie=pMovie, restriction = kDrwCsSpan, bonesource=kDrwBoneRightHand, bone=kDrwBoneChest}
resolve2 = NewObject{mesh=flics.cylinder_stripes, movie=pMovie, restriction = kDrwCsSpan, bonesource=kDrwBoneLeftHand, bone=kDrwBoneChest}
NewObject{subobject={resolve1, resolve2}}
EffectSave("ResolveWhiteSilent")

NewMovie()
Color{min={1,0.3,0.7,1}}
NewObject{subobject={resolve1, resolve2, right, left}, movie=pMovie, boundingradius = 20}
EffectSave("SupportBelial")

------------------------------------------------------- wave projectiles
function ResolveProjectile(params)
	local color1	= params.color1 or 1
	local color2	= params.color2 or 1
	local bonesource= params.bonesource or kDrwBoneChest
	local particle  = params.particle or flics.star6point

	--local particle = CombineParticles{ratio=0.4, flic1=flics.smoke, color1=color1, color2=color2}
	Fire{particles=11, color1=color1, color2=color2, ground=0, width=0.2, top=0, size=0.7, size1=1.5, size2=0, height=5}
	local fire = NewObject{billboard=particle, movie=pMovie}

	NewMovie()
	Rotation{min=90, axis="x", direction=0}
	local fire2 = NewObject{subobject=fire, movie=pMovie}

	NewMovie()
	--Translation{max={0,10,0}, range=1, play=kDrwPlayContinous}
	
	return NewObject{subobject=fire2, movie=pMovie, restriction=kDrwCsProjectile, bone=kDrwBoneChest, bonesource=bonesource, boundingradius=130}
end

ResolveProjectile{color1=0.6, color2=0}
EffectSave("WhiteProjectile")
