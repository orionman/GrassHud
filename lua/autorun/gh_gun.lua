AddCSLuaFile()
if !CLIENT then return end 


hook.Add("HUDPaint", "gh_gun", function()

	local grad = Material("vgui/gradient-l")
	local color = Color(58, 64, 74)
	local secondarycolor = Color(30, 35, 43)
	local gun = LocalPlayer():GetActiveWeapon()
	local col = LocalPlayer():GetWeaponColor():ToColor() or ""


	if !LocalPlayer():Alive() then return end
	surface.SetDrawColor(color)
	surface.DrawRect(ScrW() - 155, ScrH() - 55, 155, 55)
	surface.SetDrawColor(secondarycolor)
	surface.DrawRect(ScrW() - 155, ScrH() - 75, 155, 25)
	surface.SetDrawColor(col)
	surface.DrawTexturedRect(ScrW() - 155, ScrH() - 51, 154, 2)
	surface.SetMaterial(grad)
	surface.SetDrawColor(color)
	surface.DrawTexturedRect(ScrW() - 155, ScrH() - 51, 154, 2)

	if gun:IsValid() and gun:IsWeapon() then
		local cliptext = tostring(gun:Clip1() .. "\\" .. LocalPlayer():GetAmmoCount( gun:GetPrimaryAmmoType() ))
		if gun:GetMaxClip1() <= 0 then
			cliptext = "NONE"
		end

		draw.Text({	
			text = gun:GetPrintName(),
			pos = {ScrW() - 77, ScrH() - 73},
			font = "Trebuchet24",
			xalign = 1,
			yalign = 0	
		}, 1)
		draw.Text({	
			text = cliptext,
			pos = {ScrW() - 77, ScrH() - 50},
			font = "ContentHeader",
			xalign = 1,
			yalign = 0	
		}, 1)
	end

end )
