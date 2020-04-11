AddCSLuaFile()
if !CLIENT then return end 
	local red = Color(255, 84, 84)
	local blue = Color(84, 118, 255)

	local hide = {
		["CHudHealth"] = true,
		["CHudBattery"] = true,
		["CHudAmmo"] = true,
		["CHudSecondaryAmmo"] = true,
		["DarkRP_LocalPlayerHUD"] = true,
		["DarkRP_HUD"] = true,
		["DarkRP_EntityDisplay"] = true
	}

	hook.Add( "HUDShouldDraw", "gh_shoulddraw", function( name )
		if ( hide[ name ] ) then return false end
	end )

	local grad = Material("vgui/gradient-l")
	local color = Color(58, 64, 74)
	local secondarycolor = Color(30, 35, 43)


hook.Add("HUDPaint", "gh_main", function()
	if !LocalPlayer():Alive() then return end

	
	surface.SetDrawColor(color)
	surface.DrawRect(0, ScrH() - 100, 300, 100)
	surface.SetDrawColor(secondarycolor)
	surface.DrawRect(0, ScrH() - 140, 300, 40)
	surface.SetDrawColor(team.GetColor(LocalPlayer():Team()))
	surface.DrawRect(0, ScrH() - 101, 300, 2)
	surface.SetDrawColor(color)
	surface.SetMaterial(grad)
	surface.DrawTexturedRect(0, ScrH() - 101, 300, 2)

	-- BASE ABOVE

	surface.SetDrawColor(secondarycolor)
	surface.DrawRect(5, ScrH() - 90, 200, 40)
	surface.DrawRect(5, ScrH() - 45, 200, 40)

	surface.DrawRect(210, ScrH() - 90, 85, 40)
	surface.DrawRect(210, ScrH() - 45, 85, 40)


	local h = LocalPlayer():Health()
	local hp = h * 2 
	if h < 0 then
		h = 0
	end

	if hp > 190 then
		hp = 190
	end
	if hp < 0 then
		hp = 0
	end

	surface.SetDrawColor(red)
	surface.DrawRect(10, ScrH() - 85, hp, 30)
	surface.DrawTexturedRect(295, ScrH() - 90, 4, 40)

	local a = LocalPlayer():Armor()
	local ap = a * 2
	if ap > 190 then
		ap = 190
	end
	if ap == 0 then
		ap = 0
	end

	surface.SetDrawColor(blue)
	surface.DrawRect(10, ScrH() - 40, ap, 30)
	surface.DrawTexturedRect(295, ScrH() - 45, 4, 40)


	-- HP ARMOR ABOVE

	draw.TextShadow(
	{
	text = h,
	pos = {250, ScrH() - 95},
	font = "ContentHeader",
	xalign = 1,
	yalign = 0	
	}, 1)

	draw.TextShadow(
	{
	text = a,
	pos = {250, ScrH() - 50},
	font = "ContentHeader",
	xalign = 1, 
	yalign = 0	
	}, 1)

	-- HP AND BODY ABOVE


	draw.TextShadow({
	text = string.sub(LocalPlayer():getDarkRPVar("job"), 0, 15),
	pos = {5, ScrH() - 132},
	font = "CloseCaption_Bold",
	xalign = 0,
	yalign = 0	
	}, 1)

	surface.SetDrawColor(color)
	surface.DrawTexturedRect(150, ScrH() - 140, 2, 39)

	draw.TextShadow({
	text = tostring("$" .. LocalPlayer():getDarkRPVar("money")),
	pos = {295, ScrH() - 133},
	font = "CloseCaption_Bold",
	xalign = 2,
	yalign = 0	
	}, 1)



end )
