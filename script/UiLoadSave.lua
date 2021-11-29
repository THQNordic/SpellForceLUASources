-- load / save

-------------------------------------------------------------------------------------------------------------
-- functions
-------------------------------------------------------------------------------------------------------------
function OnModalEvent_LoadSave(sender)
	local iModalResult = tolua.cast(sender, "CMnuContainer"):ModalResult()
	output(iModalResult)
end --OnModalEvent()


function LoadFileList()
	tolua.cast(Screen:ControlByName("<ctrl>lbCaption"), "CMnuLabel"):SetCaption("Load file") 
	local lb = tolua.cast(Screen:ControlByName("<ctrl>lbFiles"), "CMnuListbox")
	if lb ~= nil then -- tell listbox what to load
		lb:Items():LoadFileList(kMnu_DirectorySave, kMnu_MovieFileSfx)
	end
end -- LoadFileList()


function DoModal()
	local owner = tolua.cast(Screen:ControlByName("<cont>LL_Load"), "CMnuContainer")
	if owner ~= nil then
		owner:SetModalEvent(Application:MakeCallbackNotify("OnModalEvent_LoadSave"))
		owner:ShowModal() -- and auto delete after done
	end
end --DoModal()


function lbFiles_OnClick(sender)
end
	
function btOpen_OnClick(sender)
end

function btCancel_OnClick(sender)
end

-------------------------------------------------------------------------------------------------------------
-- form
-------------------------------------------------------------------------------------------------------------
MainForm = 
{
	0, 0, 300, 250; 
	Name = "<cont>LL_Load",
	Background = "ui_oth_tooltip.msh",
	AddTo = "Screen",
	PositionFlag = kMnu_poCenter,
	Visible = false,
	Controls = 
	{
		{   5,  20, 210, 245; 	Type = "Listbox",	Name = "<ctrl>lbFiles",		Background = "edit.msh",	SelectBackground = "ui_oth_tooltip.msh",		OnClick = "lbFiles_OnClick"},

		{   5,   0, 300,   9;   Type = "Label",		Name = "<ctrl>lbCaption",	Mesh = "ui_oth_tooltip.msh"},
		{ 220,  20,  75,  25; 	Type = "GfxButton",	Name = "<ctrl>btOpen",		Caption = "Open",									MeshGfx = "ui_btn_dummy_color.msh",	OnClick = "btOpen_OnClick", ModalResult = kMnu_mrOk},
		{ 220,  50,  75,  25; 	Type = "GfxButton",	Name = "<ctrl>btCancel",	Caption = "Cancel",	ModalResult = kMnu_mrCancel,	MeshGfx = "ui_btn_dummy_color.msh",	OnClick = "btCancel_OnClick"}
	}
}

-------------------------------------------------------------------------------------------------------------
-- MAIN
-------------------------------------------------------------------------------------------------------------
UiCreateForm (MainForm)
LoadFileList()
DoModal()

