gObjects = {}

------------------------------------------------ player colors for lan-mode
function SetPlayerColor (player, r, g, b)
	DrwSetPlayerColor(player, r/255.0, g/255.0, b/255.0)
end	

SetPlayerColor(0,0,174,255)
SetPlayerColor(1,0,30,255)
SetPlayerColor(2,0,255,182)
SetPlayerColor(3,123,68,186)

SetPlayerColor(4,255,0,5)
SetPlayerColor(5,255,0,187)
SetPlayerColor(6,255,105,0)
SetPlayerColor(7,255,185,0)

SetPlayerColor(8,249,255,0)
SetPlayerColor(9,255,149,0)

SetPlayerColor(10,8,255,0)
SetPlayerColor(11,0,255,178)


----------------------------------------------------------------------- resist
gParams={name="randomsphere", particles=40, radius=1, height=3.6, time=2}
NewMovie(gParams.particles)
FigureScale(1.4)
Translation{min={0,0,gParams.height}}
Throw{velocity={0,0,0}, gravity={0,0,-3.5}, time=gParams.time, particles=gParams.particles, trail=0}
Burst{particles=gParams.particles, radius1=1.0, radius2=2, time=gParams.time, trail=0}

Color{min={1,1,1,1}, max={0.4,0.1,0.2,0}, range=gParams.time, path=kDrwPathParabola, play=kDrwPlayClamped}
Scale{min=0.2}
local resist = NewObject{billboard=flics.hypno[5], movie=pMovie, restriction=kDrwCsWorld}
EffectSave("Resist")

NewMovie(20)
FigureScale(1.4)
Translation{min={0,0,gParams.height}}
Translation{max={0,0,-3}, path=kDrwPathParabola, range=2, trail=-1}
Burst{particles=20, radius1=1.0, radius2=1.0, trail=0}
Scale{min=0.2}
local killresistance = NewObject{billboard=flics.hypno[5], movie=pMovie, restriction=kDrwCsWorld}

NewMovie()
Color{min={0.4,0.6,1,1}}
NewObject{subobject=killresistance, movie=pMovie}
EffectSave("ChillResistance")

NewMovie()
Color{min={1,0.3,0,1}}
NewObject{subobject=killresistance, movie=pMovie}
EffectSave("MeltResistance")


----------------------------------------------------- addon
NewMovie(22)
FigureScale(1.4)
Burst{particles=22, radius1=1, radius2=1.0, trail=1}
Scale{min=0.2}
Color{min={0.4,0.6,1,1}, max=0.3, range=0.5, path=kDrwPathCosine, play=kDrwPlayBounce, trail=1}
local killresistance = NewObject{billboard=flics.star_halo, movie=pMovie, restriction=kDrwCsWorld, bone=kDrwBoneHead}

EffectSave("FireResistance")

Cloud{offset={0.2,0,0}, velocity={0,0,0}, color1={0.5,0,0,0.6}, color2=0}
Clamp{range=2}
local blackdust = NewObject{billboard=flics.plasma, movie=pMovie, bone=kDrwBoneChest, restriction=kDrwCsWorld}

NewMovie(4)
Rotation{axis="x", min=-90, direction=0}
Rotation{dim=kDrwDimParticle}
local ghost = NewObject{mesh=flics.plasma, movie=pMovie}

NewMovie()
Scale{min=0.5}
lightning = NewObject{subobject=ghost, movie=pMovie}

NewMovie(3)
Translation{max={0,1,0}, start=1.5, range=0.5, path=kDrwPathLinear, play=kDrwPlayClamped}
Scale{max=1, range=0.5, path=kDrwPathLinear, play=kDrwPlayClamped}
Scale{min=1, max=0, start=1.5, range=0.5, path=kDrwPathLinear, play=kDrwPlayClamped}
Color{min=0.3}
Translation{max={0,1,0}, path=kDrwPathCosine, trail=1}
Scale{min=0, max=0.9, range=0.5, path=kDrwPathCosine, play=kDrwPlayBounce, trail=2}
local flyingsoul = NewObject{subobject=lightning, movie=pMovie, bone=kDrwBoneChest, bonesource=kDrwBoneChest, restriction=kDrwCsSpan+kDrwCsSwap, boundingradius=30}

NewObject{subobject={flyingsoul, blackdust}}
EffectSave("SpanGhost")
----------------------------------------------------- addon done

gParams={name="randomsphere", particles=40, radius=1, height=3.6, time=2}
NewMovie(gParams.particles)
FigureScale(1.4)
Translation{min={0,0,gParams.height}}
Throw{velocity={0,0,0}, gravity={0,0,-3.5}, time=gParams.time, particles=gParams.particles, trail=0}
Burst{particles=gParams.particles, radius1=1.0, radius2=2, time=gParams.time, trail=0}

Color{min={0,0,0,1}, max=0, range=gParams.time, path=kDrwPathParabola, play=kDrwPlayClamped}
Scale{min=0.2}
local resist = NewObject{billboard=flics.circledark, movie=pMovie, restriction=kDrwCsWorld}

NewMovie(2)
Color{min=1, max=0.5, path=kDrwPathCosine, play=kDrwPlayBounce, range=0.15}
NewObject{subobject=resist, movie=pMovie}
EffectSave("DarkBanishing")

----------------------------------------------------------------------- healing
LightMovie{offset={0,0,0}, size=1.4, deviation=0.05, color={0.3,0.3,1,0.1}}
FadeScale{}
local radiosity = Radiosity{movie=pMovie, bone=kDrwBoneMain, restriction=kDrwCsBone}

NewMovie(12)
Tube{trail=2, height=1.7, time=1}
Color{min={0.4,0.6,1,0.8}, max={0.2,0.4,1,1}, range=0.4, dim=kDrwDimTimeScaled, play=kDrwPlayBounce, path=kDrwPathCosine}
Scale{min=0.25}
FadeScale{}
local tube = NewObject{billboard=flics.flare02, movie=pMovie, bone=kDrwBoneMain}
NewObject{subobject={tube, radiosity}}
EffectSave("SimpleHeal")

NewMovie(3)
Rotation{dim=kDrwDimParticle}
NewObject{subobject=tube, movie=pMovie}
EffectSave("HolyTouch")
----------------------------------------------------------------------- greater healing
NewMovie(40)
Tube{trail=2, height=1, time=1}
Color{min={0.8,0.9,1,0}, max={0.8,0.9,1,0.8}, range=0.5, dim=kDrwDimTimeScaled, play=kDrwPlayBounce, path=kDrwPathCosine}
Scale{min=0.5}
FadeScale{}
local tube = NewObject{billboard=flics.flare, movie=pMovie, bone=kDrwBoneMain}
local heal = NewObject{subobject={tube, radiosity}}
EffectSave("GreaterHeal")

NewMovie()
Translation{min={0,0,0.5}}
Color{min=0, max=0.5, dim=kDrwDimTimeScaled, path=kDrwPathCosine, play=kDrwPlayBounce, range=0.5}
Scale{min=0.6}
Clamp{dimin=kDrwDimTimeScaled}
local skull = NewObject{billboard=flics.skull, bone=kDrwBoneCrown, restriction=kDrwCsResetRotation+kDrwCsSwap, movie=pMovie}

local suicide = NewObject{subobject={skull, heal}}
EffectSave("SuicideHeal")

----------------------------------------------------------------------- CureDisease
NewMovie(12)
Tube{trail=2, height=1.7, time=1}
Color{min={1,0.6,0.4,0.8}, max={1,0.4,0.2,1}, range=0.4, dim=kDrwDimTimeScaled, play=kDrwPlayBounce, path=kDrwPathCosine}
Scale{min=0.25}
FadeScale{}
local tube = NewObject{billboard=flics.flare02, movie=pMovie, bone=kDrwBoneMain}
NewObject{subobject={tube, radiosity}}
EffectSave("CureDisease")
----------------------------------------------------------------------- RemoveCurse
NewMovie(12)
Scale{min=2}
Translation{min={-0.2,0,0}}
Tube{trail=2, height=1.7, time=1}
Color{min={1,0.5,1,0.8}, max={0.8,0,0.7,1}, range=0.4, dim=kDrwDimTimeScaled, play=kDrwPlayBounce, path=kDrwPathCosine}
Scale{min=0.1}
FadeScale{}
local tube = NewObject{billboard=flics.flare02, movie=pMovie, bone=kDrwBoneMain, restriction=kDrwCsWorld}
NewObject{subobject={tube, radiosity}}
EffectSave("RemoveCurse")
----------------------------------------------------------------------- CurePoison
NewMovie(12)
Tube{trail=2, height=1.7, time=1}
Color{min={0.3,1,0.4,0.8}, max={0.2,1,0.4,1}, range=0.4, dim=kDrwDimTimeScaled, play=kDrwPlayBounce, path=kDrwPathCosine}
Scale{min=0.25}
FadeScale{}
local tube = NewObject{billboard=flics.flare02, movie=pMovie, bone=kDrwBoneMain}
NewObject{subobject={tube, radiosity}}
EffectSave("CurePoison")


----------------------------------------------------------------------- iceburst
NewMovie(6)
Burst{particles=6, time=0.5, radius1=0.2, radius2=0.5}
Color{min={0.4,0.4,1,0.5}}
Scale{min={1,1,1}}
FadeScale{}
gObjects[1] = NewObject{billboard=flics.ice3, movie=pMovie}

NewMovie(12)
Burst{particles=12, time=0.3, radius1=0.1, radius2=1}
gParams={name="randomburst", particles=12, range=0.25, radius1=0.2, radius2=1}
Color{min={0.2,0.2,1,0.5}}
Scale{min={0.1,0.1,0.1}}
FadeScale{}
gObjects[2] = NewObject{billboard=flics.spark, movie=pMovie}
	
NewMovie()
Rotation{range=6.5, dim=kDrwDimTimeAbsolute} --keep turning to show different sides
NewObject{subobject={gObjects[1], gObjects[2]}, movie=pMovie, bone=kDrwBoneMain}
EffectSave("IceBurst")
----------------------------------------------------------------- hypnotize mesmerize
local particles=34
NewMovie(particles)
Burst{particles=particles, radius1=0.4, radius2=0.4}
Color{min={1,0.5,0,0.8}, max={1,0.1,1,0.8}, play=kDrwPlayBounce, trail=4.42}
Rotation{range=3, dim=kDrwDimTimeAbsolute}
Rotation{axis="y", range=5, trail=13.6, dim=kDrwDimTimeAbsolute}
Rotation{axis="z", range=7, trail=17, dim=kDrwDimTimeAbsolute}
Translation{min={0.1,0.1,0.1}}
Scale{min={0.1,0.1,0.1}}
Choose{dim=kDrwDimParticle, path=kDrwPathRandom}
 
NewObject{billboard=flics.hypno, movie=pMovie, bone=kDrwBoneCrown}
EffectSave("Hypnotize")
----------------------------------------------------------------------- hypnotize Hit
NewMovie(1)
Scale{min={0,0,0}, max={1,1,1}, range=0.1, play=kDrwPlayClamped}
Color{min={1,1,1,0.8}, max={1,1,1,0}, play=kDrwPlayClamped, path=kDrwPathParabola}
gObjects[2] = NewObject{billboard=flics.flare, movie=pMovie}

gParams.range=0.2
NewMovie(1)
Scale{min={0,0,0}, max={2,0.1,0.1}, range=gParams.range, play=kDrwPlayClamped}
Color{min={1,1,1,0.2}, max={1,1,1,0}, range= 1, play=kDrwPlayClamped, path=kDrwPathParabola}
gObjects[3] = NewObject{billboard=flics.diamond, movie=pMovie, restriction=kDrwCsResetRotation}

