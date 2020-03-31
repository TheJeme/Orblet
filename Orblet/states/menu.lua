menu = {}

local quicksandRegular
local quicksandBold

function menu:load()
  quicksandRegular = love.graphics.newFont('fonts/Quicksand-Regular.ttf', 72)
  quicksandBold = love.graphics.newFont('fonts/Quicksand-Bold.ttf', 96)
end

function menu:update(dt)

end

function menu:draw()
  love.graphics.setColor(0.2, 0.2, 0.2, 1)
  love.graphics.circle("fill", gw * 0.5, gh * 0.5, gh * 0.21, 64)
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.setFont(quicksandRegular)
  love.graphics.printf("Play", 0, gh * 0.42, gw, "center")
  love.graphics.setFont(quicksandBold)
  love.graphics.printf("Orblet", 0, gh * 0.08, gw, "center")
end

function menu:mousepressed(x, y, button, touch)
  isMouseOnPlay = x > gw * 0.5 - gh * 0.21 and x < gw * 0.5 + gh * 0.21 and
                          y > gh * 0.5 - gh * 0.21 and y < gh * 0.5 + gh * 0.21                       
  if isMouseOnPlay and button == 1 then
    state = "game"
  end
end

return menu
