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

-- test
	--print(type(dagaz[1][3]))
	--print(type(dagaz[666]))	
	--if (type(dagaz[1][3]) == "string") then print("det er en streng") end

-- Only do something if array element is defined 
function bDay(num,ber)
	if (type(dagaz[num][ber]) == "string") 
	then
		print("Strengen findes: " .. dagaz[num][ber])
		return dagaz[num][ber]
	else 
		print("Denne streng er ikke defineret endnu")
		return false
	end
end

bDay(333,3) -- > nil
bDay(157,3) -- > dagaz[num][ber]
