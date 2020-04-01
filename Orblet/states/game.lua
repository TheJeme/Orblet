player = require 'player'

game = {}

local angle


function game:load()
  player:load()
  angle = 0
end

function game:update(dt)
  angle = angle + dt * math.pi/2
	angle = angle % (2*math.pi)
  player:update(dt)
end

function game:draw()  
  love.graphics.setColor(orange)
  love.graphics.circle("fill", gw * 0.9, gh * 0.1, 95, 64)
  
  love.graphics.setColor(lightorange)
  --love.graphics.rectangle("fill", gw * 0.3, gh * 0.2, 120, 35, 18)
  love.graphics.setFont(quicksandBold)
  love.graphics.printf("102", 0, gh * 0.16, gw, "center")
  --Big sphere
  love.graphics.setColor(0.2, 0.2, 0.2, 1)  
  love.graphics.circle("fill", gw * 0.5, gh * 0.9, gh * 0.33, 64)
  
  love.graphics.push()
    love.graphics.translate(gw * 0.5, gh * 0.9)
  	love.graphics.rotate(-angle)
    love.graphics.rectangle("fill", -30,0, 60, gh * 0.38)
  love.graphics.pop()
  
  player:draw()
end

function game:mousepressed(x, y, button)
  player:mousepressed(x, y, button)
end

return game
