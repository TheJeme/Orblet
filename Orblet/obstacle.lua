obstacle = {}

local angle
angleSpeed = 1.0
local canGetPoint

function obstacle:getAngle()
  return angle
end

function obstacle:getCanGetPoint()
  return canGetPoint
end

function obstacle:setCanGetPoint(val)
  canGetPoint = val
end

function obstacle:resetAngle()
  angle = 0
end

function obstacle:load()
  obstacle:setCanGetPoint(true)
  obstacle:resetAngle()
end

function obstacle:update(dt)
  angle = angle + dt * angleSpeed * math.pi/2
  angle = angle % (2*math.pi)
  if (angle >= 0 and angle <= 1) then
    obstacle:setCanGetPoint(true)
    angleSpeed = love.math.random(1000, 1600) / 1000
  end
end

function obstacle:draw()
  love.graphics.push()
    love.graphics.translate(gw * 0.5, gh * 0.9)
    love.graphics.rotate(-angle)
    love.graphics.rectangle("fill", -30,0, 60, gh * 0.38)
  love.graphics.pop()
end

return obstacle
