-- this file initializes the lua side of the user interface system
-- it first installs some useful functions and then calls another file in which the first
-- user interface is declared

-------------------------------------------------------------------------------------------------------------
-- constants
--------------------------------------------------------------------------------------------------------------

false, False			= 0, 0 -- das mit dem False ist so eine Sache: in Lua ist 0 "true", nur nil ist "false"
true, True				= 1, 1


--------------------------------------------------------------------------------------------------------------
-- globals
--------------------------------------------------------------------------------------------------------------

bAllVisible			= true
iReloadCount		= 0

iSelBuildingRace  = kGdRaceHuman


--------------------------------------------------------------------------------------------------------------
-- MnuContainer
--------------------------------------------------------------------------------------------------------------

-- this function takes a table and converts it into a form (container) with controls on it
-- there are x possible layers of forms to create (Recursive)

function UiCreateForm (FormDefinition)
	
	-- CREATE FORM
	local CurForm = CMnuContainer:new ()

	-- INIT
	local Background = FormDefinition.Background
	local Layer = FormDefinition.Layer

	if	FormDefinition [1] == "0" and FormDefinition [2] == "0" and FormDefinition [3] == "0" and FormDefinition [4] == "0" then
		CurForm:Init ()
	else
		CurForm:Init (FormDefinition [1], FormDefinition [2], FormDefinition [3], FormDefinition [4], Background, Layer)
	end

	local Name = FormDefinition.Name
	assert(FormDefinition.Name ~= nil, "!!ContainerName missing!!")
	CurForm:SetName(Name)


	-- ALIGNMENT
	if FormDefinition.Alignment ~= nil then
		CurForm:SetAlignment(FormDefinition.Alignment)
	end

	-- EVENTIGNORE
	if FormDefinition.EventIgnore ~= nil then
		CurForm:SetEventIgnore(FormDefinition.EventIgnore)
	end

	-- CANGETFOCUS
	if FormDefinition.CanGetFocus ~= nil then
	   CurForm:SetCanGetFocus(FormDefinition.CanGetFocus)
	end

	-- HANDLE_IF_TRANSPARENT
	if FormDefinition.HandleIfTransparent ~= nil then
		CurForm:SetHandleIfTransparent(FormDefinition.HandleIfTransparent)
	end

	-- HIDE
	if FormDefinition.Hide ~= nil then
		if FormDefinition.Hide == "true" then
			CurForm:Hide()
		else
			CurForm:Show()
		end
	end

	-- HINT
	if FormDefinition.Hint ~= nil then
		CurForm:SetHint(FormDefinition.Hint)
	end

	-- INTERVAL
	if FormDefinition.Interval ~= nil then
		CurForm:SetInterval(FormDefinition.Interval)
	end

	-- POSITIONFLAG
	if FormDefinition.PositionFlag ~= nil then
		CurForm:SetPositionFlag(FormDefinition.PositionFlag)
	end

	-- VISIBLE
	if FormDefinition.Visible ~= nil then
	   CurForm:SetVisible(FormDefinition.Visible)
	end


	-- *** CALLBACKs ***
	if FormDefinition.OnDoDataUpdate ~= nil then
		CurForm.OnDoDataUpdate = Application:MakeCallbackNotify (FormDefinition.OnDoDataUpdate)
	end

	-- TRANSPARENT RANGES
	local trans
	trans = FormDefinition.Transparent
	if trans ~= nil then
		for i = 1, getn (trans) do
			local transp = trans[i]
			if getn(transp) == 4 then
				CurForm:AddTransparentRange(transp[1], transp[2], transp[3], transp[4])
			end
		end
	end

	-- now traverse the table to process the children
	local Controls
	local AddList = { }
	Controls = FormDefinition.Controls

	if Controls ~= nil then
		for i = 1, getn (Controls) do
			-- get the next control
			AddList [i] = UiCreateControl(Controls [i])
		end 
	end

	local ControlsBack
	local AddListBack = { }
	ControlsBack = FormDefinition.ControlsBack

	if ControlsBack ~= nil then
		for i = 1, getn (ControlsBack) do
			AddListBack [i] = UiCreateControl(ControlsBack [i])
		end 
	end

	-- get the pointer for the container to be added to
	-- add on top of container mesh
	if FormDefinition.AddTo ~= nil then
		if FormDefinition.AddTo == "Screen" then
			Screen:AddControl (CurForm)
		else
			local PContainer = tolua.cast(Screen:ControlByName(FormDefinition.AddTo), "CMnuContainer")
			assert (PContainer, "!! PContainer null !!")
			PContainer:AddControl (CurForm) 
		end
	else
		assert (0, "!! Not a existing Container/Screen to add to !!")
	end

	-- add behind container mesh
	if FormDefinition.AddBehind ~= nil then
		if FormDefinition.AddBehind == "Screen" then
			Screen:AddControl (CurForm)
		else
			local PContainer = tolua.cast(Screen:ControlByName(FormDefinition.AddBehind), "CMnuContainer")
			assert (PContainer, "!! PContainer null !!")
			PContainer:AddControl (CurForm, true, false) 
		end
	else
		assert (0, "!! Not a existing Container/Screen to add to !!")
	end

	-- ADD CONTROLS TO THE FORM
	for i = 1, getn (AddList) do
		CurForm:AddControl (AddList [i])
 	end

	-- ADD CONTROLS BEHIND THE FORM
	for i = 1, getn (AddListBack) do
		CurForm:AddControl (AddListBack [i], true, false)
 	end

	return CurForm
