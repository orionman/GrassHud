AddCSLuaFile()
if !CLIENT then return end 
local posx, posy = ScrW() + ((ScrW() / 2) * 2) - 210, ScrH()
local avatar = vgui.Create("AvatarImage")
avatar:SetSize(96, 96)
avatar:SetPlayer(LocalPlayer(), 184)
local act = false 
hook.Add("HUDPaint", "gh_tgt", function()
	local tr = util.GetPlayerTrace( LocalPlayer() )
	local trace = util.TraceLine( tr )
	if ( trace.Entity:IsPlayer() ) then

		local dist = trace.StartPos:Distance(trace.HitPos)
		if dist > 200 then
			act = false
		else
			act = true
		end
		if dist > 200 then return end
		surface.SetDrawColor(Color(58, 64, 74, 230))
		surface.DrawRect(posx / 2 - 105, posy / 2 + 100, 210, 70 )
		surface.SetDrawColor(Color(30, 35, 43, 240))
		surface.DrawRect(posx / 2 - 105, posy / 2 + 70, 210, 30)
		draw.Text({
			text = trace.Entity:Nick(),
			pos = {posx / 2, posy / 2 + 85},
			font = "Trebuchet24",
			xalign = 1,
			yalign = 1,
			color = Color(255,255,255,240)
		})

		-- NAME AND BODY ABOVE

		surface.DrawRect(posx / 2 - 102, posy / 2 + 102, 204, 30)
		surface.SetDrawColor(Color(255, 84, 84))
		surface.DrawRect(posx / 2 - 100, posy / 2 + 104, trace.Entity:Health() * 2, 26)
		draw.Text({
			text = trace.Entity:Health(),
			pos = {posx / 2, posy / 2 + 118},
			font = "Trebuchet24",
			xalign = 1,
			yalign = 1,
			color = Color(255,255,255,240)
		})	

		draw.Text({
			text = trace.Entity:getDarkRPVar("job"),
			pos = {posx / 2, posy / 2 + 150},
			font = "CloseCaption_Bold",
			xalign = 1,
			yalign = 1,
			color = Color(255,255,255,240)
		})	


		-- HP ABOVE
		surface.SetDrawColor(Color(30, 35, 43, 240))
		surface.DrawRect(posx / 2 - 205, posy / 2 + 70, 100, 100)
		avatar:SetPlayer(trace.Entity, 184)


	else
		act = false 
	end
end )

hook.Add("Tick", "gh_tgt", function()
	if act then
		avatar:SetPos(posx / 2 - 203, posy / 2 + 72)
	else
		avatar:SetPos(0, ScrW() + 1)
	end 
end )