local mental_hit = NewObject{subobject={gObjects[2], gObjects[3]}}
NewObject{subobject=mental_hit, bone=kDrwBoneCrown}
EffectSave("MentalHit")
----------------------------------------------------------------------- Materialize
LightMovie{offset={0,0,0}, size=1.5, deviation=0, color={1,1,1,0.2}}
FadeScale{}
local radiosity = Radiosity{movie=pMovie}

gParams={particles=60, radius=3, height=0, trail=18}
NewMovie(gParams.particles)
Translation{max={0,0,1.5}, min={0,0,0}, play=kDrwPlayClamped, range=1}
Scale{max={1,1,1}, min={0,0,0}, play=kDrwPlayClamped, range=2}
Rotation{range=3}
Rotation{axis="z", range=2.5}
Sphere(gParams)
Color{min={1,1,1,1}, max={0,0,0,0}, play=kDrwPlayClamped, range=1, start=-1, dim=kDrwDimTimeToEnd}
Scale{min={0.3,0.3,0.3}}
gObjects[1] = NewObject{billboard=flics.flare, movie=pMovie}

-- godfinger
NewMovie(1)
Scale{min={0.2,0.2,1000}}
Color{min={1,1,1,0}, max={1,1,1,0.3}, range=0.5, dim=kDrwDimTimeScaled, play=kDrwPlayBounce, path=kDrwPathCosine}
gObjects[2] = NewObject{mesh=flics.cylinder, movie=pMovie}

NewMovie(1)
Scale{max={1,1,1}, min={0,0,0}, play=kDrwPlayClamped, range=1}
Translation{min={0,0,1.5}}
Scale{min={1.5,1.5,1.5}}
Color{max={1,1,1,0.1}, min={1,1,1,0.9}, play=kDrwPlayClamped, range=1, start=0.75}
gObjects[3] = NewObject{mesh=flics.spheremat, movie=pMovie}

NewMovie()
TargetColor{min=0, max=1, range=2, play=kDrwPlayClamped}
gObjects[4] = NewObject{movie=pMovie}

NewObject{subobject={gObjects[1], gObjects[2], gObjects[3], gObjects[4], radiosity}}
EffectSave("Materialize")

NewObject{subobject={gObjects[1], gObjects[3], gObjects[4], radiosity}}
EffectSave("MaterializeInMonument")

------------------------------- DeMaterialize
gParams={particles=60, radius=1, height=0, trail=18}
NewMovie(gParams.particles)
Translation{min={0,0,1.5}}
Scale{min={1,1,1}, max={-1,-1,10}, play=kDrwPlayClamped, range=2, path=kDrwPathParabola}
Rotation{range=3}
Rotation{axis="z", range=2.5}
Sphere(gParams)
Color{min=1, max=0, play=kDrwPlayClamped, range=2}
Scale{min=0.6, max=0, play=kDrwPlayClamped, range=1.5, path=kDrwPathParabola}
gObjects[1] = NewObject{billboard=flics.flare, movie=pMovie}

-- godfinger
NewMovie()
Scale{min=0.2, max={0.2,0.2,100}, start=1, play=kDrwPlayClamped, path=kDrwPathParabola}
Color{min=0.3, max=0, start=1, play=kDrwPlayClamped, path=kDrwPathParabola}
gObjects[2] = NewObject{mesh=flics.cylinder, movie=pMovie}

NewMovie()
Translation{min={0,0,1.5}}
Scale{min=1, max={0,0,10}, play=kDrwPlayClamped, range=2, path=kDrwPathParabola}
Scale{min=1}
Color{min=0.9, max=0, play=kDrwPlayClamped, range=1, start=0}
gObjects[3] = NewObject{mesh=flics.spheremat, movie=pMovie}

NewMovie()
TargetColor{min=1, max=0, range=1, start=0.5, play=kDrwPlayClamped, path=kDrwPathCosine}
gObjects[4] = NewObject{movie=pMovie}

NewMovie()
Color{min=0, max=1, range=1.0, play=kDrwPlayClamped, path=kDrwPathNegParabola}
NewObject{subobject={gObjects[1], gObjects[2], gObjects[3], gObjects[4], radiosity}, movie=pMovie}
EffectSave("DeMaterialize")

------------------------------------------------------------------------ Summon
NewMovie(33)
Throw{particles=33, velocity={0,0,8}, time=5}
Burst{particles=33, time=5}--, velocity={1,0,5}}
Scale{min=0.1}
FadeScale{}
NewObject{billboard=flics.hypno[4], movie=pMovie}
EffectSave("Summon")
------------------------------------------------------------------sparks

local sparks = Sparks{bursts=2, sparks=2, outer=0.7, radius=0.5, size=1, flic=flics.circle, colorstart={0.5,0.5,1,0.1}}
NewMovie()
FadeScale{}
local lObjects = AttachToBones{movie=pMovie, object=sparks, bones={kDrwBoneRightFoot, kDrwBoneLeftFoot, kDrwBoneRightKnee, kDrwBoneLeftKnee, kDrwBoneRightShoulder, kDrwBoneLeftShoulder, kDrwBoneRightPalm, kDrwBoneLeftPalm, kDrwBoneRightEllbow, kDrwBoneLeftEllbow, kDrwBoneMain, kDrwBoneChest, kDrwBoneHead, kDrwBoneCrown}}

NewMovie()
Scale{min=0.8}
NewObject{subobject=lObjects, movie=pMovie}
EffectSave("DefaultBlackOld")
--------------------------------------------------------------------- shock, disrupt

local sparks = Sparks{bursts=2, sparks=3, flic=flics.flash, size=0.8, colorstart={0.5,0.5,1,1},colorend={0,0,0.6,0}, lifetime=0.5, outer=0, radius=0.2}
NewMovie()
Clamp{fadeout=0.2, range=1}
FigureScale(2)
NewObject{subobject={sparks}, movie=pMovie, bone=kDrwBoneCrown}
EffectSave("HeadShock")

local sparks = Sparks{bursts=2, sparks=3, flic=flics.flash, size=0.4, colorstart={1,1,0,1},colorend={1,0,0,0}, lifetime=1.5, outer=0, radius=1}
NewMovie()
Clamp{fadeout=0.2, range=1}
NewObject{subobject={sparks}, movie=pMovie, bone=kDrwBoneChest}
EffectSave("HeadShock2")

--------------------------------------------------------------------- default black
LightMovie{offset={0,0.4,0}, size=1.15, deviation=0.15, color={1,0,0.5,0.2}}
FadeScale{}
local radiosity = Radiosity{movie=pMovie, bone=kDrwBoneMain, restriction=kDrwCsBone}

BodyGlow{powerscale=1, figurescale=3, particles=3, size1=0.3, size2=0.6, radius1=0, radius2=0.1, color1={1,0,0.5,1}, color2={1,1,0,0}}
FadeScale{}
local glow = NewObject{billboard=flics.flash, movie=pMovie}
local lObjects = AttachToBones{object=glow, bones=GetBones("Torso"), restriction=kDrwCsBone}
local bodyflash= NewObject{subobject=lObjects}

NewMovie()
TargetColor{min={1,0,0,1}, max={1,1,1,1}, range=0.25, path=kDrwPathCosine, play=kDrwPlayBounce}
local targetcolor = NewObject{movie=pMovie}
local defaultblack = NewObject{subobject={bodyflash, radiosity}}

EffectSave("DefaultBlack")

Cloud{offset={0.2,0,0}, velocity={0,0,4}, color1={0,0,0,1}, color2=0}
Clamp{range=2}
local blackdust = NewObject{billboard=flics.plasma, movie=pMovie}
EffectSave("BlackDust")


local extinct = NewObject{subobject={blackdust, defaultblack}}
EffectSave("Extinct")

NewMovie()
Translation{min={0,0,0.5}}
Color{min=0, max=0.5, dim=kDrwDimTimeScaled, path=kDrwPathCosine, play=kDrwPlayBounce, range=0.5}
Scale{min=0.6}
Clamp{dimin=kDrwDimTimeScaled}
local skull = NewObject{billboard=flics.skull, bone=kDrwBoneCrown, restriction=kDrwCsResetRotation, movie=pMovie}

local death = NewObject{subobject={blackdust, skull}}
EffectSave("Death")

Cloud{offset={0.2,0,0}, velocity={0,0,4}, color1={0,0,0,1}, color2=0}
Clamp{range=2}
local blackdustsource = NewObject{billboard=flics.plasma, movie=pMovie}

NewMovie()
Translation{min={0,0,0.5}}
Color{min=0, max=0.5, dim=kDrwDimTimeScaled, path=kDrwPathCosine, play=kDrwPlayBounce, range=0.5}
Scale{min=0.6}
Clamp{dimin=kDrwDimTimeScaled}
local skull = NewObject{billboard=flics.skull, bone=kDrwBoneCrown, restriction=kDrwCsResetRotation+kDrwCsSwap, movie=pMovie}

local suicide = NewObject{subobject={skull, blackdustsource}}
EffectSave("SuicideDeath")

------------------------------------------------------------------------------ Raise Dead
LightMovie{offset={0,0,1}, size=1.15, deviation=0.15, color={0.2,0.7,0.2,0.5}}
local radiosity = Radiosity{movie=pMovie}

local particle = CombineParticles{ratio=0.3, color1={0,0,1,1}, color2={1,0,1,1}, flic2=flics.circle, flic1=flics.circle}
Smoke{trail=1, particles=22, offset={0.8,0,0.3}, velocity={0,0,0.3}, gravity={0,0,4}, time=2, growth=1, color2=0, color1=1, colorplay=kDrwPlayLooped}
Scale{min=0.2}
local glowingtube = NewObject{subobject=particle, movie=pMovie, restriction=kDrwCsResetRotation}

NewMovie()
Clamp{fadein=0.2, range=2}
NewObject{subobject={glowingtube, radiosity}, movie=pMovie}
EffectSave("RaiseDead")
------------------------------------------------------------------------------ Death Grasp
LightMovie{offset={0,0,1}, size=1.15, deviation=0.15, color={0.2,0.7,0.2,0.3}}
local radiosity = Radiosity{movie=pMovie}

local particle = CombineParticles{ratio=0.3, color1={1,0,1,0.3}, color2={1,1,1,1}, flic2=flics.skull, flic1=flics.circle}
Smoke{trail=1, particles=11, offset={0.5,0,0.3}, velocity={2,0,3}, gravity={-3,0,-1}, time=2, growth=1, color2=0, color1=1, colorplay=kDrwPlayLooped}
Scale{min=0.4}
local glowingtube = NewObject{subobject=particle, movie=pMovie, restriction=kDrwCsResetRotation}

NewMovie()
FigureScale(3)
Rotation{range=3}
FadeScale{path=kDrwPathLinear}
NewObject{subobject={glowingtube, radiosity}, movie=pMovie, restriction=kDrwCsWorld}
EffectSave("DeathGrasp")

--------------------------------------------------------------- Fireburst and FireballDot
--------------------------------------------- timed scalein
LightMovie{offset={0,0,0}, size=1.25, deviation=0.15, color={0.8,0.5,0,0.2}}
FadeScale{path=kDrwPathLinear, fadein=2, fadeout=0.1}
local radiosity = Radiosity{movie=pMovie, bone=kDrwBoneMain, restriction=kDrwCsBone}

