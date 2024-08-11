local Library = {}
Library.Link = "https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Libs/convs.lua"
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Libs/convs.lua"))()
Library.Round = function(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end
Library.ToLetters = function(num, commanums)
	commanums = commanums or 2
	if num / 1e78 >=1 then
		newnum = num / 1e78
		return Library.Round(newnum, commanums).."QiVi"
	elseif num / 1e75 >=1 then
		newnum = num / 1e75
		return Library.Round(newnum, commanums).."QaVi"
	elseif num / 1e72 >=1 then
		newnum = num / 1e72
		return Library.Round(newnum, commanums).."TVi"
	elseif num / 1e69 >=1 then
		newnum = num / 1e69
		return Library.Round(newnum, commanums).."DVi"
	elseif num / 1e66 >=1 then
		newnum = num / 1e66
		return Library.Round(newnum, commanums).."UVi"
	elseif num / 1e63 >= 1 then
		newnum = num / 1e63
		return Library.Round(newnum, commanums).."Vi"
	elseif num / 1e60 >= 1 then
		newnum = num / 1e60
		return Library.Round(newnum, commanums).."NoV"
	elseif num / 1e57 >=1 then
		newnum = num / 1e57
		return Library.Round(newnum, commanums).."OcD"
	elseif num / 1e54 >=1 then
		newnum = num / 1e54
		return Library.Round(newnum, commanums).."SpD"
	elseif num / 1e51 >=1 then
		newnum = num / 1e51
		return Library.Round(newnum, commanums).."SxD"
	elseif num / 1e48 >=1 then
		newnum = num / 1e48
		return Library.Round(newnum, commanums).."QiDe"
	elseif num / 1e45 >=1 then
		newnum = num / 1e45
		return Library.Round(newnum, commanums).."QaDe"
	elseif num / 1e42 >=1 then
		newnum = num / 1e42
		return Library.Round(newnum, commanums).."TDe"
	elseif num / 1e39 >=1 then
		newnum = num / 1e39
		return Library.Round(newnum, commanums).."DDe"
	elseif num / 1e36 >=1 then
		newnum = num / 1e36
		return Library.Round(newnum, commanums).."UDe"
	elseif num / 1e33 >=1 then
		newnum = num / 1e33
		return Library.Round(newnum, commanums).."De"
	elseif num / 1e30 >=1 then
		newnum = num / 1e30
		return Library.Round(newnum, commanums).."No"
	elseif num / 1e27 >=1 then
		newnum = num / 1e27
		return Library.Round(newnum, commanums).."Oc"
	elseif num / 1e24 >=1 then
		newnum = num / 1e24
		return Library.Round(newnum, commanums).."Sp"
	elseif num / 1e21 >=1 then
		newnum = num / 1e21
		return Library.Round(newnum, commanums).."Se"
	elseif num / 1e18 >=1 then
		newnum = num / 1e18
		return Library.Round(newnum, commanums).."Qn"
	elseif num / 1e15 >=1 then
		newnum = num / 1e15
		return Library.Round(newnum, commanums).."Qa"
	elseif num / 1e12 >=1 then
		newnum = num / 1e12
		return Library.Round(newnum, commanums).."T"
	elseif num / 1e09 >=1 then
		newnum = num / 1e09
		return Library.Round(newnum, commanums).."B"
	elseif num / 1e06 >=1 then
		newnum = num / 1e06
		return Library.Round(newnum, commanums).."M"
	elseif num / 1e03 >=1 then
		newnum = num / 1e03
		return Library.Round(newnum, commanums).."K"
	else return num
	end
end
return Library
