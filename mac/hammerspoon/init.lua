
local shiftPressedTime = 0

shiftEventTap = hs.eventtap.new({hs.eventtap.event.types.flagsChanged, hs.eventtap.event.types.keyDown, hs.eventtap.event.types.keyUp}, function(event)
    local keyCode = event:getKeyCode()

    -- 如果100ms后Shift仍按住，则不视为单按
    local delay = 0.15

    -- 检查是否是Shift键事件
    if keyCode ~= 56 and keyCode ~= 60 then
        shiftPressedTime = 0
        return false  -- 不阻止事件传递
    end

    local flags = event:getFlags()
    if flags.shift then
        -- Shift按下
        shiftPressedTime = os.time()
    else
        if shiftPressedTime > 0 and os.time() - shiftPressedTime < delay then
            shiftPressedTime = 0
            local sourceId = hs.keycodes.methods(true)[1]
            if sourceId == hs.keycodes.currentSourceID() then
                sourceId = hs.keycodes.layouts(true)[1]
            end
            print("单按Shift - 切换输入法", sourceId)
            hs.keycodes.currentSourceID(sourceId)
            -- hs.eventtap.event.newKeyEvent({"ctrl"}, "space", true):post() -- true 表示按下
            -- hs.eventtap.event.newKeyEvent({"ctrl"}, "space", false):post() -- false 表示释放
        end
        shiftPressedTime = 0
    end
    return false
end)

shiftEventTap:start()