Fire{powerscale=1.2, figurescale=2, buffer=0.3, particles=7, size=1, size1=0.4, size2=0.1, height=0.6, width=0.2, ground=0.1, top=0, color1={1,0.5,0.2,0.6}, color2={0.6,0,0,0.2}}
Translation{min={0,0,-0.4}}
FadeScale{path=kDrwPathLinear, fadein=0, fadeout=0.2}
NewObject{billboard=flics.smoke, movie=pMovie}--, restriction=kDrwCsResetRotation}

local TimedScaleIn = MoviesTimedScaleIn{time=2, steps=8}

local lObject = pObject
gObjects =
{
	--NewObject{subobject=lObject, movie=TimedScaleIn[0], bone=kDrwBoneRightFoot},
	--NewObject{subobject=lObject, movie=TimedScaleIn[0], bone=kDrwBoneLeftFoot},
	NewObject{subobject=lObject, movie=TimedScaleIn[1], bone=kDrwBoneRightKnee},
	NewObject{subobject=lObject, movie=TimedScaleIn[1], bone=kDrwBoneLeftKnee},
	NewObject{subobject=lObject, movie=TimedScaleIn[5], bone=kDrwBoneRightShoulder},
	NewObject{subobject=lObject, movie=TimedScaleIn[5], bone=kDrwBoneLeftShoulder},
	NewObject{subobject=lObject, movie=TimedScaleIn[7], bone=kDrwBoneRightPalm},
	NewObject{subobject=lObject, movie=TimedScaleIn[7], bone=kDrwBoneLeftPalm},
	NewObject{subobject=lObject, movie=TimedScaleIn[6], bone=kDrwBoneRightEllbow},
	NewObject{subobject=lObject, movie=TimedScaleIn[6], bone=kDrwBoneLeftEllbow},
	NewObject{subobject=lObject, movie=TimedScaleIn[3], bone=kDrwBoneMain},
	NewObject{subobject=lObject, movie=TimedScaleIn[4], bone=kDrwBoneChest},
	NewObject{subobject=lObject, movie=TimedScaleIn[5], bone=kDrwBoneHead},
	NewObject{subobject=lObject, movie=TimedScaleIn[6], bone=kDrwBoneCrown},
	radiosity,
}


NewObject{subobject=gObjects}
EffectSave("BurnFromFeet_LuaError")
EffectSave("BurnFromFeet")
-------------------------------------------------------- new freeze

NewMovie()
local decal = NewObject{decal=flics.circle, movie=pMovie}
local billboard = NewObject{billboard=flics.circle, movie=pMovie}
local mix = NewObject{subobject={billboard, decal}}
------------------------------------------------------------------

Smoke{time=5, particles=11, offset={0,0,0}, growth=5, velocity={0.7,0,2}, color1={0.3,0.6,1,0.0}, color2={0.3,0.6,1,0.2}}
FadeScale{path=kDrwPathLinear, fadein=0, fadeout=0.5}
Scale{min={0.1,0.1,0.1}}

gObjects =
{
	NewObject{subobject=billboard, movie=pMovie, bone=kDrwBoneCrown},
	NewObject{subobject=billboard, movie=pMovie, bone=kDrwBoneRightShoulder},
	NewObject{subobject=billboard, movie=pMovie, bone=kDrwBoneLeftShoulder},
	NewObject{subobject=billboard, movie=pMovie, bone=kDrwBoneRightHand},
	NewObject{subobject=billboard, movie=pMovie, bone=kDrwBoneLeftHand},
}
local smoke = NewObject{subobject=gObjects}

Smoke{time=7, particles=5, offset={0,0,-0.7}, growth=0, velocity={1,0,3}, gravity={0,0,-3}, color1={0.3,0.6,1,0.0}, color2={0.3,0.6,1,0.5}}
Scale{min={2,2,2}}
local ground = NewObject{decal=flics.circle, movie=pMovie}


NewMovie()
Choose{dim=kDrwDimParticle, path=kDrwPathRandom}
FadeScale{path=kDrwPathLinear, fadein=0, fadeout=0.5}
Scale{min={0.3,0.2,0.2}}
Translation{min={0.5,0,0}}
Color{min={0.3,0.6,1,0.3}}
FigureScale(3)
local icerock = NewObject{mesh=flics.icerocks, movie=pMovie}

NewMovie()
Choose{dim=kDrwDimParticle, path=kDrwPathRandom}
FadeScale{path=kDrwPathLinear, fadein=0, fadeout=0.5}
Scale{min={0.6,0.4,0.4}}
Translation{min={0.5,0,0}}
Color{min={0.3,0.6,1,0.3}}
FigureScale(3)
local icerockbig = NewObject{mesh=flics.icerocks, movie=pMovie}

local TimedScaleIn = MoviesTimedScaleIn{time=0.8, steps=8}

gObjects =
{
	NewObject{subobject=icerockbig, movie=TimedScaleIn[0], bone=kDrwBoneRightFoot, restriction=kDrwCsBone},
	NewObject{subobject=icerockbig, movie=TimedScaleIn[0], bone=kDrwBoneLeftFoot, restriction=kDrwCsBone},
	NewObject{subobject=icerockbig, movie=TimedScaleIn[1], bone=kDrwBoneRightKnee, restriction=kDrwCsBone},
	NewObject{subobject=icerockbig, movie=TimedScaleIn[1], bone=kDrwBoneLeftKnee, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[2], bone=kDrwBoneRightThigh, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[2], bone=kDrwBoneLeftThigh, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[5], bone=kDrwBoneRightShoulder, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[5], bone=kDrwBoneLeftShoulder, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[7], bone=kDrwBoneRightHand, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[7], bone=kDrwBoneLeftHand, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[6], bone=kDrwBoneRightEllbow, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[6], bone=kDrwBoneLeftEllbow, restriction=kDrwCsBone},
	NewObject{subobject=icerockbig, movie=TimedScaleIn[3], bone=kDrwBoneMain, restriction=kDrwCsBone},
	NewObject{subobject=icerockbig, movie=TimedScaleIn[4], bone=kDrwBoneChest, restriction=kDrwCsBone},
}
local ice = NewObject{subobject=gObjects}

NewMovie()
Scale{min={1.05,1.05,1.05}}
NewObject{subobject={ice, ground, smoke}, movie=pMovie}
--pObject:Dump()
EffectSave("IcePack")


------------------------------ addon2
gObjects =
{
	NewObject{subobject=icerockbig, movie=TimedScaleIn[0], bone=kDrwBoneRightFoot, restriction=kDrwCsBone},
	NewObject{subobject=icerockbig, movie=TimedScaleIn[0], bone=kDrwBoneLeftFoot, restriction=kDrwCsBone},
	NewObject{subobject=icerockbig, movie=TimedScaleIn[1], bone=kDrwBoneRightKnee, restriction=kDrwCsBone},
	NewObject{subobject=icerockbig, movie=TimedScaleIn[1], bone=kDrwBoneLeftKnee, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[2], bone=kDrwBoneRightThigh, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[2], bone=kDrwBoneLeftThigh, restriction=kDrwCsBone},
}
local ice = NewObject{subobject=gObjects}

NewMovie()
Scale{min={1.05,1.05,1.05}}
NewObject{subobject={ice, ground}, movie=pMovie}
--pObject:Dump()
EffectSave("IcePackFeet")
---------------------------------addon2 end

---------------------------------------------------------------------------- quickfreeze
local TimedScaleIn = MoviesTimedScaleIn{time=0.1, steps=8}

gObjects =
{
	NewObject{subobject=icerockbig, movie=TimedScaleIn[0], bone=kDrwBoneRightFoot, restriction=kDrwCsBone},
	NewObject{subobject=icerockbig, movie=TimedScaleIn[0], bone=kDrwBoneLeftFoot, restriction=kDrwCsBone},
	NewObject{subobject=icerockbig, movie=TimedScaleIn[1], bone=kDrwBoneRightKnee, restriction=kDrwCsBone},
	NewObject{subobject=icerockbig, movie=TimedScaleIn[1], bone=kDrwBoneLeftKnee, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[2], bone=kDrwBoneRightThigh, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[2], bone=kDrwBoneLeftThigh, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[5], bone=kDrwBoneRightShoulder, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[5], bone=kDrwBoneLeftShoulder, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[7], bone=kDrwBoneRightHand, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[7], bone=kDrwBoneLeftHand, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[6], bone=kDrwBoneRightEllbow, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[6], bone=kDrwBoneLeftEllbow, restriction=kDrwCsBone},
	NewObject{subobject=icerockbig, movie=TimedScaleIn[3], bone=kDrwBoneMain, restriction=kDrwCsBone},
	NewObject{subobject=icerockbig, movie=TimedScaleIn[4], bone=kDrwBoneChest, restriction=kDrwCsBone},
}
local ice = NewObject{subobject=gObjects}

NewMovie()
Scale{min={1.05,1.05,1.05}}
NewObject{subobject={ice}, movie=pMovie}
--pObject:Dump()
EffectSave("IcePackFast")

---------------------------------------------------------------------------- freeze FOREVER
Smoke{time=5, particles=11, offset={0,0,0}, growth=5, velocity={0.7,0,2}, color1={0.3,0.6,1,0.0}, color2={0.3,0.6,1,0.2}}
--FadeScale{path=kDrwPathLinear, fadein=0.01, fadeout=0.01}
Scale{min={0.1,0.1,0.1}}

gObjects =
{
	NewObject{subobject=billboard, movie=pMovie, bone=kDrwBoneCrown},
	NewObject{subobject=billboard, movie=pMovie, bone=kDrwBoneRightShoulder},
	NewObject{subobject=billboard, movie=pMovie, bone=kDrwBoneLeftShoulder},
	NewObject{subobject=billboard, movie=pMovie, bone=kDrwBoneRightHand},
	NewObject{subobject=billboard, movie=pMovie, bone=kDrwBoneLeftHand},
}
local smoke = NewObject{subobject=gObjects}

NewMovie()
Choose{dim=kDrwDimParticle, path=kDrwPathRandom}
--FadeScale{path=kDrwPathLinear, fadein=0.01, fadeout=0.01}
Scale{min={0.3,0.2,0.2}}
Translation{min={0.5,0,0}}
Color{min={0.3,0.6,1,0.3}}
FigureScale(3)
local icerock = NewObject{mesh=flics.icerocks, movie=pMovie}

NewMovie()
Choose{dim=kDrwDimParticle, path=kDrwPathRandom}
--FadeScale{path=kDrwPathLinear, fadein=0.01, fadeout=0.01}
Scale{min={0.6,0.4,0.4}}
Translation{min={0.5,0,0}}
Color{min={0.3,0.6,1,0.3}}
FigureScale(3)
local icerockbig = NewObject{mesh=flics.icerocks, movie=pMovie}


local TimedScaleIn = MoviesTimedScaleIn{time=0.1, steps=8}

gObjects =
{
	NewObject{subobject=icerockbig, movie=TimedScaleIn[0], bone=kDrwBoneRightFoot, restriction=kDrwCsBone},
	NewObject{subobject=icerockbig, movie=TimedScaleIn[0], bone=kDrwBoneLeftFoot, restriction=kDrwCsBone},
	NewObject{subobject=icerockbig, movie=TimedScaleIn[1], bone=kDrwBoneRightKnee, restriction=kDrwCsBone},
	NewObject{subobject=icerockbig, movie=TimedScaleIn[1], bone=kDrwBoneLeftKnee, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[2], bone=kDrwBoneRightThigh, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[2], bone=kDrwBoneLeftThigh, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[5], bone=kDrwBoneRightShoulder, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[5], bone=kDrwBoneLeftShoulder, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[7], bone=kDrwBoneRightHand, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[7], bone=kDrwBoneLeftHand, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[6], bone=kDrwBoneRightEllbow, restriction=kDrwCsBone},
	NewObject{subobject=icerock, movie=TimedScaleIn[6], bone=kDrwBoneLeftEllbow, restriction=kDrwCsBone},
	NewObject{subobject=icerockbig, movie=TimedScaleIn[3], bone=kDrwBoneMain, restriction=kDrwCsBone},
	NewObject{subobject=icerockbig, movie=TimedScaleIn[4], bone=kDrwBoneChest, restriction=kDrwCsBone},
}
local ice = NewObject{subobject=gObjects}

