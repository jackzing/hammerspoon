-- H --> 4  -- left
-- J --> 38 -- down
-- K --> 40 -- up
-- L --> 37 -- right
local function getKeyHandlers()
    local switch = {
        [4] = function()    -- for case 4
            hs.eventtap.keyStroke({}, "left")
        end,
        [38] = function() 
            hs.eventtap.keyStroke({}, "down")
        end,
        [40] = function() 
            hs.eventtap.keyStroke({}, "up")
        end,
        [37] = function()
            hs.eventtap.keyStroke({}, "right")
        end
    }
    return switch
end 

local function trigger(code)
    -- print(code)
    local keyHandlers = getKeyHandlers()
    local ks = false
    if code then
        ks = keyHandlers[code]
    end
    if type(ks) == 'function' then
       ks()
    end 
end

return {
    trigger = trigger
}