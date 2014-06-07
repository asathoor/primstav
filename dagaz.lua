-- module: dagaz.lua
-- purpose: tables for the days

local dagaz = {} -- array for all days

-- Placeholders for the days of any year
for n = 1, 366, 1 do
	dagaz[n] = {nil,nil,nil,nil}
end

-- DAYS
-- sample: dagaz[1] = number of the day - array: month, day, image, text
dagaz[1] = {1,1,"day_1.png","New Years Day"} -- test 
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