NewMovie()
Scale{min={1.05,1.05,1.05}}
NewObject{subobject={ice, ground, smoke}, movie=pMovie}
--pObject:Dump()
EffectSave("IcePackForever")


-------------------------------------- explosions
local time=1.1
local explosion = Explosion{powerscale=1.25, rolltime=0.1, particles=2, time=time, flic=flics.explo}
NewMovie()
Translation{max={0,0,1}, range=time}
Scale{min=1}
NewObject{subobject=explosion, movie=pMovie, bone=kDrwBoneChest}
EffectSave("FireBall")
------------------------------------------------------------ new fireshield
LightMovie{offset={0,0,0}, size=1.75, deviation=0.15, color={0.2,0.1,0,0.1}}
--FadeScale{fadein=0.1, fadeout=0.1, path=kDrwPathLinear}
local radiosity = Radiosity{movie=pMovie}

local light=CircleTrail{lightobject=radiosity, powerparticles=1, powertrail=1, particles=20, time=0.7, length=0.4, startsize=0.3, stopsize=0.2, startcolor={1,0.5,0.5,1}, stopcolor={1,0.5,0.5,0}}
--FadeScale{path=kDrwPathLinear, fadein=0.2}
local trail = NewObject{billboard=flics.sol_br, movie=pMovie}
NewObject{subobject={trail,light}, bone=kDrwBoneChest, restriction=kDrwCsWorld}
EffectSave("Assistance")

------------
gObjects[1] = CombineParticles{ratio=0.4, flic1=flics.smoke, color1={1,0.5,0,0.6}, color2={1,1,0.6,1}}
Fire{buffer=0.2, particles=7, color1=1, color2=0, ground=0, width=0.1, top=0,  size=0.7, height=1.5, size2=0.2}
Translation{min={0,0,0.2}}
gObjects[2] = NewObject{subobject=gObjects[1], movie=pMovie, restriction=kDrwCsFloor+kDrwCsBone}
EffectSave("fire1")

NewMovie(3)
Rotation{dim=kDrwDimParticle}
Rotation{range=2}
Translation{min={0.7,0,0}}
--Translation{min={-1,0,0}, max={1,0,0}, dim=kDrwDimParticle}
FadeScale{path=kDrwPathLinear, fadein=0.2, fadeout=0.2}
NewObject{subobject=gObjects[2], movie=pMovie, restriction=kDrwCsWorld}
EffectSave("FireShield")

------------------------------------------------------------ new iceshield
LightMovie{offset={0,0,0}, size=1.75, deviation=0.15, color={0,0.1,0.2,0.1}}
FadeScale{fadein=0.1, fadeout=0.1, path=kDrwPathLinear}
local radiosity = Radiosity{movie=pMovie}

local light=CircleTrail{length=1, lightobject=radiosity, powerparticles=1, powertrail=1, particles=22, time=0.7, startsize=0.3, stopsize=0.1, startcolor={0.5,0.8,1,0.7}, stopcolor={0,0,0.5,0}}
FadeScale{path=kDrwPathLinear, fadein=0.2, fadeout=0.2}
local trail = NewObject{billboard=flics.star_halo, movie=pMovie}
NewObject{subobject={trail,light}, bone=kDrwBoneChest, restriction=kDrwCsWorld}
EffectSave("IceShield")

----------------
gObjects[1] = CombineParticles{ratio=0.4, flic1=flics.smoke, color1={0,0.5,1,0.6}, color2={0.6,1,1,1}}
Fire{buffer=0.2, particles=7, color1=1, color2=0, ground=0, width=0.1, top=0,  size=0.7, height=1.5, size2=0.2}
Translation{min={0,0,0.2}}
gObjects[2] = NewObject{subobject=gObjects[1], movie=pMovie, restriction=kDrwCsFloor+kDrwCsBone}
EffectSave("fire1")

NewMovie(3)
Rotation{dim=kDrwDimParticle}
Rotation{range=2}
Translation{min={0.7,0,0}}
--Translation{min={-1,0,0}, max={1,0,0}, dim=kDrwDimParticle}
FadeScale{path=kDrwPathLinear, fadein=0.2, fadeout=0.2}
NewObject{subobject=gObjects[2], movie=pMovie, restriction=kDrwCsWorld}
EffectSave("IceShield")
------------------------------------------------------------ thornshield
LightMovie{offset={0,0,0}, size=1.75, deviation=0.15, color={0.1,0.1,0.1,0.1}}
FadeScale{fadein=0.1, fadeout=0.1, path=kDrwPathLinear}
local radiosity = Radiosity{movie=pMovie}

NewMovie()
Rotation{range=3}
local spin = NewObject{billboard=flics.star6point, movie=pMovie, restriction=kDrwCsFloor}

local light=CircleTrail{lightobject=radiosity, powerparticles=1, powertrail=1, particles=22, length=1,  time=1.7, startsize=0.5, stopsize=0.4, startcolor={1,1,1,0.7}, stopcolor={0.6,0.3,0,0}}
FadeScale{path=kDrwPathLinear, fadein=0.2, fadeout=0.2}
--local trail = NewObject{billboard=flics.star6point, movie=pMovie, restriction=kDrwCsResetRotation}
local trail = NewObject{subobject=spin, movie=pMovie, restriction=kDrwCsResetRotation}
--local trail = NewObject{mesh=flics.chicken, movie=pMovie, restriction=kDrwCsResetRotation}
NewObject{subobject={trail,light}, bone=kDrwBoneChest, restriction=kDrwCsWorld}
EffectSave("ThornShield")

NewMovie(11)
Rotation{range=2, trail=0.5}
Translation{min={0.7,0,0}}
NewObject{subobject=spin, movie=pMovie}


----------------------------------------------------- Remediless
BodyGlow{size1=0, size2=0.8, radius1=0, radius2=0.2, color1={1,1,1,0.7}, color2={1,1,1,0}}
local glow = NewObject{billboard=flics.sol_br, movie=pMovie}
local lObjects = AttachToBones{object=glow, bones=GetBones("Torso"), restriction=kDrwCsBone}
NewObject{subobject=lObjects}
EffectSave("Remediless")
------------------------------------------------------------------pestilence dot
BodyGlow{size1=0, size2=0.5, radius1=0.1, radius2=0.2, color1={1,1,1,0.3}, color2={1,1,1,0}}
FadeScale{}
local glow = NewObject{billboard=flics.sol_bg, movie=pMovie}
local lObjects = AttachToBones{object=glow, bones=GetBones("Arms"), restriction=kDrwCsBone}
NewObject{subobject=lObjects}
EffectSave("Pestilence")
------------------------------------------------------------------poison dot
LightMovie{offset={0,0.3,0}, size=1, deviation=0.5, flicker=10, color={0,0.5,0,0.2}}
--FadeScale{}
local radiosity = Radiosity{movie=pMovie, bone=kDrwBoneChest, restriction=kDrwCsBone}

BodyGlow{figurescale=2.5, powerscale=2, size1=0, size2=0.051, radius1=0.1, radius2=0.2, color1={0,1,0,0.7}, color2={0,1,0,0}}
GlobalTrail{buffer=0.5, range=1, trail=1, path=kDrwPathParabola}

