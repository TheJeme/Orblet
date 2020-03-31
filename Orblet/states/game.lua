game = {}

local angle

local quicksandRegular
local quicksandBold

function game:load()
    angle = 0
    quicksandRegular = love.graphics.newFont('fonts/Quicksand-Regular.ttf', 72)
    quicksandBold = love.graphics.newFont('fonts/Quicksand-Bold.ttf', 96)
end

function game:update(dt)
  angle = angle + dt * math.pi/2
	angle = angle % (2*math.pi)
end

function game:draw()  
  love.graphics.setColor(orange)
  love.graphics.circle("fill", gw * 0.9, gh * 0.1, 95, 64)
  
  love.graphics.setColor(lightorange)
  --love.graphics.rectangle("fill", gw * 0.3, gh * 0.2, 120, 35, 18)
  love.graphics.setFont(quicksandBold)
  love.graphics.printf("102", 0, gh * 0.2, gw, "center")
  --Big sphere
  love.graphics.setColor(0.2, 0.2, 0.2, 1)  
  love.graphics.circle("fill", gw * 0.5, gh * 0.9, gh * 0.33, 64)
  
  love.graphics.push()
    love.graphics.translate(gw * 0.5, gh * 0.9)
  	love.graphics.rotate(-angle)
    love.graphics.rectangle("fill", -30,0, 60, gh * 0.38)
  love.graphics.pop()
  
end

return game
