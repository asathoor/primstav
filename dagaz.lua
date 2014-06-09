-- module: 	dagaz.lua
-- purpose:	The main calendar data

-------------------------------------------------------------------------
-- THE YEAR

local dagaz = {} -- the dates

dagaz[12] = { 	[24] =  {"1224.png", "Juleaftens Dag"},
 				[25] =  {"1225.png", "Juledag"}
}

-- Refer to a date like this: dagaz[12][24]

-------------------------------------------------------------------------

-- Check whether an element exists in an array or not
function setContains(set, key1, key2)

	if set[key1] ~= nil 
		then print("images/" .. set[key1][key2]) 
		else print("file: dagaz.lua l. 86: element not found in table") 
	end
	 
    return set[key] ~= nil
end
-- setContains(dagaz, 157, 3) -- sample
