player = {}

function player:load()
  
end

function player:update(dt)

end

function player:draw()
  love.graphics.setColor(darkblue)
  love.graphics.circle("fill", gw * 0.5, gh * 0.534, gh * 0.04, 64)
end

return player