local glow = NewObject{billboard=flics.bubble, movie=pMovie, restriction=kDrwCsWorld}
local lObjects = AttachToBones{object=glow, bones=GetBones("Arms"), restriction=kDrwCsBone}
local bubbles = NewObject{subobject=lObjects}
NewObject{subobject={bubbles, radiosity}}
EffectSave("Poison")
------------------------------------------------------------------slowness dot
BodyGlow{particles=5, size1=0.1, size2=0.5, radius1=0.1, radius2=0.3, color1={0.7,1,0.3,0.8}, color2={1,1,1,0}}
local glow = NewObject{billboard=flics.sol_bb, movie=pMovie}
local lObjects = AttachToBones{object=glow, bones=GetBones("Legs"), restriction=kDrwCsBone}
NewObject{subobject=lObjects}
EffectSave("Slowness")
------------------------------------------------------------------slow fighting
BodyGlow{particles=5, size1=0.1, size2=0.5, radius1=0.1, radius2=0.3, color1={0.7,1,0.3,0.8}, color2={1,1,1,0}}
local glow = NewObject{billboard=flics.sol_bb, movie=pMovie}
local lObjects = AttachToBones{object=glow, bones=GetBones("Arms"), restriction=kDrwCsBone}
NewObject{subobject=lObjects}
EffectSave("SlowFighting")
------------------------------------------------------------------inflex dot
BodyGlow{particles=4, size1=0.1, size2=0.7, radius1=0.1, radius2=0.1, color1={0.7,1,0.3,0.4}, color2={1,1,1,0}}
local glow = NewObject{billboard=flics.sol_bb, movie=pMovie}
local lObjects = AttachToBones{object=glow, bones=GetBones{"Arms", "Legs"}, restriction=kDrwCsBone}
NewObject{subobject=lObjects}
EffectSave("Inflex")
------------------------------------------------------------------spawnboss effect
BodyGlow{particles=10, size1=0.3, size2=0.3, radius1=0.1, radius2=0.2, color1={0.2,0,1,0.4}, color2={1,0,0,0.1}, time=2}
local glow = NewObject{billboard=flics.star_halo, movie=pMovie}
local lObjects = AttachToBones{object=glow, bones=GetBones{"Arms", "Legs"}, restriction=kDrwCsBone}
NewObject{subobject=lObjects}
EffectSave("Spawnboss")
------------------------------------------------------------------weaken dot
BodyGlow{particles=7, size1=0.1, size2=0.6, radius1=0.1, radius2=0.3, color1={0.7,1,0.3,1}, color2={1,1,0,0}}
local glow = NewObject{billboard=flics.sol_bb, movie=pMovie}
local lObjects = AttachToBones{object=glow, bones={kDrwBoneMain, kDrwBoneChest, kDrwBoneHead}, restriction=kDrwCsBone}
NewObject{subobject=lObjects}
EffectSave("Weaken")
------------------------------------------------------------------ inability
BodyGlow{particles=5, size1=0.1, size2=0.7, radius1=0.1, radius2=0.2, color1={0.7,1,1,0.5}, color2={1,1,1,0}}
local glow = NewObject{billboard=flics.plasma, movie=pMovie}
NewMovie()
Scale{min=-1}
local lObjects = AttachToBones{object=glow, movie=pMovie, bones=GetBones{"Arms"}, restriction=kDrwCsWorld}
NewObject{subobject=lObjects}
EffectSave("Inability")
------------------------------------------------------------------ suffocation
BodyGlow{particles=13, size1=0.1, size2=0.7, radius1=0.1, radius2=0.2, color1={0.3,1,0.5,0.5}, color2={1,0.5,0.5,0}}
local glow = NewObject{billboard=flics.plasma, movie=pMovie}
NewMovie()
Scale{min=-1}
local lObjects = AttachToBones{object=glow, movie=pMovie, bones={kDrwBoneCrown, kDrwBoneHead}, restriction=kDrwCsWorld}
NewObject{subobject=lObjects}
EffectSave("Suffocation")
------------------------------------------------------------------endurance dot
BodyGlow{particles=5, size1=0.1, size2=0.7, radius1=0.1, radius2=0.2, color1={0.7,0.7,1,0.5}, color2={1,1,1,0}}
local glow = NewObject{billboard=flics.star_halo, movie=pMovie}
local lObjects = AttachToBones{object=glow, bones=GetBones("Legs"), restriction=kDrwCsBone}
NewObject{subobject=lObjects}
EffectSave("Endurance")
------------------------------------------------------------------flexibility dot
BodyGlow{particles=4, size1=0.1, size2=0.5, radius1=0, radius2=0.1, color1={0.7,1,0.3,0.4}, color2={1,1,1,0}}
local glow = NewObject{billboard=flics.star_halo, movie=pMovie}
local lObjects = AttachToBones{object=glow, bones=GetBones{"Legs", "Arms"}, restriction=kDrwCsBone}
NewObject{subobject=lObjects}
EffectSave("Flexibility")
------------------------------------------------------------------strengthen dot
BodyGlow{particles=7, size1=0.1, size2=0.4, radius1=0, radius2=0.2, color1={0.7,1,1,1}, color2={0,0.5,1,0}}
local glow = NewObject{billboard=flics.star_halo, movie=pMovie}
local lObjects = AttachToBones{object=glow, bones=GetBones{"Arms"}, restriction=kDrwCsBone}
NewObject{subobject=lObjects}
EffectSave("Strengthen")
------------------------------------------------------------------dexterity dot
BodyGlow{particles=7, size1=0.1, size2=0.1, radius1=0.15, radius2=0.25, color1={1,1,0.7,1}, color2={0,0.5,1,0}}
local glow = NewObject{billboard=flics.star6point, movie=pMovie}
local lObjects = AttachToBones{object=glow, bones=GetBones{"Torso"}, restriction=kDrwCsBone}
NewObject{subobject=lObjects}
EffectSave("Dexterity")
------------------------------------------------------------------quickness
Fire{particles=7, size=0.3, path=kDrwPathParabola, size1=2, size2=1, ground=0, top=0, color1={1,1,0.7,1}, color2={0,0.5,1,0}}
GlobalTrail{buffer=0.2,trail=1, path=kDrwPathParabola}
local glow = NewObject{billboard=flics.star_halo, movie=pMovie}
local lObjects = AttachToBones{object=glow, bones={kDrwBoneLeftFoot, kDrwBoneRightFoot}, restriction=kDrwCsWorld}
NewObject{subobject=lObjects}
EffectSave("Quickness")
------------------------------------------------------------------fast fighting dot
local lObjects = AttachToBones{object=glow, bones={kDrwBoneLeftEllbow, kDrwBoneRightEllbow}, restriction=kDrwCsWorld}
NewObject{subobject=lObjects}
EffectSave("FastFighting")
------------------------------------------------------------------ Charisma
BodyGlow{particles=5, size1=0.1, size2=0.7, radius1=0, radius2=0.13, color1={0.7,0.7,1,0.3}, color2={1,1,1,0}}
local glow = NewObject{billboard=flics.star_halo, movie=pMovie, bone=kDrwBoneCrown, restriction=kDrwCsWorld}
EffectSave("Charisma")
------------------------------------------------------------------gladiator
BodyGlow{time=0.1, particles=3, size1=0.2, size2=0.3, radius1=0, radius2=0.1, color1={1,1,0.3,0.5}, color2={1,1,1,0}}
local glow = NewObject{billboard=flics.circle, movie=pMovie}
local lObjects = AttachToBones{object=glow, bones=GetBones{"All", kDrwBoneHead, kDrwBoneCrown}, restriction=kDrwCsBone}
NewObject{subobject=lObjects}
EffectSave("Gladiator")
-----------------------------------------  new lifetap
local range=2
NewMovie(4)
Rotation{axis="y", min=-90, max=-90, direction=0}
Rotation{axis="x", dim=kDrwDimParticle}
--Rotation{axis="x", range=5.5}
local ghost = NewObject{mesh=flics.ghost, movie=pMovie}

NewMovie()
Translation{min={0,0,1}, max={0,0,8}, range=range}
Scale{max={1.8,1.8,20}, range=range}
Color{min={1,1,1,0.5}, max={1,0.5,0.5,0}, range=range, path=kDrwPathParabola}
local ghostfly = NewObject{subobject=ghost, movie=pMovie}
EffectSave()

local explo=Explosion{particles=2, flic=flics.skull, size=0}
NewMovie()
Scale{min=0.5}
NewObject{subobject=explo, movie=pMovie, bone=kDrwBoneChest}
EffectSave()

Cloud{figurescale=3, powerscale=2, particles=5, size=0, color2={0.5,0,0,0.1}, rolltime=2, range=range, radius2={0.1,0,0}}
Scale{min=0.5}
local skullcloud = NewObject{billboard=flics.skull, movie=pMovie, bone=kDrwBoneChest, restriction=kDrwCsResetRotation}
EffectSave()

NewMovie()
Clamp{range=range}
NewObject{subobject={ghostfly, skullcloud}, movie=pMovie}
EffectSave("LifeTap")


-------------------------------------------------------- petrify
-- POWER ? -> Versteinerungsdauer
NewMovie()
Choose{dim=kDrwDimParticle, path=kDrwPathRandom}
FadeScale{path=kDrwPathLinear, fadein=0, fadeout=0.5}
Scale{min=0.5}
local stone = NewObject{mesh=flics.stones, movie=pMovie}

NewMovie()
Choose{dim=kDrwDimParticle, path=kDrwPathRandom}
FadeScale{path=kDrwPathLinear, fadein=0, fadeout=0.5}
Scale{min=0.7}
local stonebig = NewObject{mesh=flics.stones, movie=pMovie}

local TimedScaleIn = MoviesTimedScaleIn{time=1.8, steps=9, scaletime=1.5}

gObjects =
{
	NewObject{subobject=stonebig, movie=TimedScaleIn[0], bone=kDrwBoneRightFoot, restriction=kDrwCsBone},
	NewObject{subobject=stonebig, movie=TimedScaleIn[0], bone=kDrwBoneLeftFoot, restriction=kDrwCsBone},
	NewObject{subobject=stonebig, movie=TimedScaleIn[1], bone=kDrwBoneRightKnee, restriction=kDrwCsBone},
	NewObject{subobject=stonebig, movie=TimedScaleIn[1], bone=kDrwBoneLeftKnee, restriction=kDrwCsBone},
	NewObject{subobject=stonebig, movie=TimedScaleIn[2], bone=kDrwBoneRightThigh, restriction=kDrwCsBone},
	NewObject{subobject=stonebig, movie=TimedScaleIn[2], bone=kDrwBoneLeftThigh, restriction=kDrwCsBone},
	NewObject{subobject=stonebig, movie=TimedScaleIn[5], bone=kDrwBoneRightShoulder, restriction=kDrwCsBone},
	NewObject{subobject=stonebig, movie=TimedScaleIn[5], bone=kDrwBoneLeftShoulder, restriction=kDrwCsBone},
	NewObject{subobject=stone, movie=TimedScaleIn[7], bone=kDrwBoneRightHand, restriction=kDrwCsBone},
	NewObject{subobject=stone, movie=TimedScaleIn[7], bone=kDrwBoneLeftHand, restriction=kDrwCsBone},
	NewObject{subobject=stone, movie=TimedScaleIn[6], bone=kDrwBoneRightEllbow, restriction=kDrwCsBone},
	NewObject{subobject=stone, movie=TimedScaleIn[6], bone=kDrwBoneLeftEllbow, restriction=kDrwCsBone},
	NewObject{subobject=stonebig, movie=TimedScaleIn[3], bone=kDrwBoneMain, restriction=kDrwCsBone},
	NewObject{subobject=stonebig, movie=TimedScaleIn[4], bone=kDrwBoneChest, restriction=kDrwCsBone},
	NewObject{subobject=stone, movie=TimedScaleIn[8], bone=kDrwBoneHead, restriction=kDrwCsBone},
	NewObject{subobject=stone, movie=TimedScaleIn[8], bone=kDrwBoneCrown, restriction=kDrwCsBone},
}
local petrify = NewObject{subobject=gObjects}
EffectSave("Petrify")

-------------------------------------------------------- Conservation
-- POWER ? -> Versteinerungsdauer
NewMovie()
Choose{dim=kDrwDimParticle, path=kDrwPathRandom}
Scale{min=0.5}
local stone = NewObject{mesh=flics.stones, movie=pMovie}

NewMovie()
Choose{dim=kDrwDimParticle, path=kDrwPathRandom}
Scale{min=0.7}
local stonebig = NewObject{mesh=flics.stones, movie=pMovie}

local TimedScaleIn = MoviesTimedScaleIn{time=1.8, steps=9, scaletime=1.5}

gObjects =
{
	NewObject{subobject=stonebig, movie=TimedScaleIn[0], bone=kDrwBoneRightFoot, restriction=kDrwCsBone},
	NewObject{subobject=stonebig, movie=TimedScaleIn[0], bone=kDrwBoneLeftFoot, restriction=kDrwCsBone},
	NewObject{subobject=stonebig, movie=TimedScaleIn[1], bone=kDrwBoneRightKnee, restriction=kDrwCsBone},
	NewObject{subobject=stonebig, movie=TimedScaleIn[1], bone=kDrwBoneLeftKnee, restriction=kDrwCsBone},
	NewObject{subobject=stonebig, movie=TimedScaleIn[2], bone=kDrwBoneRightThigh, restriction=kDrwCsBone},
	NewObject{subobject=stonebig, movie=TimedScaleIn[2], bone=kDrwBoneLeftThigh, restriction=kDrwCsBone},
	NewObject{subobject=stonebig, movie=TimedScaleIn[5], bone=kDrwBoneRightShoulder, restriction=kDrwCsBone},
	NewObject{subobject=stonebig, movie=TimedScaleIn[5], bone=kDrwBoneLeftShoulder, restriction=kDrwCsBone},
	NewObject{subobject=stone, movie=TimedScaleIn[7], bone=kDrwBoneRightHand, restriction=kDrwCsBone},
	NewObject{subobject=stone, movie=TimedScaleIn[7], bone=kDrwBoneLeftHand, restriction=kDrwCsBone},
	NewObject{subobject=stone, movie=TimedScaleIn[6], bone=kDrwBoneRightEllbow, restriction=kDrwCsBone},
	NewObject{subobject=stone, movie=TimedScaleIn[6], bone=kDrwBoneLeftEllbow, restriction=kDrwCsBone},
	NewObject{subobject=stonebig, movie=TimedScaleIn[3], bone=kDrwBoneMain, restriction=kDrwCsBone},
	NewObject{subobject=stonebig, movie=TimedScaleIn[4], bone=kDrwBoneChest, restriction=kDrwCsBone},
	NewObject{subobject=stone, movie=TimedScaleIn[8], bone=kDrwBoneHead, restriction=kDrwCsBone},
	NewObject{subobject=stone, movie=TimedScaleIn[8], bone=kDrwBoneCrown, restriction=kDrwCsBone},
}
local petrify = NewObject{subobject=gObjects}

