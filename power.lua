local modem = peripheral.wrap("right")
local monitor = peripheral.wrap("back")
local startHeightY = 1

modem.closeAll()
modem.open(44)
modem.open(45)

monitor.setCursorPos(1,1)
monitor.clear()
lengthx,lengthy = monitor.getSize()

function drawLine(x,y,length,color)
    oldBgColor = monitor.getBackgroundColor()
    for i = x (length + x) do
        monitor.setCursorPos(i,y)
        monitor.setBackgroundColor(color)
        monitor.write(" ")
    end
    monitor.setBackgroundColor(oldBgColor)
end

--Term Processing Message 
function termMessage()
    term.write("Processing.")
    sleep(1)
    term.setCursorPos(1,1)
    term.write("Processing..")
    sleep(1)
    term.setCursorPos(1,1)
    term.write("Processing...")
    sleep(1)
    term.clear()
    term.setCursorPos(1,1)
end

function centerText(colorTxt,colorBg,text)
    local x,y = monitor.getSize()
    local x2,y2 = monitor.getCursorPos()
    oldTxtColor = monitor.getTextColor()
    oldBgColor = monitor.getBackgroundColor()
    monitor.setTextColor(colorTxt)
    monitor.setBackgroundColor(colorBg)
    monitor.setCursorPos(math.ceil((x/2) - (text:len() / 2)), y2)
    monitor.write(text)
    monitor.setTextColor(oldTxtColor)
    monitor.setBackgroundColor(oldBgColor)
end

local function energyData()
    event, side, replyChannel, message, distance = os.pullEvent("modem_message")
    if channel == 44 then
        currentEnergy = message
        displayValue = message/1000
        energyLevelPercent = currentEnergy/maxEnergy*100
    end
end

local function reactorData()
    event, side, replyChannel, message, distance = os.pullEvent("modem_message")
    if channel == 45 then
        reactorStatus = message
        if reactorStatus == "false" then
            reactorStatus = "offline"
        else
            reactorStatus = "online"
        end
    end
end

local function colorText(color, text)
    local oldTxtColor = monitor.getTextColor()
    monitor.setTextColor(colors.[color])
    monitor.write(text)
    monitor.setTextColor(oldTextColor)
end

local function monitorDisplay()
    monitor.clear()
    monitor.setCursorPos(1,startHeightY)
    monitor.write("Storage: "..displayValue.." KRF/T")

    --Percentage Text
    monitor.setCursorPos(1,startHeightY+5)
    monitor.write("Percentage: "..energyLevelPercent.." %")

    --Reactor Status
    monitor.setCursorPos(1,startHeightY+7)
    monito.write("Reactor Status: ")
    if reactorStatus == "offline" then
        colorText(colors.red, reactorStatus)
    else
        colorText(colors.green, reactorStatus)
    end
end

--Main Loop
while true do
    energyData()
    reactorData()
    termMessage()
    monitorDisplay()
end