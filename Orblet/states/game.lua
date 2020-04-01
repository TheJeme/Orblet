player = require 'player'
obstacle = require 'obstacle'

game = {}

local points

function game:resetPoints()
  points = 0
end

function game:load()
  game:resetPoints()
  obstacle:load()
  player:load()
end

function game:update(dt)
  player:update(dt)
  obstacle:update(dt)
  
  if (player.physics.body:getY() >= gh * 0.50 and obstacle:getAngle() > 3 and obstacle:getAngle() < 3.5) then
    state = "menu"
    obstacle:resetAngle()
  elseif obstacle:getAngle() <= 3.5 and obstacle:getAngle() >= 3.4 and obstacle:getCanGetPoint() then
    points = points + 1
    obstacle:setCanGetPoint()
  end
end

function game:draw()  
  love.graphics.setColor(orange)
  love.graphics.circle("fill", gw * 0.9, gh * 0.1, 95, 64)
  
  love.graphics.setColor(lightorange)
  --love.graphics.rectangle("fill", gw * 0.3, gh * 0.2, 120, 35, 18)
  love.graphics.setFont(quicksandBold)
  love.graphics.printf(points, 0, gh * 0.16, gw, "center")
  --Big sphere
  love.graphics.setColor(0.2, 0.2, 0.2, 1)  
  love.graphics.circle("fill", gw * 0.5, gh * 0.9, gh * 0.33, 64)

  obstacle:draw()
  player:draw()
end

function game:mousepressed(x, y, button, isTouch)
  player:mousepressed(x, y, button, isTouch)
end

return game