NewMovie()
Color{min={1,1,0.5,0.1}, max=0.3, range=0.8, play=kDrwPlayBounce, path=kDrwPathCosine}
NewObject{subobject=petrify, movie=pMovie}
EffectSave("Conservation")
---------------------------------------------------------------- Guard
CircleTrail{radius=0.6, particles=11, startsize=0.4, stopsize=0.1, startcolor={0,0.5,1,0.7}, stopcolor={1,1,0,0}, time=1.0}
local trail = NewObject{billboard=flics.spark, movie=pMovie}
EffectSave()
NewMovie(1)
Scale{min=0.3}
local lObjects = AttachToBones{movie=pMovie, object=trail, bones=GetBones{"Arms"}, restriction=kDrwCsBone}
NewObject{subobject=lObjects}
EffectSave("Guard")
-------------------------------------------------------- regenerate
CircleTrail{radius=0.3, particles=11, startsize=0.4, stopsize=0.1, startcolor={0,0.5,1,0.5}, stopcolor={1,1,1,0}, time=1.0, rolltime=1000}
FadeScale{path=kDrwPathLinear, fadein=0.2, fadeout=0.2}
gObjects[1] = NewObject{billboard=flics.star6point, movie=pMovie}
gObjects[2] = AttachToBones{object=gObjects[1], bones={kDrwBoneRightEllbow, kDrwBoneLeftEllbow, kDrwBoneRightKnee, kDrwBoneLeftKnee}}
NewObject{subobject=gObjects[2]}
EffectSave("Regenerate")
------------------------------------------------------------ new decay
Cloud{radius2={1,0,0}, velocity={0,0,2}, color1={1,0.8,0.5,1}, color2={0.3,0.3,0,0}, size=0.2, time=1}
Scale{min=1.3}
Clamp{range=1}
local explo=NewObject{billboard=flics.fog, movie=pMovie}

local particles, time =33, 1
NewMovie(particles)
Throw{particles=particles, velocity={0,0,3}, gravity={0,0,-3.5}, time=time, trail=0}
Burst{particles=particles, radius1=0.2, radius2=1.7, time=time, trail=0}
Color{min={1,0.8,0.5,1}, max={1,0.1,0.2,0}, range=time, path=kDrwPathParabola, play=kDrwPlayClamped}
Scale{min=0.03}
local burst = NewObject{billboard=flics.diamond, movie=pMovie, bone=kDrwBoneMain}

NewObject{subobject={burst, explo}}
EffectSave("Decay")
------------------------------------------------------------- forget
local particles=33
NewMovie(particles)
Burst{particles=particles, radius1=0.2, radius2=0.2}
Choose{dimmode=kDrwDimParticle, path=kDrwPathRandom}
Translation{min={0,0,0}, max={0.5,0,0}, range=1}
Color{min={1,0.5,0,0.8}, max={1,0.1,1,0.8}, range=0.5, play=kDrwPlayBounce, trail=0.13}
Scale{min=0.3, max=0, range=1}
Clamp{range=1}
local burst = NewObject{billboard=flics.hypno, movie=pMovie}

local hit = NewObject{subobject={mental_hit, burst}, bone=kDrwBoneCrown}
EffectSave("Forget")

------------------------------------------------------------- demoralize
local particles=33
NewMovie(particles)
Burst{particles=particles, radius1=0.2, radius2=0.2}
Choose{dimmode=kDrwDimParticle, path=kDrwPathRandom}
Translation{min={0,0,0}, max={0.5,0,0}, range=1}
Color{min={0,0.5,1,0.8}, max={1,1,0,0.8}, range=0.5, play=kDrwPlayBounce, trail=0.13}
Scale{min=0.3, max=0, range=1}
Clamp{range=1}
local burst = NewObject{billboard=flics.hypno, movie=pMovie}

local hit = NewObject{subobject={mental_hit, burst}, bone=kDrwBoneCrown}
EffectSave("Demoralize")

------------------------------------------------------------------------ amok
CircleTrail{particles=22, radius=0.25, time=0.6, startsize=0.3, stopsize=0, length=0.9, startcolor={1,1,1,0.2}, stopcolor={1,1,1,0}}
FadeScale{path=kDrwPathLinear, fadein=0.5, fadeout=0.5}
gObjects[1] = NewObject{billboard=flics.sol_br, movie=pMovie}
EffectSave()

BodyGlow{particles=7, size1=1.5, size2=0, radius2=0.3, color1={1,1,1,0}, color2={1,1,1,1}}
FadeScale{}
gObjects[2] = NewObject{billboard=flics.sol_pb, movie=pMovie}

NewObject{subobject={mental_hit, gObjects[1], gObjects[2]}, bone=kDrwBoneCrown}
EffectSave("Amok")
---------------------------------------------------------------------- charm animal
CircleTrail{particles=19, radius=0.3, time=2, startsize=0.05, stopsize=0.05, length=2, startcolor={1,0,0,0.5}, stopcolor={1,1,0,0.5}, rolltime=10000}
NewObject{billboard=flics.ring, movie=pMovie}
NewMovie()
Rotation{axis="y", min=90, max=90, direction=0}
FadeScale{}
NewObject{subobject=pObject, movie=pMovie, bone=kDrwBoneHead, restriction=kDrwCsBone}
EffectSave("HitCharm")

CircleTrail{particles=19, radius=1, time=2, startsize=0.2, stopsize=0.2, length=2, startcolor={1,0,0,0.5}, stopcolor={1,1,0,0.5}, rolltime=10000}
FadeScale{path=kDrwPathLinear, fadein=0.5, fadeout=0}
NewObject{billboard=flics.ring, movie=pMovie}
NewMovie()
Rotation{axis="y", min=90, max=90, direction=0}
FadeScale{path=kDrwPathLinear, fadein=0.1, fadeout=0.5}
NewObject{subobject=pObject, movie=pMovie, bone=kDrwBoneHead, restriction=kDrwCsBone}
EffectSave("DotCharm")

---------------------------------------------------------------------- random sparkle
--gObjects={}
--for i = 1,15 do
--	local time = 2.0
--	NewMovie(1)
--	Sparkle{start=(i*time/15), time=time, size1=0, size2=0.3, color2={0.5,0.7 + i/50,1 - i/50, 0.7}, radius1=0.3, radius2=1.5}
--	gObjects[i] = NewObject{billboard=flics.star6point, movie=pMovie}
--end
--local sparkles = NewObject{subobject=gObjects}

NewMovie(5)
Rotation{dim=kDrwDimParticle, path=kDrwPathRandom}
Translation{min={-0.5,0,0}}
Rotation{axis="y", min=40, direction=0}
Rotation{axis="x", min=90, max=90, direction=0}
Scale{min=0, max={2,0.04,0.04}, range=0.5, play=kDrwPlayBounce, trail=1}
Color{min=0, max={0.5,1,1,0.6}, range=0.7, play=kDrwPlayBounce, trail=1.1}
local beams = NewObject{mesh=flics.beampointy2, movie=pMovie}

--NewObject{subobject = {sparkles, beams}}
NewObject{subobject = {beams}}
EffectSave("LeniaEffect")

--------------------------------------------------------------------  new mana in/out
-- POWER
local flash = Lightning{range=0.1, flic=flics.simplelightning, mode=2}
NewMovie()
Color{min={0,0.8,1,0.4}, max=0.1, dim=kDrwDimRandom}
local flashcolored = NewObject{subobject=flash, movie=pMovie}


NewMovie(2)
Translation{min={0,0,2}}
Rotation{axis="x", min=90, max=450, direction=-1, dim=kDrwDimParticle}
Scale{min=0.3, max=0.6, path=kDrwPathRandom}
Color{min={0,1,0,0.5}, max={0,0.8,1,1}, path=kDrwPathRandom}
local spot = NewObject{mesh=flics.circle, movie=pMovie}

NewMovie()
FigureScale(2)
local spotflash = NewObject{subobject={flashcolored,spot}, movie=pMovie}

NewMovie(13)
ChangeNumbers{dim=kDrwDimPower, play=kDrwPlayClamped}
Rotation{axis="z", dim=kDrwDimParticle, path=kDrwPathRandom}
Rotation{axis="y", range=6, trail=1}
Rotation{axis="x", min=30, max=150, direction=0, dim=kDrwDimParticle}
local flashball = NewObject{subobject=spotflash, movie=pMovie}

NewMovie()
Color{min={0,1,0,0.1}, max={0,0.8,1,0.3}, path=kDrwPathRandom}
Scale{min=3}
local innerglow = NewObject{billboard=flics.circle, movie=pMovie}


NewMovie()
Scale{min=0.5}
FadeScale{path=kDrwPathNegParabola, fadein=0.8, fadeout=0}
Rotation{axis="x", min=180, direction=0}
Rotation{range=3, path=kDrwPathNegParabola, play=kDrwPlayClamped}
Color{range=1, min=1, max=0, start=2, range=1, play=kDrwPlayClamped}
NewObject{subobject={flashball, innerglow}, movie=pMovie, bone=kDrwBoneChest}
EffectSave("ManaOut")

NewMovie()
Scale{min=0.5}
FadeScale{path=kDrwPathNegParabola, fadein=0.8, fadeout=0}
Rotation{axis="x", min=180, direction=0}
Rotation{range=3, path=kDrwPathNegParabola, play=kDrwPlayClamped}
NewObject{subobject={flashball, innerglow}, movie=pMovie, bone=kDrwBoneChest}
EffectSave("ManaShield")

------------------------------------- for addon
NewMovie()
Scale{min=0.5}
FadeScale{path=kDrwPathNegParabola, fadein=0.2, fadeout=0.2}
Rotation{axis="x", min=180, direction=0}
Rotation{range=3, path=kDrwPathNegParabola, play=kDrwPlayClamped}
Color{range=1, min=1, max=0, start=2, range=1, play=kDrwPlayClamped}
NewObject{subobject={flashball, innerglow}, movie=pMovie, bone=kDrwBoneChest}
EffectSave("ManaEssence")
-------------------------------------- for addon end

NewMovie()
Scale{min=0.5}
Scale{path=kDrwPathParabola, min=1, max=0, range=3, play=kDrwPlayClamped}
Rotation{axis="x", min=180, direction=0}
Rotation{range=3, path=kDrwPathParabola, play=kDrwPlayClamped}
Color{range=1, min=0, max=1, range=1, play=kDrwPlayClamped}
NewObject{subobject={flashball, innerglow}, movie=pMovie, bone=kDrwBoneChest}
EffectSave("ManaIn")

----------------------------------------------------------------------- invulnerability (blue sphere)
NewMovie(40)
Sphere{trail=4, radius=0.7}
Scale{min=0.2}
FadeScale{}
Color{min={0.6,0.9,1,0.5}}
NewObject{billboard=flics.flare, movie=pMovie, bone=kDrwBoneChest, restriction=kDrwCsWorld}
EffectSave("SparkleSphere")

------------------------------------------------------------------------- extinct
-- POWER
gObjects={}
local lightning = Lightning{range=0.08,flic=flics.simplelightning, mode=1}
NewMovie()
Scale{min={10,10,20}}
Rotation{range=5}
Color{min={1,0.2,0,0.1}, max={0.6,0,0,0.05}, dim=kDrwDimRandom}
--gObjects[1] = NewObject{subobject=lightning, movie=pMovie}

--gObjects[2] = Explosion{rolltime=0.8, particles=5, time=time, flic=flics.explo}
--Cloud{particles=11, time=1, velocity={0,0,0.3}, size=0.1, radius2={0.3,0,0}}
--Scale{min=0.6}
--gObjects[2] = NewObject{billboard=flics.fog, movie=pMovie}
local explosion = Explosion{rolltime=0.8, particles=5, time=time, flic=flics.explo}
NewMovie()
Scale{min=0.3}
gObjects[2] = NewObject{subobject=explosion, movie=pMovie}

