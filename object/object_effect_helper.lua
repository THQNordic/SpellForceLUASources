-- this file registers all effect objects to the DrwObjectLibrary
-- this file uses pMovie and pObject as temporary global variables 

print("-- INITIALIZING EFFECTS   object_effect_*.lua")

gEffectNames={}
giEffects = 0

function EffectSave(name)
	giEffects = giEffects + 1
	if type(name) == "string" then
		gEffectNames[name] = giEffects
	end

	RegisterEffect(kGdEffectTest, giEffects, pObject)
end

function EffectList()
	--foreach(gEffectNames, function (v, i) print(format("Effect %3d: %s", i,v))  end)
	-- dump(gEffectNames)
end

function EffectGetId(vEffect)
	if type(vEffect) == "string" then
		return gEffectNames[vEffect]	
	else
		for i,v in gEffectNames do
			if (v==vEffect) then print(i) end 
		end
		return vEffect
	end
end

function EffectGet(vEffect)
	local iEffect = EffectGetId(vEffect)
	local pEffect

	if iEffect==nil then print("MISSING EFFECT", vEffect) return end

	if iEffect > 0 and iEffect <= giEffects then 
		pEffect = ObjectLibrary:GetObject(kGtCategoryEffect, iEffect, kGdEffectTest)
		pEffect = tolua.cast(pEffect, "CDrwEffectObject")
	else
		print("UNKNOWN EFFECT", name)
	end	

	return pEffect
end

function EffectSound(params)
	local pEffect=EffectGet(params.effect)

	if pEffect==nil then return end

	local radius = pEffect:GetBoundingRadius() --preserve radius
	NewMovie()
	Sound(params.sound)
	NewObject{subobject=pEffect, movie=pMovie, boundingradius=radius}
	EffectSave(params.new)
end

-------------------------------------------------------------------- Register
-- register effect object
function RegisterEffect(type_id, line_id, object, sound)
	if type_id then
		if sound then
			local pEffect = object or pObject
			local radius = pEffect:GetBoundingRadius() --preserve radius

			NewMovie()
			Sound(sound)
			RegisterEffect(type_id, line_id, NewObject{subobject=object, movie=pMovie, boundingradius=radius})
		else
			ObjectLibrary:AddObject(object or pObject, kGtCategoryEffect, line_id, type_id)
		end

	else
		error("type_id undefined!")
	end
end

-------------------------------------------------------------------- Register
function SpellEffect(params)
	if params.default then
		RegisterEffect(params.default, params.line or 0, EffectGet(params.hit), params.hitsound)
		return
	end

	if params.world then
		RegisterEffect(kGdEffectSpellHitWorld, params.line, EffectGet(params.world), params.worldsound)
	end

	if params.hit then
		RegisterEffect(kGdEffectSpellHitTarget, params.line, EffectGet(params.hit), params.hitsound)
	end

	if params.cast then
		RegisterEffect(kGdEffectSpellCast, params.line, EffectGet(params.cast), params.castsound)
	end
	if params.resolve then
		RegisterEffect(kGdEffectSpellResolve, params.line, EffectGet(params.resolve), params.resolvesound)
	end

	if params.self then
		RegisterEffect(kGdEffectSpellResolveSelf, params.line, EffectGet(params.self), params.selfsound)
	end

	if params.projectile then
		RegisterEffect(kGdEffectProjectile, params.line, EffectGet(params.projectile), params.projectilesound)
	end

	if params.aura then
		RegisterEffect(kGdEffectAuraResolve, params.line, EffectGet(params.aura), params.aurasound)
	end

	if params.chain then
		RegisterEffect(kGdEffectChainResolve, params.line, EffectGet(params.chain), params.chainsound)
		print(kGdEffectChainResolve, params.chain, EffectGet(params.chain))
	end

	if params.dot then
		RegisterEffect(kGdEffectSpellDOTHitTarget, params.line, EffectGet(params.dot), params.dotsound)
	end