end

--------------------------------------------------------------------------------------------------------------
-- helper function that creates a control according to its type
--------------------------------------------------------------------------------------------------------------

function UiCreateControl (Control)

	-- check for type tag
	local Type = Control.Type
	if Type ~= nil then
		if Type == "Button" then
			return UiCreateButton(Control)
		elseif Type == "GfxButton" then
			return UiCreateGfxButton(Control)
		elseif Type == "UiButton" then
			return UiCreateUiButton(Control)
		elseif Type == "Edit" then
			return UiCreateEdit(Control)
		elseif Type == "Label" then
			return UiCreateLabel(Control)
		elseif Type == "ExtButton" then
			return UiCreateExtButton(Control)
		elseif Type == "CheckBox" then
			return UiCreateCheckBox(Control)
		elseif Type == "Listbox" then
			return UiCreateListbox(Control)
		elseif Type == "Minimap" then
			return UiCreateMinimap(Control)
		elseif Type == "DetailView" then
			return UiCreateDetailView(Control)
		else
			assert (1 == 0, "!!CTRL Type not existing!!")
		end
	else
		-- no type given
		assert (1 == 0, "!!CTRL Type is missing!!")
	end
end 


--------------------------------------------------------------------------------------------------------------
-- CMnuButton
--------------------------------------------------------------------------------------------------------------
-- this function creates a button and returns it

function UiCreateButton (ButtonDefinition)

	-- create the Button
	local Button = CUiButton:new ()

	-- get the params of the button
	local Name = ButtonDefinition.Name
	assert (ButtonDefinition.Name ~= nil, "!!ButtonName is missing!!")

	--local Caption = ButtonDefinition.Caption
	local MeshGfx = ButtonDefinition.MeshGfx
	assert (ButtonDefinition.MeshGfx ~= nil, "!! standard mesh missing !!")

	local MeshBorder = ButtonDefinition.MeshBorder
	local MeshDefault = MeshDefault
	local MeshPressed = ButtonDefinition.MeshPressed
	local MeshDisabled = ButtonDefinition.MeshDisabled
	local MeshFocused = ButtonDefinition.MeshFocused
	
	-- THIS IS TODO: ARRAY OF MESHES, ADD SUBRECTS
	Button:SetName (Name)
	Button:Init (ButtonDefinition [1], ButtonDefinition [2], ButtonDefinition [3], ButtonDefinition [4], MeshBorder, MeshDefault, MeshPressed, MeshDisabled, MeshFocused)
	Button:AddGfx(MeshGfx, 0, 0, 0, 0)

	-- CAPTION
	if ButtonDefinition.Caption ~= nil then
	   Button:SetCaption(ButtonDefinition.Caption)
	end

	-- ENABLED
	if ButtonDefinition.Enabled ~= nil then
		Button:SetEnabled(ButtonDefinition.Enabled)
	end

	-- HINT
	if ButtonDefinition.Hint ~= nil then
		Button:SetHint(ButtonDefinition.Hint)
	end

	-- MODAL RESULT
	if ButtonDefinition.ModalResult ~= nil then
		Button:SetModalResult(ButtonDefinition.ModalResult)
	end

	-- TAG
	if ButtonDefinition.Tag ~= nil then
		Button:SetTag(ButtonDefinition.Tag)
	end
