
-----------------------------------------------------------
-- main.lua

-- Primstaven
-- Ye Olde Norse Calendar
-- by Per Thykjaer Jensen, MA
-- License GPLv3

-----------------------------------------------------------
-- MODULES

local physics = require("physics")
physics.start()

local dagaz = require "dagaz" -- days and images
-- ex: aDay(157,3)

local __W = display.contentWidth/2
local __H = display.contentHeight/2

local g1 = display.newGroup()
local i = 1
local xPos = 0

local bred = 150
local hoej = 600
local mellemrum = 3

local flise = {}
local nummer = {}

local tekst = {}

-----------------------------------------------------------
-- TITLE 

local titel = display.newText("Primstav", __W, -200, native.systemfont, 36)
titel:setFillColor( 255, 255, 255 )

local datoen = os.date("%d.%m. %Y") -- henter en dato via os

local titel = display.newText("The Scandinavian Almanac " .. datoen, __W, -170, native.systemfont, 18)
titel:setFillColor( 255, 255, 255 )

-----------------------------------------------------------
-- LEAP YEAR CHECK
function isLeapYear(year)
  return year%4==0 and (year%100~=0 or year%400==0)
end

-- leap year function
-- nb. the leap day is Feb. 24th
if isLeapYear(os.date("%Y")) 
	then aarDage = 366
	else aarDage = 365 
	end

-----------------------------------------------------------
-- THE PRIMSTAV LOOP
-- Draw the primstav

while i <= aarDage do
	xPos = xPos + bred + mellemrum

	-- baggrund
	flise[i] = display.newRect(xPos,50,bred,hoej)
	flise[i]:setFillColor( 160/255, 0, 0 )

	-- dagens nummer
	nummer[i] = display.newText(i, xPos, -220, native.systemfont, 20)
	nummer[i]:setFillColor( 255, 255, 255 )
	
	-- insert symbol
	sym = display.newImage("images/test.png")
	-- ?? sym = display.newImage(thord)
	sym.x = nummer[i].x
	sym.y = __H - 300
	
	-- tilfoejes til gruppen
	g1:insert(flise[i])
	g1:insert(nummer[i]) 
	g1:insert(sym)
	
	i = i + 1
end

-----------------------------------------------------------
-- THE DAY'S NUMBER (yday)
-- Creates this table:   {year = 1998, month = 9, day = 16, yday = 259, wday = 4, hour = 23, min = 48, sec = 10, isdst = false}

yday = os.date("*t", os.time()) 
-- print(yday["yday"])

-- color
flise[yday['yday']]:setFillColor(200/255,0,0)

-- placerer den aktuelle dag synligt paa skaermen
g1.x = ((( -1 * bred)  ) * yday["yday"]) - __W
g1.y = 150

-- Physics
-- physics (perhaps later on for a nice scrolling effect)
-- physics.addBody( g1, "static", { density=2,friction=0.5, bounce=0.3 } )

-----------------------------------------------------------
-- TOUCH

function g1:touch( event )
  local t = event.target
  local phase = event.phase
  if("began" == phase) then
    display.getCurrentStage():setFocus(t)
    t.isFocus = true
    t.x0 = event.x - t.x
    -- t.y0 = event.y - t.y
  elseif(t.isFocus) then
    if("moved" == phase) then
      t.x = event.x - t.x0
      -- t.y = event.y - t.y0
    elseif("ended" == phase or "cancelled" == phase) then
      display.getCurrentStage():setFocus(nil)
      t.isFocus = false
    end
  end
  return true
end

g1:addEventListener( "touch", myObject ) -- make 'myObject' listen for touch events



