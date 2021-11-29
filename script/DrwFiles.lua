--local Anims, Meshes, Bones, Used


BonesDir = dir_readdirectory("animation\\*.bor")
BonesFile = strsplit("\n", gsub(readfile("animation\\bones.txt"), "\r", ""))
Bones = list_concat(BonesFile, BonesDir)
Bones = list_converttoset(Bones)

AnimsDir = dir_readdirectory("animation\\*.*")
AnimsFile = strsplit("\n", gsub(readfile("animation\\anims.txt"), "\r", ""))
Anims = list_concat(AnimsFile, AnimsDir)
Anims = list_converttoset(Anims)

MeshesDir = dir_readdirectory("mesh\\*.*")
MeshesFile = strsplit("\n", gsub(readfile("mesh\\meshes.txt"), "\r", ""))
Meshes = list_concat(MeshesFile, MeshesDir)
Meshes = list_converttoset(Meshes)


Used = {}

-- strip bones from anims
local nAnims = getn(Anims)
for i = nAnims, 1, -1 do
	local v = Anims[i]
	if (strfind(v, ".bor")) then
		tremove(Anims, i)
		--print(v)
	end
end


-- dump(Bones)
-- dump(Anims)
-- dump(Meshes)

function Find(sName, tDirectory)
	for i, v in tDirectory do
		if (sName == strsub(v,1,strlen(v)-4)) then
			return i
        end
	end
	return nil
end

function FindAnim(sName)
	return Find(sName, %Anims)
end

function FindBones(sName)
	return Find(sName, %Bones)
end

function FindMesh(sName)
	return Find(sName, %Meshes)
end