end
-------------------------------------------------------------------- New Movie
-- create a new object and store it in pMovie - for addition of movie effects
function NewMovie(particles)
	particles = particles or 1 -- at least 1 particle
	pMovie = CDrwParticleMovie:new()
	pMovie:SetNumberOfParticles(particles)
	
	--if particles > 1 then pMovie:SetGlobalTrailTime(0.5/particles) end -- enable for testing...
	return pMovie
end

-------------------------------------------------------------------- New Light
-- create a new light to be stored in the lights table
function NewLight(movie, params)
	if (params == nil) then params = {} end

	local pLight = ObjectLibrary:CreateNewEffect(movie)
	local ElementLight = pLight:ElementLight()
	ElementLight:SetSphericalLight(params.Att1 or 0, params.Att2 or 1, 1,1,1,0,0,0)
	-- local element = pLight:ElementBillboard("system_element_default.msh"); -- use this to visualize lights as billboards!
	return pLight
end

-------------------------------------------------------------------- New Object
-- create a new effect object and store it in pObject - for either registration or use as subobject
-- required entry in params: movie
-- optional entries: bone, restriction, boundingradius, bonesource
-- optional elements to add: billboard, mesh, subobject, light

function NewObject(params)
	-- set up object
	
	pObject = ObjectLibrary:CreateNewEffect(params.movie or gNoMove, params.restriction or kDrwCsParent, params.boundingradius or 1.5) 
	local Effect = tolua.cast(pObject, "CDrwEffectObject")
	Effect:SetBone(params.bone or 0)
	Effect:SetBoneSource(params.bonesource or 0)
	Effect:CastShadow(params.shadow or 0)

	-- and init with the billboards
	if params.billboard ~= nil then
		if type(params.billboard) == "string" then
			local pElement = pObject:ElementBillboard(params.billboard..".msh")
			pElement:SetIllumination(kDrwIlluminationNone) -- only selfillumination for billboards...
		else -- if not a string, it should be a table containing strings
			for i,v in params.billboard do
				local pElement = pObject:ElementBillboard(v..".msh")
				pElement:SetIllumination(kDrwIlluminationNone) -- only selfillumination for billboards...
			end
		end
	end

	-- or a terrain-decal
	if params.decal ~= nil then
		if type(params.decal) == "string" then
			local pElement = pObject:ElementDecal(params.decal..".msh")
		else -- if not a string, it should be a table containing strings
			for i,v in params.decal do
				local pElement = pObject:ElementDecal(v..".msh")
			end
		end
	end

	-- maybe also meshes:
	if params.mesh ~= nil then
		if type(params.mesh) == "string" then
			pObject:ElementMesh(params.mesh..".msh")
		else -- if not a string, it should be a table containing strings
			for i,v in params.mesh do
				pObject:ElementMesh(v..".msh")
			end
		end
	end

	-- maybe also skin:
	if params.skin ~= nil then
		if type(params.skin) == "string" then
			pObject:ElementSkinAnimated(params.skin..".msh")
		else -- if not a string, it should be a table containing strings
			for i,v in params.skin do
				pObject:ElementSkinAnimated(v..".msh")
			end
		end
	end


	-- maybe also subobjects:
	if params.subobject ~= nil then
		if type(params.subobject) == "userdata" then
			pObject:ElementSubObject(tolua.cast(params.subobject, "CDrwEffectObject"))
		else -- if not an object, it should be a table containing objects
			for i,v in params.subobject do
				if (v ~= nil) then
					pObject:ElementSubObject(tolua.cast(v, "CDrwEffectObject"))
				end
			end
		end
	end

	-- light is an optional part of the object
	if params.light ~= nil then
		-- if any particle elements added, i need to wrap them up so their movie doesn't affect the light
		-- (if only subobjects were added to this object, i guess i can safely add the light without wrapping it up)
		if params.billboard or params.mesh then 
			local pContainer
			pContainer = ObjectLibrary:CreateNewEffect(gNoMove) -- dummy movie which does no motion at all
			pContainer:ElementSubObject(tolua.cast(pObject, "CDrwEffectObject"))
			-- wrap object in a container object, so the lights won't get multiplied by params.movie
			pObject = pContainer
		end
		pObject:ElementSubObject(tolua.cast(params.light, "CDrwEffectObject"))
	end

	return pObject
