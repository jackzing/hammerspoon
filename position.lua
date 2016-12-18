local hyper = {"cmd", "alt"}

-----------------------------------------------
-- hyper d for left one half window
-----------------------------------------------
local screenWatcher = nil

local function  setWinToLeft()
  print("screen happen")
  if screenWatcher then
    screenWatcher:stop()
    screenWatcher = nil
  end
  -- body
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y 
  f.w = max.w / 2
  f.h = max.h
  -- print(f)
  win:setFrameInScreenBounds(f)
end

hs.hotkey.bind(hyper, "Left", function()
  -- hs.window.setFrameCorrectness = true
  local win = hs.window.focusedWindow()
  --don't forget this, or not work on fullscreen
  local isFullScreen = win:isFullScreen()
  if isFullScreen  then
     print("left fullscreen")
     screenWatcher = hs.screen.watcher.new(setWinToLeft)
     screenWatcher:start()
     win:setFullScreen(false)
  else
    setWinToLeft()
  end
end)

-----------------------------------------------
-- hyper g for right one half window
-----------------------------------------------
local function  setWinToRight()
  print("screen happen")
  if screenWatcher then
    screenWatcher:stop()
    screenWatcher = nil
  end
  -- body
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end

hs.hotkey.bind(hyper, "Right", function()
  -- hs.window.setFrameCorrectness = true
  local win = hs.window.focusedWindow()
  --don't forget this, or not work on fullscreen
  local isFullScreen = win:isFullScreen()
  if isFullScreen  then
     screenWatcher = hs.screen.watcher.new(setWinToRight)
     screenWatcher:start()
     win:setFullScreen(false)
  else
    setWinToRight()
  end
end)

-----------------------------------------------
-- hyper up for fullscreen
-----------------------------------------------
hs.hotkey.bind(hyper, "Up", function()
    local win = hs.window.focusedWindow()
    local isFullScreen = win:isFullScreen()
    if isFullScreen == false then
        win:setFullScreen(true)
    else
        win:setFullScreen(false)
    end
end)

-----------------------------------------------
-- hyper down for center position
-----------------------------------------------
local function  setWinToCenter()
  print("screen happen")
  if screenWatcher then
    screenWatcher:stop()
    screenWatcher = nil
  end
  -- body
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  local width = max.w * 0.8

  f.x = (max.w - width) / 2
  f.y = max.y
  f.w = width
  f.h = max.h
  win:setFrame(f)
end

hs.hotkey.bind(hyper, "Down", function()
  local win = hs.window.focusedWindow()
  local isFullScreen = win:isFullScreen()
  if isFullScreen  then
     screenWatcher = hs.screen.watcher.new(setWinToCenter)
     screenWatcher:start()
     win:setFullScreen(false)
  else
    setWinToCenter()
  end
end)