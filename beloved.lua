beloved = {}

local debugMode
local font

function beloved:load()
  debugMode = false
  font = love.graphics.newFont(12)
end

function beloved:draw()
  if(debugMode == true) then
    
    love.graphics.setFont(font)
    love.graphics.push()
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.line(gw * 0.5, 0, gw * 0.5, gh)
    love.graphics.line(0, gh * 0.5, gw, gh * 0.5)
    
    love.graphics.print("FPS " .. love.timer.getFPS(), 0, 0)
    love.graphics.print("Mouse position: " .. love.mouse.getX() .. ", " .. love.mouse.getY(), 0, 15)
    if (mouse1Down) then
      love.graphics.print("Left mouse button down", 0, 30)
    end
    if (mouse2Down) then
      love.graphics.print("Right mouse button down", 0, 45)
    end
    love.graphics.pop()
  end
end

function beloved:mousepressed(x, y, button)
  if (button == 1) then
    mouse1Down = true
  end
  if (button == 2) then
    mouse2Down = true
  end
end

function beloved:mousereleased(x, y, button)
  if button == 1 then
    mouse1Down = false
  end
  if button == 2 then
    mouse2Down = false
  end
end

function beloved:keypressed(key)
  if key == 'd' then
    debugMode = not debugMode
  end
end

return beloved
