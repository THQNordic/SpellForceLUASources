function pTest(params)
	doscript("object_effect_test2")
	params.noreload=1
	TestEffect(params)
end


Cloud{time=0.5}
local cloud=NewObject{billboard=flics.circle, movie=pMovie, restriction=kDrwCsResetRotation}

NewMovie(1) 
Scale{min={5,1,1}}
Translation{min={0,0,2}}
NewObject{subobject=cloud, movie=pMovie, restriction=kDrwCsResetRotation}
EffectSave("pTest1")


NewMovie(30)
Scale{range=3, min=1, max=2, path=kDrwPathNegParabola, play=kDrwPlayClamped}
Color{range=3, min={1,1,1,1}, max={0.5,0.5,0.5,0}, path=kDrwPathNegParabola, play=kDrwPlayClamped}
Translation{max={0,0,6}, dim=kDrwDimParticle}
Translation{min={0,0,1}}
Rotation{dim=kDrwDimParticle, path=kDrwPathRandom}
Scale{min=0.5, max=2, dim=kDrwDimParticle}
Translation{min={0.5,0,0}}
--Rotation{axis="x", range=3}

local cloud = NewObject{billboard=flics.smoke, movie=pMovie}

Fire{height=5, size=1, top=0, ground=0, particles=30, color1={1,1,0.5,0.5}, color2={1,0,0,0}}
Translation{min={0,0,0.5}}
Clamp{range=0.2, fadeout=0.2}
local fire = NewObject{billboard=flics.explo, movie=pMovie}
EffectSave("pTest3")


NewMovie(1)
Translation{range=3, max={0,0,1}, path=kDrwPathParabola, play=kDrwPlayClamped}
Rotation{axis="y", min=90, direction=0}
NewObject{subobject={cloud, fire}, movie=pMovie}
EffectSave("pTest2")


local range=1.5

NewMovie(55)
Rotation{axis="z", dim=kDrwDimParticle, path=kDrwPathRandom, play=kDrwPlayContinous}
Translation{max={0,0,5}, dim=kDrwDimParticle, path=kDrwPathRandom, play=kDrwPlayContinous}
Translation{max={0,0,20}, range=range, trail=0.2}
Translation{max={0,0,-14}, range=range, path=kDrwPathParabola}
Rotation{dim=kDrwDimParticle, path=kDrwPathRandom, play=kDrwPlayContinous}
Translation{max={0.2,0,0}, dim=kDrwDimParticle, path=kDrwPathRandom, play=kDrwPlayContinous}
Translation{min={0,0,0}, max={3,0,0}, range=range}
Rotation{axis="z", min=0, max=180, direction=1, dim=kDrwDimParticle, path=kDrwPathRandom, play=kDrwPlayContinous}
Scale{max={2,2,3}, path=kDrwPathNegParabola, range=range}
Color{min={0.4,0.5,1,1}, max=0, path=kDrwPathParabola, range=range}

local crown = NewObject{billboard=flics.waterhit, movie=pMovie}

NewMovie(6)
Scale{min={1,1,5}, max={2,2,15}, range=range, path=kDrwPathNegParabola}
Rotation{dim=kDrwDimParticle, max=360, direction=-1}
Color{min={0.3,0.5,1,1}, max=0, path=kDrwPathParabola, range=range-0.2, play=kDrwPlayClamped}
local stem = NewObject{mesh=flics.waterhit, movie=pMovie}

NewMovie(22)
Throw{time=range, trail=0, velocity={0,0,5}}
Burst{time=range, trail=0, radius1=1, radius2=2}
Color{min={0.3,0.5,1,1}, max=0, path=kDrwPathParabola, range=range}
local root = NewObject{billboard=flics.waterhit, movie=pMovie}


NewMovie()
Scale{min=1}
Clamp{range=range}
NewObject{subobject={stem, crown, root}, movie=pMovie}
EffectSave("pTest4")




local fireparticle = CombineParticles{ratio=0.4, flic1=flics.smoke, color1={1,0.5,0,1}, color2={1,1,0.6,1}}
Fire{size2=0.5, time=2, particles=11, color1={1,1,1,1}, color2={1,0,0,0}, ground=0.3, width=0.3, top=0.5, size=3, height=2.5}
local fire = NewObject{subobject=fireparticle, movie=pMovie}

Smoke{wind={1,0,0}, particles=15, offset={0,0,2}, velocity={1,0,10}, gravity={0,0,0}, time=3, growth=2, color2={0.1,0.1,0.1,0}, color1={0.4,0.4,0.4,0.9}, colorplay=kDrwPlayLooped}
Scale{min=2}
local smoke = NewObject{billboard=flics.plasma, movie=pMovie, restriction=kDrwCsWorld}

NewMovie()
Translation{min={0,0,-0.5}}
--Scale{min={1,1,2}}
NewObject{subobject={smoke, fire}, movie=pMovie}
EffectSave("pTest5")
