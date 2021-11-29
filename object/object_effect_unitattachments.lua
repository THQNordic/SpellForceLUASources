iUnitEffect = 3000
DrwUnitAttachmentsClear()


function AttachUnitEffect(iUnit, oEffect)
	RegisterEffect(kGdEffectTest, iUnitEffect, oEffect)
	DrwUnitAttachmentsAdd(iUnit, iUnitEffect)

	iUnitEffect = iUnitEffect +1
end


function AttachObject(iUnit, sMesh, sBone, iScale, vOffset)
	if FindMesh(sMesh) then
		NewMovie()
		if iScale~=nil then Scale{min=iScale} end
		if vOffset~=nil then Translation{min=vOffset} end
		Color{min=0.99}
		oEffect = NewObject{mesh=sMesh, movie=pMovie, bone=sBone, restriction=kDrwCsBone}
		AttachUnitEffect(iUnit, oEffect)
	else
		print("not found: attachment mesh " .. sMesh .. " for unit " .. iUnit)
	end
end

------------------------------------------------------------------------------------------------
--  AttachObject( UnitId, Mesh, Bone <define oder string>, [optional: Skalierung, Verschiebung] )
------------------------------------------------------------------------------------------------

--AttachUnitEffect(1609, EffectGet("Wing"))

AttachObject(1536, "equipment_attachment_skerg_armL_small_leather", "Bip L Forearm")
AttachObject(1536, "equipment_attachment_skerg_armR_small_leather", "Bip R Forearm")
AttachObject(1536, "equipment_attachment_skerg_helmet_leather", "Bip Head")
AttachObject(1536, "equipment_attachment_skerg_kneeL_leather", "Bip L HorseLink")
AttachObject(1536, "equipment_attachment_skerg_kneeR_leather", "Bip R HorseLink")

AttachObject(1537, "equipment_attachment_skerg_armL_leather", "Bip L Forearm")
AttachObject(1537, "equipment_attachment_skerg_armR_leather", "Bip R Forearm")
AttachObject(1537, "equipment_attachment_skerg_helmet_leather04", "Bip Head")
AttachObject(1537, "equipment_attachment_skerg_kneeL_leather", "Bip L HorseLink")
AttachObject(1537, "equipment_attachment_skerg_kneeR_leather", "Bip R HorseLink")

AttachObject(1538, "equipment_attachment_skerg_upperarmL_leather", "Bip L UpperArm")
AttachObject(1538, "equipment_attachment_skerg_helmet_leather02", "Bip Head")
AttachObject(1538, "equipment_attachment_skerg_legL_leather", "Bip L HorseLink")
AttachObject(1538, "equipment_attachment_skerg_legR_leather", "Bip R HorseLink")

AttachObject(1539, "equipment_attachment_skerg_armL_metal", "Bip L Forearm")
AttachObject(1539, "equipment_attachment_skerg_armR_metal", "Bip R Forearm")
AttachObject(1539, "equipment_attachment_skerg_helmet_leather_blue01", "Bip Head")
AttachObject(1539, "equipment_attachment_skerg_legL_metal", "Bip L HorseLink")
AttachObject(1539, "equipment_attachment_skerg_legR_metal", "Bip R HorseLink")

AttachObject(1540, "equipment_attachment_skerg_armL_metal", "Bip L Forearm")
AttachObject(1540, "equipment_attachment_skerg_armR_metal", "Bip R Forearm")
AttachObject(1540, "equipment_attachment_skerg_helmet_leather_blue02", "Bip Head")
AttachObject(1540, "equipment_attachment_skerg_legL_metal", "Bip L HorseLink")
AttachObject(1540, "equipment_attachment_skerg_legR_metal", "Bip R HorseLink")

AttachObject(1724, "equipment_attachment_tar_skerg_armL_healer", "Bip L Forearm")
AttachObject(1724, "equipment_attachment_tar_skerg_armR_healer", "Bip R Forearm")
AttachObject(1724, "equipment_attachment_tar_skerg_helmet_healer", "Bip Head")
AttachObject(1724, "equipment_attachment_tar_skerg_legL_healer", "Bip L HorseLink")
AttachObject(1724, "equipment_attachment_tar_skerg_legR_healer", "Bip R HorseLink")

AttachObject(1542, "equipment_attachment_tar_skerg_armL_chief", "Bip L Forearm")
AttachObject(1542, "equipment_attachment_tar_skerg_armR_chief", "Bip R Forearm")
AttachObject(1542, "equipment_attachment_tar_skerg_helmet_chief", "Bip Head")
AttachObject(1542, "equipment_attachment_tar_skerg_legL_chief", "Bip L HorseLink")
AttachObject(1542, "equipment_attachment_tar_skerg_legR_chief", "Bip R HorseLink")

AttachObject(1559, "equipment_attachment_tar_skerg_armL_healer", "Bip L Forearm")
AttachObject(1559, "equipment_attachment_tar_skerg_armR_healer", "Bip R Forearm")
AttachObject(1559, "equipment_attachment_tar_skerg_legL_healer", "Bip L HorseLink")
AttachObject(1559, "equipment_attachment_tar_skerg_legR_healer", "Bip R HorseLink")


AttachUnitEffect(2707, EffectGet("RohenUndead"))
AttachUnitEffect(2663, EffectGet("RohenUndeadRiding"))
AttachUnitEffect(2285, EffectGet("Titan"))