-------------------------------	
	-- CALLBACKS
	if ButtonDefinition.OnClick ~= nil then
		Button.OnClick = Application:MakeCallbackConsole (ButtonDefinition.OnClick)
	end

	if ButtonDefinition.OnMouseEnter ~= nil then
		Button.OnMouseEnter = Application:MakeCallbackConsole (ButtonDefinition.OnMouseEnter)
	end
		

	return Button
end


--------------------------------------------------------------------------------------------------------------
-- CMnuGfxButton
--------------------------------------------------------------------------------------------------------------
-- this function creates a button and returns it

function UiCreateGfxButton (ButtonDefinition)

	-- create the Button
	local Button = CMnuGfxButton:new ()

	-- get the params of the button
	local Name = ButtonDefinition.Name
	assert (ButtonDefinition.Name ~= nil, "!!ButtonName is missing!!")

	--local Caption = ButtonDefinition.Caption
	local MeshGfx = ButtonDefinition.MeshGfx
	--assert (ButtonDefinition.MeshGfx ~= nil, "!! standard mesh missing !!")

	local MeshBgr		= ButtonDefinition.MeshBgr
	local MeshBorder	= ButtonDefinition.MeshBorder
	local MeshDefault	= ButtonDefinition.MeshDefault
	local MeshPressed	= ButtonDefinition.MeshPressed
	local MeshDisabled	= ButtonDefinition.MeshDisabled
	local MeshFocused	= ButtonDefinition.MeshFocused
	
	Button:SetName (Name)
	Button:Init (ButtonDefinition [1], ButtonDefinition [2], ButtonDefinition [3], ButtonDefinition [4], MeshGfx, MeshBgr, MeshBorder, MeshDefault, MeshPressed, MeshDisabled, MeshFocused)

	-- GFX
	if ButtonDefinition.MeshGfx ~= nil then
		Button:SetGfx(ButtonDefinition.MeshGfx)
	end

	-- CAPTION
	if ButtonDefinition.Caption ~= nil then
		Button:SetCaption(ButtonDefinition.Caption)
	end

	-- ENABLED
	if ButtonDefinition.Enabled ~= nil then
		Button:SetEnabled(0)
	end

	-- HINT
	if ButtonDefinition.Hint ~= nil then
		Button:SetHint(ButtonDefinition.Hint)
	end

	-- MODAL RESULT
	if ButtonDefinition.ModalResult ~= nil then
		Button:SetModalResult(ButtonDefinition.ModalResult)
	end

	-- TAG
	if ButtonDefinition.Tag ~= nil then
		Button:SetTag(ButtonDefinition.Tag)
	end
-------------------------------	
	-- CALLBACKS
	if ButtonDefinition.OnClick ~= nil then
		Button.OnClick = Application:MakeCallbackConsole (ButtonDefinition.OnClick)
	end

	if ButtonDefinition.OnMouseEnter ~= nil then
		Button.OnMouseEnter = Application:MakeCallbackConsole (ButtonDefinition.OnMouseEnter)
	end
		

	return Button
end


--------------------------------------------------------------------------------------------------------------
-- CUiButton
--------------------------------------------------------------------------------------------------------------
-- this function creates an UiButton and returns it