end

-------------------------------------------------------------------- set effect params
function SetEffectParams(pEffect,params)
	local start			= params.start or 0
	local range			= params.range or 1
	local play			= params.play or kDrwPlayLooped
	local path			= params.path or kDrwPathLinear
	local dim			= params.dim or kDrwDimTime

	assert(range > 0)

	if type(params.path) == "userdata" then	  -- komplex path to use
		pEffect:SetPath(params.path)
		pEffect:SetRangeAndModes(start, start + range, play, kDrwPathLinear, dim)
	else
		pEffect:SetRangeAndModes(start, start + range, play, path, dim)
	end

	if params.trail then
		if type(params.trail) == "userdata" then
			pEffect:SetTrailVariable(params.trail)
		else
			pEffect:SetTrailConstant(params.trail)
		end
	end
end

-------------------------------------------------------------------- trail to atttach to transformation
function Path(params)
	local pEffect = pMovie:AddPath()
	foreach(params, function(i, pair)
		-- print(pair[1], pair[2])
		%pEffect:AddValue(pair[1], pair[2])
	end)

	return pEffect
end

function Trail(params)
	local pEffect = pMovie:AddTrail()
	local min = params.min or 0
	local max = params.max or min
	
	SetEffectParams(pEffect, params)
	pEffect:SetRange(min, max)

	return pEffect
end

function Animation(params)
	local Anim = FindAnim(params.file)
	-- print(params.file)
	if (Anim == nil) then 
		return 
	end
	-- print("found", params.file)
	local pEffect = pMovie:EffectAnimation(params.file..".boa")
	SetEffectParams(pEffect, params)
end
	
-------------------------------------------------------------------- rotation
function Rotation(params)
	local pEffect = pMovie:AddRotation()
	local direction = params.direction or -1
	local min=(params.min or 0)
	local max

	if direction == 0 then
		max = (params.max or min)
	else
		max = (params.max or 360)
	end

	min = min * 6.28/360
	max = max * 6.28/360

	if params.axis == "x" then 
		pEffect:SetAxisAndAngles( 1,0,0, min, max, direction) -- x-axis, full rotation, negative direction
	elseif params.axis == "y" then 
		pEffect:SetAxisAndAngles( 0,1,0, min, max, direction) -- y-axis, full rotation, negative direction
	else
		pEffect:SetAxisAndAngles( 0,0,1, min, max, direction) -- z-axis, full rotation, negative direction
	end

	SetEffectParams(pEffect, params)
end

-------------------------------------------------------------------- translation
function Translation(params)
	local pEffect = pMovie:AddTranslation()
	if params.min then
		pEffect:SetStart(params.min[1],params.min[2],params.min[3])
	end

	params.max = params.max or params.min -- if min given, but not max, use min for both
	
	if params.max then
		pEffect:SetEnd(params.max[1],params.max[2],params.max[3])
	end
	SetEffectParams(pEffect, params)
end

-------------------------------------------------------------------- scale
function Scale(params)
	local pEffect = pMovie:AddScale()
	if params.min then
		if type(params.min) == "number" then
			pEffect:SetStart(params.min,params.min,params.min)
		else
			pEffect:SetStart(params.min[1],params.min[2],params.min[3])
		end
	end

	params.max = params.max or params.min -- if min given, but not max, use min for both

	if params.max then
		if type(params.max) == "number" then
			pEffect:SetEnd(params.max,params.max,params.max)
		else
			pEffect:SetEnd(params.max[1],params.max[2],params.max[3])
		end
	end
	SetEffectParams(pEffect, params)
end

