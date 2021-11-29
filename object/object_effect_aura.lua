CircleTrail{time=10, rolltime=0, radius=0.5, length=1, stopcolor=1}
Scale{min=1.5}
local circle = NewObject{billboard=flics.star_halo, movie=pMovie}

NewMovie()
Rotation{axis="x", direction=0, min=90}
Rotation{axis="y", direction=0, min=30}
Translation{min={0,0,0.5}}
NewObject{subobject=circle, bone=kDrwBoneCrown, restriction=kDrwCsBone + kDrwCsResetRotation, movie=pMovie}
EffectSave("Halo")



NewMovie()
Translation{min={0,0,2}}
Scale{min=0.5, max=1, range=4, play=kDrwPlayBounce, path=kDrwPathCosine}
Color{min=0.5, max=1, range=5, play=kDrwPlayBounce, path=kDrwPathCosine}
--Rotation{axis="x", range=10}
NewObject{billboard=flics.star_halo, movie=pMovie, restriction=kDrwCsResetRotation}
EffectSave("AuraStar")


function Aura(params)
	params.length		= params.length or 0.4
	params.particles	= params.particles or 11
	params.time			= params.time or 2
	params.rolltime		= params.rolltime or 15
	params.startsize	= params.startsize or 0.2
	params.stopsize		= params.stopsize or 0.1
	params.startcolor	= params.startcolor or 1
	params.stopcolor	= params.stopcolor or 0
	params.parts		= params.parts or 3
	params.flic			= params.flic or flics.star6point
	params.size			= params.size or 1

	CircleTrail(params)
	Scale{min=params.size}
	local trail

	if (type(params.flic) == "string") then
		trail = NewObject{billboard=params.flic, movie=pMovie}
	else
		trail = NewObject{subobject=params.flic, movie=pMovie}
	end

	NewMovie(params.parts)
	Rotation{axis="z", dim=kDrwDimParticle}
	return NewObject{subobject=trail, bone=kDrwBoneMain, restriction=kDrwCsWorld, movie=pMovie}
end

function AuraResolve(params)
	params.particles	= params.particles or 10
	params.speed		= params.speed or 40
	params.trail		= params.trail or -0.2
	params.startsize	= params.startsize or 5
	params.stopsize		= params.stopsize or 0.2
	params.startcolor	= params.startcolor or 0
	params.stopcolor	= params.stopcolor or 0

	NewMovie(params.particles)
	Translation{max={0,params.speed,0}, trail=params.trail, range=1, play=kDrwPlayContinous}
	Scale{min=1, max=params.startsize, dim=kDrwDimParticle, path=kDrwPathParabola}
	Scale{min=1, max=params.stopsize, dim=kDrwDimTimeScaled, range=1}
	Color{min=params.startcolor, max=params.stopcolor, dim=kDrwDimParticle}
	Clamp{dimin=kDrwDimTimeScaled}
end

function AuraDispel(params)
	params.particles	= params.particles or 30
	params.flic			= params.flic or flics.star6point
	params.color1		= params.color1 or 0.8
	params.color2		= params.color2 or 0

	NewMovie(params.particles)
	Throw{velocity={0,0,0}, gravity={0,0,-2}, time=1.5, trail=0}
	Burst{radius1=1, radius2=1}
	Color{min=params.color1, max=params.color2, range=1.5, path=kDrwPathParabola}
	Scale{min=0.2}
	Clamp{range=1.5}
	NewObject{billboard=params.flic, movie=pMovie, bone=kDrwBoneChest}
end


------------------------------------------------------ Aura white
AuraResolve{startcolor=0.7, stopcolor={0,0,0.5,0}}
NewObject{billboard=flics.star6point, movie=pMovie, restriction=kDrwCsAim, bone=kDrwBoneChest, bonesource=kDrwBoneChest}
EffectSave("AuraResolveWhite")

Aura{size=1.2, startcolor=0.7, stopcolor={0,0,0.5,0}}
EffectSave("AuraWhite")

AuraDispel{particles=30, flic=flics.start6point}
EffectSave("DispelWhiteAura")


------------------------------------------------------ Aura black
--local particle = CombineParticles{flic1=flics.fog, color1={0,0.2,0,0.2}, flic2=flics.star6point}
local particle = flics.sol_rp

NewMovie()
Translation{min={0,0,0.5}}
particle=NewObject{billboard=particle, movie=pMovie, restriction=kDrwCsFloor}

AuraResolve{startcolor=0.7, stopcolor={0,0,0.5,0}}
NewObject{subobject=particle, movie=pMovie, restriction= kDrwCsAim}
EffectSave("AuraResolveBlack")

Aura{particles=15, flic=flics.sol_rp, size=1.2, startcolor=1, stopcolor=0}
EffectSave("AuraBlack")


AuraDispel{particles=30, flic=flics.sol_rp}
EffectSave("DispelBlackAura")


------------------------------------------------------ Aura mental
local particle = flics.sol_bg

AuraResolve{startsize=0.1, stopsize=0.1, startcolor={0,1,0.5,0.5}, stopcolor={0.8,1,0.5,1}}
NewObject{billboard=flics.blurry, movie=pMovie, restriction= kDrwCsAim, bone=kDrwBoneHead, bonesource=kDrwBoneHead}
EffectSave("AuraResolveMental")
EffectSave("AuraResolveTest")

Aura{particles=15, flic=flics.blurry, size=1, startcolor={0,1,0.5,0.8}, stopcolor={0,0.2,1,0.1}}
EffectSave("AuraMental")
EffectSave("AuraTest")

AuraDispel{particles=30, flic=particle, color1={0,1,0.5,0.8}, color2={0,0.5,1,0}}
EffectSave("DispelMentalAura")




---------------- new aura dispels?
function AuraDispelBounced(params)
	local flic = params.flic or flics.star6point
	local time = params.time or 3

	Bounce{particles=10, velocity={0,0,0}, bounce=4, trail=-1, range=time}
	Scale{min=0.3, max=0.1, dim=kDrwDimParticle}
	Color{min=0.5}
	Translation{max={-3,0,0}, dim=kDrwDimParticle}
	local bouncer = NewObject{billboard=flic, movie=pMovie, restriction=kDrwCsFloor}

	NewMovie()
	Scale{min=2}
	Color{min=1, max=0, range=0.5, play=kDrwPlayClamped, path=kDrwPathParabola}
	local flash = NewObject{billboard=flic, movie=pMovie, bone=kDrwBoneChest}

	NewMovie(3)
	Rotation{dim=kDrwDimParticle}
	Translation{min={0.2,0,0}}
	Translation{max={3,0,0}, range=time, path=kDrwPathNegParabola}--, dim=kDrwDimTimeScaled}
	local bounce3 = NewObject{subobject=bouncer, movie=pMovie, restriction=kDrwCsWorld}

	NewMovie()
	Clamp{range=time}
	return NewObject{subobject={bounce3, flash}, movie=pMovie}
end

AuraDispelBounced{}
EffectSave("AuraBounceWhite")

AuraDispelBounced{flic=flics.sol_rp}
EffectSave("AuraBounceBlack")

AuraDispelBounced{flic=flics.sol_bg}
EffectSave("AuraBounceMental")

