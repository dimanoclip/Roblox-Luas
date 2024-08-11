local Library = {}
Library.Link = "https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Libs/time.lua"
-- loadstring(game:HttpGet("https://raw.githubusercontent.com/Dimanoname/Roblox-Luas/main/Libs/time.lua"))()
Library.ToTable = function(secs: number)
    local time = {secs = secs, mins = 0, hours = 0, days = 0}
    if time.secs >= 86400 then
        time.mins = math.floor(time.secs/60); time.secs -= (60*time.mins)
		time.hours = math.floor(time.mins/60); time.mins -= (60*time.hours)
        time.days = math.floor(time.hours/24); time.hours -= (24*time.days)
	elseif time.secs >= 3600 then
		time.mins = math.floor(time.secs/60); time.secs -= (60*time.mins)
		time.hours = math.floor(time.mins/60); time.mins -= (60*time.hours)
    elseif time.secs >= 60 then
        time.mins = math.floor(time.secs/60); time.secs -= (60*time.mins)
    end
    return time
end
Library.ToString = function(secs: number)
    local mins,hours,days = 0,0,0
    if secs >= 86400 then
        mins = math.floor(secs/60); secs -= (60*mins)
		hours = math.floor(mins/60); mins -= (60*hours)
        days = math.floor(hours/24); hours -= (24*days)
	elseif secs >= 3600 then
		mins = math.floor(secs/60); secs -= (60*mins)
		hours = math.floor(mins/60); mins -= (60*hours)
    elseif secs >= 60 then
        mins = math.floor(secs/60); secs -= (60*mins)
    end
    if secs < 10 then secs = "0"..secs end
    if mins < 10 then mins = "0"..mins end
    if hours < 10 then hours = "0"..hours end
    if days < 10 then days = "0"..days end
    return string.format("%s:%s:%s:%s", days, hours, mins, secs)
end
return Library