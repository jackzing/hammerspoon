local hyper = {"cmd"}
local hyper2 = {"cmd", "shift"}

-- Launch applications
hs.hotkey.bind(hyper, 'E', function () hs.application.launchOrFocus("Finder") end)
hs.hotkey.bind(hyper, 'G', function () hs.application.launchOrFocus("Google Chrome") end)
hs.hotkey.bind(hyper, ';', function () hs.application.launchOrFocus("Terminal") end)
hs.hotkey.bind(hyper2, 'R', function () hs.application.launchOrFocus("RTX") end)
hs.hotkey.bind(hyper2, 'S', function () hs.application.launchOrFocus("Sublime Text 2") end)
-- Hammerspoon Console
hs.hotkey.bind(hyper2, 'D', function () hs.application.launchOrFocus("Hammerspoon") end)


-- cmd + tab + j/l switch application
rcmd_tap = hs.eventtap.new({ hs.eventtap.event.types.keyDown }, function(event)
    local code = event:getKeyCode()
    -- debug code value
    -- log.i(code)
    -- print(code)
    local cmdPress = false
    local capslockPress = false
    if hs.eventtap.checkKeyboardModifiers().cmd then
       cmdPress = true
       -- h
       if code == 4 then
         hs.eventtap.keyStroke({"cmd"}, "left")
       -- l
       elseif code == 37 then
         hs.eventtap.keyStroke({"cmd"}, "right")
       elseif code == 29 then
         -- Get the current co-ordinates of the mouse pointer
         local mousepoint = hs.mouse.getAbsolutePosition()
         hs.eventtap.rightClick(mousepoint)
       elseif code == 25 then
         hs.eventtap.keyStroke({"cmd", "shift"}, "left")
       end 
    end

    
    if hs.eventtap.checkKeyboardModifiers().capslock then
       local caps = require("capslock")
       capslockPress = true
       caps.trigger(code) 
    end
end)
rcmd_tap:start()