function UiCreateUiButton (ButtonDefinition)

	-- create the Button
	local Button = CUiButton:new ()

	-- get the params of the button
	local Name = ButtonDefinition.Name
	assert (ButtonDefinition.Name ~= nil, "!!ButtonName is missing!!")

	local MeshBorder = ButtonDefinition.MeshBorder
	local MeshDefault = MeshDefault
	local MeshPressed = ButtonDefinition.MeshPressed
	local MeshDisabled = ButtonDefinition.MeshDisabled
	local MeshFocused = ButtonDefinition.MeshFocused
	
	Button:SetName (Name)
	Button:Init (ButtonDefinition [1], ButtonDefinition [2], ButtonDefinition [3], ButtonDefinition [4], MeshBorder, MeshDefault, MeshPressed, MeshDisabled, MeshFocused)


	-- CAPTION
	if ButtonDefinition.Caption ~= nil then
	   Button:SetCaption(ButtonDefinition.Caption)
	end

	-- ENABLED
	if ButtonDefinition.Enabled ~= nil then
		Button:SetEnabled(0)
	end

	-- HINT
	if ButtonDefinition.Hint ~= nil then
		Button:SetHint(ButtonDefinition.Hint)
	end

	-- MODAL RESULT
	if ButtonDefinition.ModalResult ~= nil then
		Button:SetModalResult(ButtonDefinition.ModalResult)
	end

	-- TAG
	if ButtonDefinition.Tag ~= nil then
		Button:SetTag(ButtonDefinition.Tag)
	end
-------------------------------
-- button optical modifying
	
	-- MESH SCALE
	if ButtonDefinition.MeshScale ~= nil then
		Button:SetMeshScale(ButtonDefinition.MeshScale)
	end

	-- MESH TRANSLATION
	if ButtonDefinition.MeshTranslation ~= nil then
		Button:SetMeshTranslation(ButtonDefinition.MeshTranslation)
	end

	-- SCALE LIGHT: MOUSEOVER
	if ButtonDefinition.ScaleLightMouseOver ~= nil then
		Button:SetScaleLightMouseOver(ButtonDefinition.ScaleLightMouseOver)
	end

	-- SCALE LIGHT: PRESSED
	if ButtonDefinition.ScaleLightPressed ~= nil then
		Button:SetScaleLightPressed(ButtonDefinition.ScaleLightPressed)
	end
-------------------------------	
	-- CALLBACKS
	if ButtonDefinition.OnClick ~= nil then
		Button.OnClick = Application:MakeCallbackConsole (ButtonDefinition.OnClick)
	end

	if ButtonDefinition.OnMouseEnter ~= nil then
		Button.OnMouseEnter = Application:MakeCallbackConsole (ButtonDefinition.OnMouseEnter)
	end
		

	return Button
end -- CUiButton


--------------------------------------------------------------------------------------------------------------
-- CMnuExtButton
--------------------------------------------------------------------------------------------------------------
-- this function creates a ExtButton and returns it

function UiCreateExtButton (ExtButtonDefinition)

	-- create the ExtButton
	local ExtButton = CMnuExtButton:new ()

	-- get the params of the ExtButton
	local Name = ExtButtonDefinition.Name
	assert (ExtButtonDefinition.Name ~= nil, "!!ExtButtonName is missing!!")
	local Caption = ExtButtonDefinition.Caption
	local MeshStandard	= ExtButtonDefinition.Mesh1
	local MeshFocused	= ExtButtonDefinition.Mesh2
	local MeshPressed	= ExtButtonDefinition.Mesh3
	local MeshMouseOver = ExtButtonDefinition.Mesh4
	local MeshDisabled	= ExtButtonDefinition.Mesh5
	local MeshDown		= ExtButtonDefinition.Mesh6
	local MeshDownOver	= ExtButtonDefinition.Mesh7

	ExtButton:SetName (Name)
	ExtButton:Init (ExtButtonDefinition [1], ExtButtonDefinition [2], ExtButtonDefinition [3], ExtButtonDefinition [4], Caption, MeshStandard, MeshFocused, MeshPressed, MeshMouseOver, MeshDisabled, MeshDown, MeshDownOver)

	
	-- SET 
	if ExtButtonDefinition.Enabled ~= nil then
		ExtButton:SetEnabled(0)
	end
	
	if ExtButtonDefinition.SetDown ~= nil then
		ExtButton:SetDown (1)
	end

	if ExtButtonDefinition.Hint ~= nil then
		ExtButton:SetHint(ExtButtonDefinition.Hint)
	end

	-- CALLBACKS
	if ExtButtonDefinition.OnClick ~= nil then
		ExtButton.OnClick = Application:MakeCallbackConsole (ExtButtonDefinition.OnCLick)
	end

	return ExtButton
end


--------------------------------------------------------------------------------------------------------------
-- CMnuLabel
--------------------------------------------------------------------------------------------------------------
--this function creates a Label and returns it