-------------------------------------------------------------------- choose
function Choose(params)
	local pEffect = pMovie:EffectChoose()
	SetEffectParams(pEffect, params)
end


-------------------------------------------------------------------- color
function ColorParams(params, targetcolor)
	local pEffect

	if (targetcolor == 0) then
		pEffect = pMovie:EffectColor()
	else
		pEffect = pMovie:EffectTargetColor()
	end

	SetEffectParams(pEffect,params)

	local min				= params.min or {1,1,1,1}
	local max				= params.max or min

	if type(min) == "number" then
		min = {1,1,1,min}
	end

	if type(max) == "number" then
		max = {min[1], min[2], min[3], max}
	end

	local pColorStart = VEC_Color_RGBA_F32:new(min[1], min[2], min[3], min[4])
	local pColorStop = VEC_Color_RGBA_F32:new(max[1], max[2], max[3], max[4])
	pEffect:SetRange(pColorStart, pColorStop)
	pColorStart:delete()
	pColorStop:delete()
end

function Color(params)
	ColorParams(params, 0)
end

function TargetColor(params)
	ColorParams(params, 1)
end

-------------------------------------------------------------------- change particle numbers
-- a shortcut for Changer of Particle Numbers:
function ChangeNumbers(params)
	local pEffect = pMovie:EffectParticleNumbers()
	SetEffectParams(pEffect,params)
end

-------------------------------------------------------------------- set time for movement lag
function GlobalTrail(params)
	pMovie:SetGlobalTrailTime(params.buffer or params.range or 0)

	local pEffect = pMovie:EffectGlobalTrail()
	SetEffectParams(pEffect,params)
end
-------------------------------------------------------------------- find sound
-- just a shortcut for AddSound
function Sound(params)
	local name = params
	local play = kDrwPlayClamped
	local length = 0

	if type(params) == "table" then
		name = params.name
		play = kDrwPlayLooped
		length = params.length	
		--dump(params)	
	end

	if DrwSoundId[name] then
		local pEffect = pMovie:AddSound(DrwSoundId[name], 0.1, length)
		pEffect:SetRangeAndModes(0.1, length, play)
		return
	end
	
	-- not found? try again with shortened id
	-- e.g. spell_hit if spell_hit_black is not defined
	--print(name)
	--assert(name ~=nil)
	for i = strlen(name)-1,4,-1 do -- try everything from length-1 down to 4
		local shorter_id = strsub(name,1,i)
		if DrwSoundId[shorter_id] then
			local pEffect = pMovie:AddSound(DrwSoundId[shorter_id], 0.1, length)
			pEffect:SetRangeAndModes(0.1, length, play)
			print ("SOUND MISSING", name, "replaced by", shorter_id)
			return
		end
	end

	print ("SOUND MISSING", name)
end

-------------------------------------------------------------------- enum strings
-- helper function that creates a table with enumerated Strings
function EnumeratedStrings(string, size)
	local t = {}
	for i = 1,size do
		t[i] = format(string, i)
	end
	return t
end

-------------------------------------------------------------------- rendermode
function RenderMode(flic, mode)
	if type(flic) == "string" then
		DrwMeshChangeRenderMode(flic ..".msh", mode)
	else
		for i,v in flic do
			DrwMeshChangeRenderMode(v ..".msh", mode)
		end
	end
end


-------------------------------------------------------------------- attach to bones
function AttachToBones(tParams)
	if tParams.bones == nil then return end
	if tParams.object == nil then return end

	local lObjects = {}
	tParams.bones.n = nil

	for iIndex, Entry in tParams.bones do
		lObjects[iIndex] = NewObject{subobject=tParams.object, movie=tParams.movie, bone=Entry, restriction=tParams.restriction}
	end

	return lObjects
end
	
-------------------------------------------------------------------- position the same effect at multiple place
function Position(tParams)
	if tParams.positions == nil then return end
	if tParams.object == nil then return end

	local lObjects = {}

	for iIndex, Entry in tParams.positions do
		NewMovie()
		Translation{min=Entry}
		lObjects[iIndex] = NewObject{subobject=tParams.object, movie=pMovie}
	end

	return lObjects
