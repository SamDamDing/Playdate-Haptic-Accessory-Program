import 'CoreLibs/ui/gridview.lua'
import 'CoreLibs/nineslice'

local gfx = playdate.graphics
local hapticEffects = import("hapticData.lua")
local menu = playdate.getSystemMenu()
gfx.clear()

local slots = {0, 0, 0, 0, 0, 0, 0, 0}
local currentSlot = 1

local listFont = gfx.font.new('assets/Bitmore-Medieval')
listFont:setTracking(1)

local listviewHeight = 220
local lastDrawnListviewHeight = 0

-- Flatten haptic patterns for menu options
local menuOptions = {}
for _, pattern in pairs(hapticEffects) do
    table.insert(menuOptions, pattern)
end

local listview = playdate.ui.gridview.new(0, 10)
--listview.backgroundImage = playdate.graphics.nineSlice.new("assets/scrollbg", 20, 22, 88, 28)
listview:setNumberOfRows(#menuOptions)
listview:setCellPadding(0, 0, 0, 10)
listview:setContentInset(24, 24, 13, 11)

function listview:drawCell(section, row, column, selected, x, y, width, height)
	if selected then
		gfx.setColor(gfx.kColorBlack)
		gfx.fillRoundRect(x, y, width, 20, 4)
		gfx.setImageDrawMode(gfx.kDrawModeFillWhite)
	else
		gfx.setImageDrawMode(gfx.kDrawModeCopy)
	end
	gfx.setFont(listFont)
	gfx.drawTextInRect(menuOptions[row], x, y+6, width, height+2, nil, "...", kTextAlignment.center)

end


-- buttons --

function playdate.AButtonUp()
	print("AT+WAVEFORM=0," .. slots[1] .. 
 	":1," .. slots[2] .. 
	":2," .. slots[3] .. 
	":3," .. slots[4] .. 
	":4," .. slots[5] .. 
	":5," .. slots[6] .. 
	":6," .. slots[7] .. 
	":7," .. slots[8])
	print("AT+GO")
end

function playdate.BButtonUp()
    -- Store the key (effect ID) for the currently selected haptic effect
    slots[currentSlot] = listview.selectedRow-1
	print("Slot Number: " .. currentSlot)
	print("Slot Value: " .. slots[currentSlot])
    print("Effect ID: " .. listview.selectedRow-1)
	if menuOptions[slots[currentSlot]] == nil then
		menuOptions[slots[currentSlot]] = 0
	end
	print("Haptic Pattern: " .. menuOptions[(slots[currentSlot])+1])
end

function playdate.upButtonUp()
	listview:selectPreviousRow(false)
end

function playdate.downButtonUp()
	listview:selectNextRow(false)
end

function playdate.leftButtonUp()
	if currentSlot >= 2 and currentSlot <= 8 then
		currentSlot = currentSlot - 1
	end
end

function playdate.rightButtonUp()
	if currentSlot < 8 and currentSlot >= 1 then
		currentSlot = currentSlot +  1
	end
end

local menuItem, error = menu:addMenuItem("Reset Slots", function()
    slots = {0, 0, 0, 0, 0, 0, 0, 0}
end)

-- main update function --

function playdate.update()
    playdate.timer.updateTimers()

    -- Clear the area for listview
    gfx.setColor(gfx.kColorWhite)
    gfx.fillRect(0, 40, 400, 220)
    listview:drawInRect(0, 40, 400, 220)

    -- Clear the area where the slot text is drawn
    gfx.setColor(gfx.kColorWhite)
    gfx.fillRect(0, 0, 400, 40)

    -- Draw the slot text
    gfx.setColor(gfx.kColorBlack)  -- Set the color for the text
    gfx.setFont(listFont)
    gfx.drawTextAligned("Slot: " .. tostring(currentSlot), 10, 5, kTextAlignment.left)  -- Adjusted alignment and added a prefix "Slot: "
    gfx.drawTextAligned("Haptic ID: " .. tostring(slots[currentSlot]), 10, 15, kTextAlignment.left)  -- Adjusted alignment and added a prefix "Slot: "
    gfx.drawTextAligned("Haptic Pattern: " .. menuOptions[(slots[currentSlot])+1], 10, 25, kTextAlignment.left)  -- Adjusted alignment and added a prefix "Slot: "
	
end