function UiCreateLabel (LabelDefinition)

	--create the Label
	local Label = CMnuLabel:new ()

	--get the params of the Label
	local Name = LabelDefinition.Name
	assert (LabelDefinition.Name ~= nil, "!!LabelName is missing")
	local Mesh = LabelDefinition.Mesh

	-- MUST be first, otherwise overwrites alignments ! (I had thought ???) %$ todo: what about alignment
	Label:SetName (Name)
	--Label:SetAutosize(1)
	Label:Init (LabelDefinition [1], LabelDefinition [2], LabelDefinition [3], LabelDefinition [4], Mesh)

	--------------- SET -----------------------------------------------------------------------

	-- ALIGNMENT
	if LabelDefinition.Alignment ~= nil then
		local iAlignment = LabelDefinition.Alignment
		Label:SetAlignment(iAlignment)
	end

	-- AUTOSIZE
	if LabelDefinition.AutoSize ~= nil then
		Label:SetAutoSize(LabelDefinition.AutoSize)
	end

	--HINT
	if LabelDefinition.Hint ~= nil then
		Label:SetHint(LabelDefinition.Hint)
	end

	-- SCALE POS
	if LabelDefinition.ScalePos ~= nil then
	   Label:SetScalePos(LabelDefinition.ScalePos)
	end

	-- SCALE DIM
	if LabelDefinition.ScaleDim ~= nil then
	   Label:SetScaleDim(LabelDefinition.ScaleDim)
	end

	-- Pit: SET FONT
	if LabelDefinition.Font ~= nil then
	   Label:SetFont(MnuGetDefaultFont (LabelDefinition.Font))
	end

--	(Pit) geht leider nicht so einfach:

--	if LabelDefinition.Caption ~= nil then
--	   print("setting caption ", LabelDefinition.Caption)
--	   Label:SetCaption(LabelDefinition.Caption)
--	end

	return Label
end


--------------------------------------------------------------------------------------------------------------
-- CMnuCheckbox
--------------------------------------------------------------------------------------------------------------
--this function creates a checkbox and returns it

function UiCreateCheckBox (CheckBoxDefinition)

	--create the checkbox
	local CheckBox = CMnuCheckBox:new ()

	-- get the params of the checkbox
	local Name = CheckBoxDefintion.Name
	assert (CheckBoxDefinition.Name ~= nil, "!!CheckBoxName is missing!!")
	local Caption = CheckBoxDefinition.Caption
	local MeshUnChecked = CheckBoxDefinition.MeshUnChecked
	local MeshChecked = CheckBoxDefinition.MeshChecked
	local MeshBackground = CheckBoxDefinition.MeshBackground

	--SET
	if CheckBoxDefinition.Hint ~= nil then
		CheckBox:SetHint(CheckBoxDefinition.Hint)
	end

	CheckBox:SetName (Name)
	CheckBox:Init (CheckBoxDefinition [1], CheckBoxDefinition [2], CheckBoxDefinition [3], CheckBoxDefinition [4], Caption, MeshUnChecked, MeshChecked, MeshBackground)

	return CheckBox
end


--------------------------------------------------------------------------------------------------------------
-- CMnuEdit
--------------------------------------------------------------------------------------------------------------
--this function creates an Edit - Field and returns it

function UiCreateEdit (EditDefinition)

	--create the Edit - Field 
	local Edit = CMnuEdit:new ()

	--get the params of the Edit _ Field
	local Name = EditDefinition.Name
	assert (EditDefinition.Name ~= nil, "!!EditName is missing!!")
	--local Caption = EditDefinition.Caption
	local Mesh = EditDefinition.Mesh

	--SET
	if EditDefinition.Hint ~= nil then
		Edit:SetHint(EditDefinition.Hint)
	end

	Edit:SetName (Name)
	--Edit:Init (EditDefinition [1], EditDefinition [2], EditDefinition [3], EditDefinition [4], Caption, Mesh)
	Edit:Init (EditDefinition [1], EditDefinition [2], EditDefinition [3], EditDefinition [4], Caption, Mesh)
	return Edit
end


--------------------------------------------------------------------------------------------------------------
-- CMnuListbox
--------------------------------------------------------------------------------------------------------------
--this function creates a Listbox and returns it