end
	


-------------------------------------------------------------------- get bones as list
function GetBones(BoneGroup, ptBones)
	if ptBones == nil then
		ptBones = {}
	end

	if (type(BoneGroup) == "table") then
		for iIndex, Entry in BoneGroup do
			GetBones(Entry, ptBones)
		end
	end

	if (type(BoneGroup) == "number") then
		tinsert(ptBones, BoneGroup)
	end

	if (BoneGroup == "LeftArm") then
		tinsert(ptBones, kDrwBoneLeftPalm)
		tinsert(ptBones, kDrwBoneLeftEllbow)
		tinsert(ptBones, kDrwBoneLeftShoulder)
	end
	if (BoneGroup == "RightArm") then
		tinsert(ptBones, kDrwBoneRightPalm)
		tinsert(ptBones, kDrwBoneRightEllbow)
		tinsert(ptBones, kDrwBoneRightShoulder)
	end
	if (BoneGroup == "Arms") then
		GetBones({"LeftArm","RightArm"}, ptBones)
	end

	if (BoneGroup == "LeftLeg") then
		tinsert(ptBones, kDrwBoneLeftThigh)
		tinsert(ptBones, kDrwBoneLeftKnee)
		tinsert(ptBones, kDrwBoneLeftFoot)
	end
	if (BoneGroup == "RightLeg") then
		tinsert(ptBones, kDrwBoneRightThigh)
		tinsert(ptBones, kDrwBoneRightKnee)
		tinsert(ptBones, kDrwBoneRightFoot)
	end
	if (BoneGroup == "Legs") then
		GetBones({"LeftLeg","RightLeg"}, ptBones)
	end

	if (BoneGroup == "Torso") then
		tinsert(ptBones, kDrwBoneMain)
		tinsert(ptBones, kDrwBoneChest)
		tinsert(ptBones, kDrwBoneRightShoulder)
		tinsert(ptBones, kDrwBoneLeftShoulder)
	end

	if (BoneGroup == "All") then
		GetBones({"Legs","Arms", "Torso"}, ptBones)
	end

	return ptBones
end


function TestEffect(params)
	if type(params) ~= "table" then
		params = {effect=params}
	end

	local iFigure		=	params.figure
	local iPower		=	params.power or 100
	local iTime			=	params.time	or 30
	local iAnim			=	params.anim or -1
	local vEffect		=   params.effect
	local iSource		=	params.source or 0
	local iObject		=	params.object

	local iEffect = EffectGetId(vEffect)
	if iEffect < 1 or iEffect > giEffects then		
		print("Effectnumber between 1 and ", giEffects)
		return 
	end

	DrwSetTestJob(-1)
	DrwSetEffectPower(iPower)

	if (iFigure) then
		Effect:Show(iEffect, 1, iFigure, 0, 0, iTime, iSource)
		return
	end

	if (iObject) then
		Effect:Show(iEffect, 3, iObject, 0, 0, iTime, iSource)
		return
	end

	local iElements = GameControl:GetSelection():GetSize()

	if (iElements == 0) then
		local x,y,ret = 0,0,0
		ret, x, y = GameControl:GetMousePosGrid(x,y)		
		Effect:Show(iEffect, 4, 0, x, y, iTime, iSource)
	else
		local category = 0
		local id = 0
		for i = 0, iElements-1,1 do
			category, id = GameControl:GetSelection():GetItem(i, category, id)
			Effect:Show(iEffect, category, id, 0, 0, iTime, iSource)
		end
	end

	DrwSetTestJob(iAnim)
end

function TestEffects(effect)
	for i = 1, 100 do
		TestEffect{effect=effect, figure=2, source=1, time=100}
	end
end


gNoMove		= NewMovie()
gNoEffect	= NewObject{}
EffectSave("NoEffect")
