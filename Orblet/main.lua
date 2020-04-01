globals = require 'globals'
colors = require 'colors'
beloved = require 'beloved'
game = require 'states/game'
menu = require 'states/menu'
gamemanager = require 'gamemanager'

quicksandRegular = love.graphics.newFont('fonts/Quicksand-Regular.ttf', 72)
quicksandRegularSmall = love.graphics.newFont('fonts/Quicksand-Regular.ttf', 42)
quicksandBold = love.graphics.newFont('fonts/Quicksand-Bold.ttf', 96)

local gameplay

function love.load()
  love.graphics.setBackgroundColor(red)
  game:load()
  menu:load()
  beloved:load()
end

function love.update(dt)
  game:update(dt)
end

function love.draw()  
  if (state == "game") then
    game:draw()
  elseif (state == "menu") then
    menu:draw()
  end
  beloved:draw()
end
  
  function love.mousepressed(x, y, button)
    menu:mousepressed(x, y, button)
    game:mousepressed(x, y, button)
    beloved:mousepressed(x, y, button)
  end
  
  function love.mousereleased(x, y, button)
    beloved:mousereleased(x, y, button)
  end
  
  function love.keypressed(key)
    beloved:keypressed(key)
    if key == 'escape' then
      love.event.quit()
    end
    if key == 'w' then
      state = 'menu'
    end
end
