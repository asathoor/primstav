-----------------------------------------------------------------------------------------
-- main.lua

-- Primstaven
-- Ye Olde Norse Calendar

-- version	0.1
-- by Per Thykjaer Jensen, MA
-- License GPLv3

-----------------------------------------------------------------------------------------

-- placering
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

-- titel
local titel = display.newText("Primstaven", __W, -200, native.systemfont, 36)
titel:setFillColor( 255, 255, 255 )

local datoen = os.date("%d.%m. %Y") -- henter en dato via os


local titel = display.newText("The Scandinavian Almanac " .. datoen, __W, -170, native.systemfont, 18)
titel:setFillColor( 255, 255, 255 )

-- EN FLISE PR DAG I AARET

-- Tjek for skudaar
function isLeapYear(year)
  return year%4==0 and (year%100~=0 or year%400==0)
end

-- Hvis skudaar så ... antal dage
if isLeapYear(os.date("%Y")) 
	then aarDage = 366
	else aarDage = 365 
	end

-- aarDage anvendes. Programmet ved om aaret er et skudaar.
while i <= aarDage do
	xPos = xPos + bred + mellemrum

	-- baggrund
	flise[i] = display.newRect(xPos,50,bred,hoej)
	flise[i]:setFillColor( 160/255, 0, 0 )

	-- dagens nummer
	nummer[i] = display.newText(i, xPos, -220, native.systemfont, 20)
	nummer[i]:setFillColor( 255, 255, 255 )
	
	-- tilfoejes til gruppen
	g1:insert(flise[i])
	g1:insert(nummer[i]) 

	i = i + 1
end

-- GRAFIK OG TEKSTER
-- hentes via json

-- DAGENS NUMMER (yday)
-- herunder skabes tabellen:   {year = 1998, month = 9, day = 16, yday = 259, wday = 4, hour = 23, min = 48, sec = 10, isdst = false}
yday = os.date("*t", os.time()) 
-- print(yday["yday"])

-- aendre farven paa dagen i dag
flise[yday['yday']]:setFillColor(200/255,0,0)

-- placerer den aktuelle dag synligt paa skaermen
g1.x = ((( -1 * bred)  ) * yday["yday"]) - __W
g1.y = 150

 -- touch listener function
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
 
-- make 'myObject' listen for touch events
g1:addEventListener( "touch", myObject )
