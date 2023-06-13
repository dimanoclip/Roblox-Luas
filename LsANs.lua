local Library = {}

function round(num, numDecimalPlaces)
	local mult = 10^(numDecimalPlaces or 0)
	return math.floor(num * mult + 0.5) / mult
end

Library.Round = round()

Library.ToLetters = function(num)
	if num / 1e57 >=1 then
		newnum = num / 1e303
		return round(newnum, 5).. "Ce"
	elseif num / 1e57 >=1 then
		newnum = num / 1e57
		return round(newnum, 1).. "OcDe"
	elseif num / 1e54 >=1 then
		newnum = num / 1e54
		return round(newnum, 1).. "SpDe"
	elseif num / 1e51 >=1 then
		newnum = num / 1e51
		return round(newnum, 1).. "SxDe"
	elseif num / 1e48 >=1 then
		newnum = num / 1e48
		return round(newnum, 1).. "QiDe"
	elseif num / 1e45 >=1 then
		newnum = num / 1e45
		return round(newnum, 1).. "QaDe"
	elseif num / 1e42 >=1 then
		newnum = num / 1e42
		return round(newnum, 1).. "TDe"
	elseif num / 1e39 >=1 then
		newnum = num / 1e39
		return round(newnum, 1).. "DDe"
	elseif num / 1e36 >=1 then
		newnum = num / 1e36
		return round(newnum, 1).. "Un"
	elseif num / 1e33 >=1 then
		newnum = num / 1e33
		return round(newnum, 1).. "De"
	elseif num / 1e30 >=1 then
		newnum = num / 1e30
		return round(newnum, 1).. "No"
	elseif num / 1e27 >=1 then
		newnum = num / 1e27
		return round(newnum, 1).. "Oc"
	elseif num / 1e24 >=1 then
		newnum = num / 1e24
		return round(newnum, 1).. "Sp"
	elseif num / 1e21 >=1 then
		newnum = num / 1e21
		return round(newnum, 1).. "Sx"
	elseif num / 1e18 >=1 then
		newnum = num / 1e18
		return round(newnum, 1).. "Qi"
	elseif num / 1e15 >=1 then
		newnum = num / 1e15
		return round(newnum, 1).. "Qa"
	elseif num / 1e12 >=1 then
		newnum = num / 1e12
		return round(newnum, 1).. "T"
	elseif num / 1e09 >=1 then
		newnum = num / 1e09
		return round(newnum, 1).. "B"
	elseif num / 1e06 >=1 then
		newnum = num / 1e06
		return round(newnum, 1).. "M"
	elseif num / 1e03 >=1 then
		newnum = num / 1e03
		return round(newnum, 1).. "K"
	else return num
	end
end

return Library
