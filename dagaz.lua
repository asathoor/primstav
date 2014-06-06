-- file: dagaz.lua
-- purpose: tables for the days

local dagaz = {} -- array for all days

-- sample: dagaz[1] = number of the day - array: month, day, image, text
dagaz[1] = {1,1,"day_1.png","New Years Day"} -- test 
dagaz[157] = {6,6,"test.png","test"} -- test

-- Get values from the dagaz array
function aDay(num, ber)
	-- print(dagaz[num][ber])
	return dagaz[num][ber]
end
