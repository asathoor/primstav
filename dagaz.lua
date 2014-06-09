-- module: 	dagaz.lua
-- purpose:	The Almanac

-----------------------------------------------------------
-- THE YEAR

local dagaz = {} -- the dates

-----------------------------------------------------------
-- LEAP YEAR CHECK
function isLeapYear(year)
  return year%4==0 and (year%100~=0 or year%400==0)
end

-- leap year function
if isLeapYear(os.date("%Y")) 
	then 
		aarDage = 366
		maaneder = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31} -- days of the year
		dagaz = {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31} -- days of the year
	else 
		aarDage = 365 
		maaneder = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31} -- days of the year
		dagaz = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31} -- days of the year
	end

-----------------------------------------------------------
-- THE DATA

-- Placeholder for the month
function lavMaaned(maaned, count)
	while count <= maaned do
		dagaz[maaned] = {
			[count] = {nil,nil}
		}
		count = count +1
	end
end

-- JANUAR
-- FEBRUAR
-- MARTS
-- APRIL
-- MAJ

-- JUNI

lavMaaned(6,1) -- create the month placeholder

-- Begivenheder:

dagaz[6] = {
	[3] = {nil, "Rasmusdagen"},
	[8] = {nil, "Medardus og Gilardus"},
	[9] = {nil, "Kolumbamesse"},
	[17] = {nil, "Botolfsmesse"},
	[21] = {nil, "Sommersolhverv"},
	[22] = {nil, "De ti tusind riddere"},
	[24] = {nil, "St. Hans"},
	[29] = {nil, "Petersmesse"}
}

-- JULI
-- AUGUST
-- SEPTEMBER
-- OKTOBER
-- NOVEMBER

-- DECEMBER

dagaz[12] = { 
	[24] =  {"1224.png", "Juleaftens Dag"},
 	[25] =  {"1225.png", "Juledag"}
}

-- usage:
print(dagaz[6][3][4]) --> Rasmusdagen