LightMovie{offset={0,0,0}, size=0.7, deviation=0.2, color={1,0.6,0,0.3}}
--FadeScale{}
gObjects[3] = Radiosity{movie=pMovie}

NewMovie()
Clamp{range=1}
NewObject{subobject=gObjects, movie=pMovie, bone=kDrwBoneCrown}
EffectSave("ExtinctOld")


NewMovie(5)
Translation{max={0,-1,0}, trail=1, range=1, play=kDrwPlayClamped}
Scale{min=0.5}
Color{min=0.8, max=0.1, dim=kDrwDimParticle}
--Clamp{dimin=kDrwDimTimeScaled}
NewObject{mesh=flics.stones[1], movie=pMovie, restriction=kDrwCsProjectile, bone=kDrwBoneChest, bonesource=kDrwBoneChest, boundingradius=30}
EffectSave("RockBullet")

NewMovie(5)
Translation{max={0,-1,0}, dim=kDrwDimParticle}
Translation{max={0,0,1.5}, path=kDrwPathNegParabola, play=kDrwPlayBounce, range=0.5, dim=kDrwDimTimeScaled, trail=-0.2}
Scale{min=0.5}
Color{min=0.8, max=0.1, dim=kDrwDimParticle}
--Clamp{dimin=kDrwDimTimeScaled}
NewObject{mesh=flics.stones[1], movie=pMovie, restriction=kDrwCsProjectile, bone=kDrwBoneChest, bonesource="Shoot", boundingradius=30}
EffectSave("StoneTower")


------------------------------------------------------- wave projectiles
function WaveProjectile(params)
	local color1	= params.color1 or 1
	local color2	= params.color2 or 1
	local particles = params.particles or 11
	local bonesource= params.bonesource or kDrwBoneChest

	local particle = CombineParticles{ratio=0.4, flic1=flics.smoke, color1=color1, color2=color2}
	Fire{particles=particles, color1=1, color2=0, ground=0, width=0.2, top=0, size=0.7, size1=1.5, size2=0, height=5}
	local fire = NewObject{subobject=particle, movie=pMovie}

	NewMovie()
	Rotation{min=90, axis="x", direction=0}
	local fire2 = NewObject{subobject=fire, movie=pMovie}

	NewMovie()
	--Translation{max={0,10,0}, range=1, play=kDrwPlayContinous}
	
	return NewObject{subobject=fire2, movie=pMovie, restriction=kDrwCsProjectile, bone=kDrwBoneChest, bonesource=bonesource, boundingradius=130}
end


local FireBurstProjectile = WaveProjectile{color1={1,0.5,0,0.6}, color2={1,1,0.6,1}}
EffectSave("WaveFire")

local FireBurstProjectile = WaveProjectile{color1={1,0.5,0,0.6}, color2={1,1,0.6,1}, bonesource="Shoot"}
EffectSave("WaveFireTower")

WaveProjectile{color1={0,0.5,1,0.6}, color2={0.5,0.9,1,1}}
EffectSave("WaveIce")

--------------------------------------------- new fireburst
NewMovie()
Scale{min=0.1}
NewObject{subobject=FireBurstProjectile, movie=pMovie}
EffectSave("FireBurst")

--------------------------------------------- new fireballhit
NewMovie(20)
Burst{particles=20, time=0.5, radius1=0.3, radius2=0.8}
Color{min={0.6,0.1,0.1,0.7}}
Scale{min=1.5}
FadeScale{}
local ball1 = NewObject{billboard=flics.ice, movie=pMovie}

NewMovie(12)
Burst{particles=12, time=0.3, radius1=0.3, radius2=1}
Color{min={1,0.8,0.2,1}}
Scale{min=0.04}
local ball2 = NewObject{billboard=flics.spark, movie=pMovie}

NewMovie()
FigureScale(2)
NewObject{subobject={ball1, ball2}, movie=pMovie, bone=kDrwBoneChest, restriction=kDrwCsWorld}
EffectSave("FireBall")


------------------------------------------- cursor

Cloud{time=1, offset={0.4,0,0}, velocity={0,0,1}, color1={0.5,0.4,0.3,0.6}, color2={1,1,1,0}}
Scale{min=0.8}
local cloud = NewObject{billboard=flics.dust, movie=pMovie, rotate=1}

local particles=7
NewMovie(particles)
Translation{min={0,0,0.2}}
Throw{time=time, particles=particles, velocity={0,0,1.8},  gravity={0,0,-4.5}, trail=0}
Burst{particles=particles, time=time,  radius1=0.2, radius2=1.7, trail=0}
Color{min={1,1,1,1}, max={0.4,0.1,0.2,0},range=time, path=kDrwPathParabola, play=kDrwPlayClamped}
Scale{min=0.1}
Choose{dim=kDrwDimParticle}
local burst = NewObject{mesh=flics.stones, movie=pMovie, rotate=1}

NewMovie()
Color{min={0.25,0.15,0,0.8}, max={0,0,0,0}, range=1, play=kDrwPlayClamped}
Scale{min=0.2, max=1.7, range=1}
local shadow = NewObject{decal=flics.circledark, movie=pMovie}

NewObject{subobject={burst, cloud, shadow}}
EffectSave("Cursor")

------------------------------------------------------------------enlightenment
NewMovie(12)
Burst{radius2=0.5, particles=12}
Scale{min=0.3, max=0.1, trail=1}
Color{min=1, max=0, trail=1, path=kDrwPathSine}
NewObject{billboard=flics.star4point, movie=pMovie, bone=kDrwBoneCrown, restriction=kDrwCsResetRotation}
EffectSave("Enlightenment")


----------------------------------------------------------------- confuse
NewMovie(22)
Rotation{axis="x", min=90, direction=0}
Sphere{radius=0.2, trail=3}
Scale{min=0.04}
NewObject{billboard=flics.star_halo, movie=pMovie, bone=kDrwBoneCrown}
EffectSave("Confuse")

CircleTrail{radius=0.3, rolltime=0, time=0.5, length=0.3}--, startcolor={0,1,0,0.5}, stopcolor={0,0,1,0.1}}
Scale{min=0.5}
local c1 = NewObject{billboard=flics.whiteorange, movie=pMovie}
local c2 = NewObject{billboard=flics.sol_bb, movie=pMovie}
local c3 = NewObject{billboard=flics.sol_bg, movie=pMovie}

NewMovie(2)
Translation{min={0,0,-0.1}}
Rotation{dim=kDrwDimParticle}
--Choose{dim=kDrwDimParticle}
NewObject{subobject=c3, movie=pMovie, bone=kDrwBoneCrown, restriction=kDrwCsWorld}
EffectSave("Confuse")



--------------------------------------------- new fireballhit
NewMovie(20)
Burst{particles=20, time=0.5, radius1=0.3, radius2=0.8}
Color{min={0.6,0.1,0.1,0.7}}
Scale{min=1.5}
FadeScale{}
local ball1 = NewObject{billboard=flics.ice, movie=pMovie}

NewMovie(12)
Burst{particles=12, time=0.3, radius1=0.3, radius2=1}
Color{min={1,0.8,0.2,1}}
Scale{min=0.04}
local ball2 = NewObject{billboard=flics.spark, movie=pMovie}

NewMovie()
FigureScale(2)
NewObject{subobject={ball1, ball2}, movie=pMovie, bone=kDrwBoneChest, restriction=kDrwCsWorld}
EffectSave("FireBall")



-------------------------------------------- simple invisible
NewMovie()
TargetColor{min={0,0,0,0}}
NewObject{movie = pMovie}
EffectSave("SimpleInvis")


-------------------------------------------- self illusion
NewMovie()
TargetColor{min={1,1,1,0.4}, max={0.8,0.8,1,0.9}, path=kDrwPathCosine, play=kDrwPlayBounce, range=0.2}
NewObject{movie = pMovie}
EffectSave("SelfIllusion")

-------------------------------------------- spell invisible
NewMovie()
Scale{min=0.3}
Color{min=0.2}
local glow = NewObject{billboard=flics.circle, movie=pMovie}

local lObjects = AttachToBones{object=glow, bones=GetBones{"All", kDrwBoneHead, kDrwBoneCrown}, restriction=kDrwCsBone}
local glow = NewObject{subobject=lObjects}

NewMovie()
TargetColor{min={0,0,0,0.1}}
NewObject{subobject=glow, movie = pMovie}
EffectSave("Invisibility")


-------------------------------------------- wisp
NewMovie(11)
GlobalTrail{buffer=0.2, trail=1, path=kDrwPathParabola}
Rotation{axis="x", range=1.5, trail=2}
Rotation{range=2, trail=1}
Translation{max={0.1,0,0}, range=2.5, play=kDrwPlayBounce, trail=4}
Scale{min=0.15}
Color{min=0.5}
local wisp = NewObject{billboard=flics.star4point, movie=pMovie, restriction=kDrwCsResetRotation}

LightMovie{offset={0,0,0}, size=0.7, deviation=0.05, color={1,1,1,0.1}}
local radiosity = Radiosity{movie=pMovie, billboard=flics.lightblend1}

NewMovie()
Translation{min={0,0,0.1}}
NewObject{subobject={wisp, radiosity}, movie=pMovie, bone=kDrwBoneLeftShoulder}
EffectSave("Wisp")

LightMovie{offset={0,0,0}, size=0.7, deviation=0.05, color={0,0.8,0.4,0.2}}
local radiosity = Radiosity{movie=pMovie, billboard=flics.lightblend1}

NewMovie()
Translation{min={0,0,0.1}}
Color{min={0,1,0.8,1}}
NewObject{subobject={wisp, radiosity}, movie=pMovie, bone=kDrwBoneLeftShoulder}
EffectSave("WispGreen")


--------------------------------------------------- addon again
local shield = EffectGet("ThornShield")
local heal = EffectGet("SimpleHeal")

NewObject{subobject={heal, shield}}
EffectSave("WhiteEssence")

local heal = EffectGet("GreaterHeal")
NewObject{subobject={heal, shield}}
EffectSave("WhiteAlmightiness")


local shock = EffectGet("HeadShock")
local befriend = EffectGet("Forget")
local manatap = EffectGet("ManaEssence")
NewObject{subobject={shock, befriend, manatap}}
EffectSave("MentalAlmightiness")
EffectSave("MentalEssence")


local fire = WaveProjectile{particles=7, color1={1,0.5,0,0.8}, color2={1,1,0.6,1}}
local ice =	 WaveProjectile{particles=11, color1={0,0.5,1,0.3}, color2={0.5,0.9,1,0.7}}
local earth = EffectGet("RockBullet")

NewObject{subobject={ice, earth, fire}}
EffectSave("ElementalAlmightiness")
EffectSave("ElementalEssence")



----------------
Fire{buffer=0.5, particles=7, color1={0,0,1,1}, color2={1,0,1,0}, ground=0, width=0.2, top=0.1, height=2, size1=2, size2=0.2, path=kDrwPathParabola}
Translation{min={0,0,0.5}}
local fire = NewObject{billboard=flics.smoke, movie=pMovie, restriction=kDrwCsFloor+kDrwCsBone}

NewMovie(3)
Rotation{dim=kDrwDimParticle}
Rotation{range=3}
Translation{min={0.7,0,0}}
local right= NewObject{subobject=fire, movie=pMovie, restriction=kDrwCsWorld, bone=kDrwBoneRightFoot}

NewMovie(3)
Rotation{dim=kDrwDimParticle}
Rotation{range=3, max=-360}
Translation{min={0.7,0,0}}
local left = NewObject{subobject=fire, movie=pMovie, restriction=kDrwCsWorld, bone=kDrwBoneLeftFoot}

NewObject{subobject={right, left}}
EffectSave("FialDarg")