function UiCreateListbox (ListboxDefinition)

	--create the Listbox
	local Listbox = CMnuListbox:new ()

	--get the params of the Listbox _ Field
	local Name = ListboxDefinition.Name
	assert (ListboxDefinition.Name ~= nil, "!!ListboxName is missing!!")
	local Background = ListboxDefinition.Background
	local SelectBackground = ListboxDefinition.SelectBackground

	--SET
	if ListboxDefinition.Hint ~= nil then
		Listbox:SetHint(ListboxDefinition.Hint)
	end

	Listbox:SetName (Name)
	Listbox:Init (ListboxDefinition [1], ListboxDefinition [2], ListboxDefinition [3], ListboxDefinition [4], Background, SelectBackground)

	-- CALLBACKS
	if ListboxDefinition.OnClick ~= nil then
		Listbox.OnClick = Application:MakeCallbackConsole (ListboxDefinition.OnCLick)
	end

	return Listbox
end


--------------------------------------------------------------------------------------------------------------
-- CUiMinimap
--------------------------------------------------------------------------------------------------------------
--this function creates a Minimap - Field and returns it

function UiCreateMinimap (MinimapDefinition)

	--create the Minimap - Field 
	local Minimap = CUiMinimap:new ()

	--get the params of the Minimap - Field
	local Name = MinimapDefinition.Name
	assert (MinimapDefinition.Name ~= nil, "!!MinimapName is missing!!")

	Minimap:SetName (Name)
	Minimap:Init (MinimapDefinition [1], MinimapDefinition [2], MinimapDefinition [3], MinimapDefinition [4], Application:GetGameControl():GetGameView())

	-- alignment
	if MinimapDefinition.Alignment ~= nil then
		CurForm:SetAlignment(MinimapDefinition.Alignment)
	end

	return Minimap
end


--------------------------------------------------------------------------------------------------------------
-- CUiDetailView
--------------------------------------------------------------------------------------------------------------
--this function creates a DetailView - Field and returns it
function UiCreateDetailView(DetailViewDefinition)

	--create the DetailView - Field 
	local DetailView = CUiDetailView:new()

	--get the params of the DetailView - Field
	local Name = DetailViewDefinition.Name
	assert (DetailViewDefinition.Name ~= nil, "!!DetailViewName is missing!!")

	DetailView:SetName (Name)
	DetailView:Init (DetailViewDefinition [1], DetailViewDefinition [2], DetailViewDefinition [3], DetailViewDefinition [4], Application:GetGameControl():GetGameView())

	-- alignment
	if DetailViewDefinition.Alignment ~= nil then
		CurForm:SetAlignment(DetailViewDefinition.Alignment)
	end

	return DetailView
end


-- dis function creates (again) the main menu ... (yet not called! Klaus)
function UiCreateMainMenu(Name)

	-- CREATE FORM
	local CurForm = CUiMain:new(Application:GetAppSession())

	CurForm:SetName(Name)
	CurForm:Init(GdMain)

	Screen:AddControl(CurForm)
end


-- this function adds / overwrites a button scheme
function UiAddBtnScheme(aDef)
	UiBtnSchemeList:Add(aDef[1], aDef[2], aDef[3])
end


--------------------------------------------------------------------------------------------------------------
-- Other
--------------------------------------------------------------------------------------------------------------

function UiCreateGlobalShortcut(aDefinition)
	--print(aDefinition[1],aDefinition[2],aDefinition[3])
	Screen:AddGlobalShortcut(aDefinition[1], aDefinition[2], Application:MakeCallbackShortcutNotify(aDefinition[3]), aDefinition[4], aDefinition[5])
end

function UiCreateGlobalShortcutShort(aKey, aCallback, iRange, sComment)
	Screen:AddGlobalShortcut(0, aKey, Application:MakeCallbackShortcutNotify(aCallback), iRange, sComment)
end

function UiDeleteGlobalShortcut(aDefinition)
	Screen:DelGlobalShortcut(aDefinition[1], aDefinition[2], aDefinition[4])
end


--------------------------------------------------------------------------------------------------------------
-- Copy protection!!
--------------------------------------------------------------------------------------------------------------
if findfile("spellforce.dat") then
	Application:Nice()
end