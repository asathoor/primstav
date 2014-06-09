-- module: dagaz.lua
-- purpose: tables for the days

--[[
This module is still somewhat experimental.
Doing sort of the stuff the primstav needs here and there.
]]--

------------------------------------------------------
-- THE YEAR ARRAY

local dagaz = {} -- array for all days

--[[
Leap year function needed here ...
]]--

-- Placeholders for the days of any year
for n = 1, 366, 1 do
	dagaz[n] = {nil,nil,nil,nil}
end

------------------------------------------------------
-- Alternative dagaz array

--[[
The idea is to create a table for the entire year
by a loop - and then change the values of special days.
Then the "tiles" of the primstav may be constructed in 
by a loop.
]]--

local dagaz2 = {} -- the dates
-- form month day e.g.

dagaz2[12] = { 	[24] =  {"1224.png", "Juleaftens Dag"},
 				[25] =  {"1225.png", "Juledag"},
				[27] =  {"1227.png", "Nissedag"} 
}

-- Usage:
-- dagaz2[12][27] = {"Nonsense Mass","badaboom"} -- change value of 27th. 12.
-- print("### Dagaz2: " .. dagaz2[12][27][2]) -- tekst juleaften



------------------------------------------------------
-- DATE, IMAGE, TEXT
-- sample: dagaz[1] = number of the day - array: month, day, image, text

--[[
The first idea.
Not that practical.
The code is commented out ... but kept for referece.
]]--

--[[
-- Winter
dagaz[1] = {1,1,"day_1.png","New Years Day"} -- test 

-- Summer
dagaz[157] = {6,6,"157.png","test"} -- test 

-- Get values from the dagaz array
function aDay(num, ber)
	print(dagaz[num][ber])
	return dagaz[num][ber] 
end

-- Check whether a string exists in the dagaz table
function bDay(num,ber)
	if (type(dagaz[num][ber]) == "string") 
	then
		print("Strengen findes: " .. dagaz[num][ber])
		return dagaz[num][ber]
	else 
		print("Denne dato-streng er ikke defineret endnu")
		return false
	end
end

-- test
-- bDay(333,3) -- > nil
-- bDay(157,3) -- > dagaz[num][ber]

if (type(bDay(157,3)) == "string") 
	then print("images/" .. tostring(bDay(2,3))) 
end 

]]--

------------------------------------------------------
-- THE DAY NUMBER
-- Enter month and date via the function dayNumber()

maaned = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31} -- days of the year

-- if leap year then m2 = 29 function here 
-- ... code goes here ...

-- Calculate the day number of some date
local i = 1
local day = 0
local enDag = 0
function dayNumber(month,enDag) 
	while i < month do 
		-- print(maaned[i])
		day = day + maaned[i]
		print(day + enDag)
      	i = i + 1
    end
    return day + enDag
end
-- test
-- dayNumber(12,27) 

-- Check whether an element exists in an array or not
-- e.g. only print a defined image
function setContains(set, key1, key2)

	if set[key1] ~= nil 
		then print("images/" .. set[key1][key2]) 
		else print("file: dagaz.lua l. 86: element not found in table") 
	end
	 
    return set[key] ~= nil
end
-- setContains(dagaz, 157, 3) -- sample