----------------------
---- Addon 2 
----------------------

NewMovie(1)
Choose{dim=kDrwDimParticle, path=kDrwPathRandom}
--Translation{max={0,-1,0}, dim=kDrwDimParticle}
Translation{max={0,0,10.5}, path=kDrwPathNegParabola, play=kDrwPlayBounce, range=0.5, dim=kDrwDimTimeScaled, trail=-0.2}
Rotation{axis="x", range=5}
Scale{min=1.5}
Color{min=0.9}--, max=0.1, dim=kDrwDimParticle}
--Clamp{dimin=kDrwDimTimeScaled}
NewObject{mesh=flics.stones, movie=pMovie, restriction=kDrwCsProjectile, bonesource=kDrwBoneChest, boundingradius=30}
EffectSave("SiegeStone")


----------------------
local fireparticle = CombineParticles{ratio=0.4, flic1=flics.smoke, color1={1,0.5,0,0.6}, color2={1,1,0.6,1}}

Fire{buffer=0.5, time=0.5, size=1, size1=3, height=0, color1=1, color2=0}
local siegefire = NewObject{subobject=fireparticle, movie=pMovie}

Fire{buffer=0.5, time=0.5, size=1, size2=3, height=0, color1={0,0,0,1}, color2=0}
local siegesmoke = NewObject{billboard=flics.plasma, movie=pMovie}

NewMovie(1)
Translation{max={0,0,10.5}, path=kDrwPathNegParabola, play=kDrwPlayBounce, range=0.5, dim=kDrwDimTimeScaled}
NewObject{subobject={siegesmoke, siegefire}, movie=pMovie, restriction=kDrwCsProjectile, bonesource=kDrwBoneChest, boundingradius=30}
EffectSave("SiegeFire")


----------------------
local flash = Lightning{range=0.1, flic=flics.simplelightning, mode=2}
NewMovie()
Color{min={0,0.8,1,0.4}, max=0.1, dim=kDrwDimRandom}
Translation{min={0,0,-1.5}}
local flash = NewObject{subobject=flash, movie=pMovie}

NewMovie(3)
Rotation{axis="x", min=-30, max=-160, dim=kDrwDimTimeScaled, direction=1}--, trail=-0.2}
Scale{min=2.5}
local siegeflash = NewObject{subobject=flash, movie=pMovie}

Fire{buffer=0.5, time=0.5, size1=0.3, size2=2, height=0, color1={0,0.8,1,0.6}, color2=0}
local siegesmoke = NewObject{billboard=flics.plasma, movie=pMovie}

NewMovie(1)
Translation{max={0,0,10.5}, path=kDrwPathNegParabola, play=kDrwPlayBounce, range=0.5, dim=kDrwDimTimeScaled}
NewObject{subobject={siegesmoke, siegeflash}, movie=pMovie, restriction=kDrwCsProjectile, bonesource=kDrwBoneChest, boundingradius=30}
EffectSave("SiegeFlash")


--------------------------
NewMovie(10)
Translation{max={0,0,-3}, dim=kDrwDimParticle}
Rotation{dim=kDrwDimParticle}
Rotation{range=0.4, max=-360,}
Translation{min={0.2,0,0}, max={1,0,0}, play=kDrwPlayBounce, path=kDrwPathNegParabola, dim=kDrwDimParticle}
Scale{min=1, max=0.2, dim=kDrwDimParticle}
Color{min={0.5,1,0.5,0.8}, max={1,1,1,0}, dim=kDrwDimParticle}
--GlobalTrail{buffer=0.5, range=1, trail=1}
local whirl = NewObject{billboard=flics.star_halo, movie=pMovie}

NewMovie(1)
Rotation{axis="x", min=-30, max=-160, dim=kDrwDimTimeScaled, direction=1}
local whirlturn = NewObject{subobject={whirl}, movie=pMovie}

Fire{buffer=0.5, time=0.5, size1=0.3, size2=2, height=0, color1={0.5,1,0.5,0.6}, color2=0}
local siegesmoke = NewObject{billboard=flics.plasma, movie=pMovie}

NewMovie(1)
Translation{max={0,0,10.5}, path=kDrwPathNegParabola, play=kDrwPlayBounce, range=0.5, dim=kDrwDimTimeScaled}
NewObject{subobject={siegesmoke, whirlturn}, movie=pMovie, restriction=kDrwCsProjectile, bonesource=kDrwBoneChest, boundingradius=30}
EffectSave("SiegeStars")


--------------------------
NewMovie(3)
Rotation{axis="x", dim=kDrwDimParticle, path=kDrwPathRandom}
Rotation{dim=kDrwDimParticle}
Rotation{}
Translation{min={1,0,0}}
Scale{min=0.3}
Color{min={1,0.5,1,1}}
local planets = NewObject{mesh=flics.iceshield4, movie=pMovie}

NewMovie(1)
Rotation{axis="y", range=1.5}
Scale{min=0.8}
Color{min={1,0.4,0.7,1}}
local center = NewObject{mesh=flics.iceshield4, movie=pMovie}

Fire{buffer=0.5, time=0.5, size1=0.3, size2=2, height=0, color1={0.5,0,0.5,0.3}, color2=0}
local siegesmoke = NewObject{billboard=flics.plasma, movie=pMovie}

NewMovie(1)
Translation{max={0,0,10.5}, path=kDrwPathNegParabola, play=kDrwPlayBounce, range=0.5, dim=kDrwDimTimeScaled}
NewObject{subobject={siegesmoke, planets, center}, movie=pMovie, restriction=kDrwCsProjectile, bonesource=kDrwBoneChest, boundingradius=30}
EffectSave("SiegePlanets")

------------------------------
NewObject{subobject={EffectGet("Quickness"), EffectGet("FastFighting"), EffectGet("Dexterity")}}
EffectSave("Eternity")

-------------------------------
-------------------------------------------- 
Smoke{trail=1, particles=7, offset={0.2,0,0}, velocity={0.3,0,0.5}, gravity={0,0,-1}, time=4, growth=10, color2=0, color1=0.8, colorplay=kDrwPlayLooped}
Rotation{dim=kDrwDimParticle}
Scale{min=0.1}
TargetColor{min=0.4}
NewObject{billboard=flics.plasma, movie=pMovie, bone=kDrwBoneChest}
EffectSave("Revenge")


-------------------------------------------- 
Smoke{trail=1, particles=7, offset={0.2,0,0}, velocity={0.3,0,0.5}, gravity={0,0,-1}, time=4, growth=10, color2=0, color1={0,0,0,0.9}, colorplay=kDrwPlayLooped}
Rotation{dim=kDrwDimParticle}
Scale{min=0.1}
TargetColor{min={0.2,0.1,0,0.6}}
NewObject{billboard=flics.plasma, movie=pMovie, bone=kDrwBoneChest}
EffectSave("Torture")

--------------------------------------------
NewMovie(17)
Translation{min={0,0,1.5}}
local bounce=3
Translation{max={0,0,-1.5}, range=0.5/bounce, play=kDrwPlayBounce, path=kDrwPathParabola, trail=-0.5, dim=kDrwDimTimeScaled}
Scale{min=0.3, max=0.1, dim=kDrwDimParticle}
Color{min={1,0.5,0.5,1}}
Translation{max={0,-4,0}, dim=kDrwDimParticle}

local bouncer = NewObject{billboard=flics.sol_br, movie=pMovie, restriction = kDrwCsProjectile+kDrwCsFloor, bonesource=kDrwBoneChest, bone=kDrwBoneChest}

NewMovie()
Color{max=0, range=0.5, play=kDrwPlayClamped}
local flash = NewObject{billboard=flics.star_halo, movie=pMovie, bone=kDrwBoneChest, restriction=kDrwCsSwap}

NewObject{subobject={bouncer,flash}, boundingradius=30}
EffectSave("ResolveAssistantSilent")


NewMovie(3)
FigureScale(3)
Rotation{dim=kDrwDimParticle, path=kDrwPathRandom}
Translation{min={0,0,1.1}, max={0,0,0}, play=kDrwPlayClamped}
Scale{min=0, max={0.8,0.8,2.2}, play=kDrwPlayClamped}
Color{min=0.99}--,max=0, start=-1, dim=kDrwDimTimeToEnd, play=kDrwPlayClamped}
NewObject{mesh=flics.roots, movie=pMovie, restriction=kDrwCsWorld}
EffectSave("Roots")


NewMovie(1)
FigureScale(3)
Rotation{dim=kDrwDimParticle, path=kDrwPathRandom}
--Translation{max={0,0,-0.3}, start=-0.3, dim=kDrwDimTimeToEnd, play=kDrwPlayClamped}
--Scale{min=1, max={1,1,0}, start=-1, dim=kDrwDimTimeToEnd, play=kDrwPlayClamped}
Color{min=0,max=0.99, range=0.8, play=kDrwPlayClamped}
NewObject{mesh=flics.clay, movie=pMovie, restriction=kDrwCsWorld}
EffectSave("Clay")


---------------------- undead rohen
NewMovie(11)
Translation{max={0,0,-3}, path=kDrwPathParabola, trail=1}
Translation{max={0,-1,0}, path=kDrwPathNegParabola, trail=1}
--Scale{min=0.1, max=0.05, trail=1}
Color{min={0.3,0.5,1,0.4}, max=0, trail=1}
GlobalTrail{buffer=0.2, range=1, trail=1, path=kDrwPathParabola}
local eye=NewObject{billboard=flics.circle, movie=pMovie, restriction=kDrwCsWorld}

NewMovie(2)
Translation{min={0.22,0.15,-0.08}, max={0.22,0.15,0.24}, dim=kDrwDimParticle}
Scale{min=0.1}
local roheneyes=NewObject{subobject=eye, movie=pMovie, bone=kDrwBoneHead, restriction=kDrwCsBone}
EffectSave("RohenUndead")

NewMovie(2)
Translation{min={-0.2,-0.3,-0.4}, max={-0.2,-0.3,1.2}, dim=kDrwDimParticle}
Scale{min=0.2}
local saureyes=NewObject{subobject=eye, movie=pMovie, bone="bone41", restriction=kDrwCsBone}

NewObject{subobject={roheneyes, saureyes}}
EffectSave("RohenUndeadRiding")

------------------------------------------- more addon2
NewObject{subobject={EffectGet("LifeTap"), EffectGet("ManaIn"), EffectGet("ManaIn")}}
EffectSave("Cannibalize")

NewMovie()
TargetColor{min=0, max=0.99, range=0.1}
NewObject{movie=pMovie}
EffectSave("Mutation")

NewMovie()
TargetColor{min={1,1,1,0.5}, max={1,0.5,0.5,0.9}, path=kDrwPathCosine, play=kDrwPlayBounce, range=0.4}
NewObject{movie = pMovie}
EffectSave("MirrorImage")


NewMovie()
Rotation{max=-360}
Translation{min={0,0,0.1}}
Color{min=0.6}
NewObject{mesh=flics.skull_mesh, movie=pMovie, bone=kDrwBoneCrown}
EffectSave("Vodoo")

NewMovie()
Translation{max={0,0,2.5}, path=kDrwPathNegParabola, play=kDrwPlayBounce, range=0.5, dim=kDrwDimTimeScaled, trail=-0.2}
Rotation{axis="x", range=5}
Scale{min=1.5}
Color{min=0.9}
NewObject{mesh=flics.skull_mesh, movie=pMovie, restriction=kDrwCsProjectile, bonesource=kDrwBoneCrown, bone=kDrwBoneHead, boundingradius=3}
EffectSave("VodooBounce")
