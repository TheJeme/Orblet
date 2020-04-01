player = {}
  
function player:load()
  physicsWorld = love.physics.newWorld(0, 9.81 * 124, true)
  local floor = {}
  floor.body = love.physics.newBody(physicsWorld, gw * 0.5, gh * 0.58)
  floor.shape = love.physics.newRectangleShape(love.graphics.getWidth(), 10)
  floor.fixture = love.physics.newFixture(floor.body, floor.shape, 1)
  
  local self = self or {}
  self.x = gw * 0.5
  self.y = gh * 0.534
  self.radius = gh * 0.04
  self.physicsWorld = physicsWorld

  self.physics = {}
  self.physics.world = physicsWorld
  self.physics.body = love.physics.newBody(self.physics.world, self.x, self.y, "dynamic")
  self.physics.shape = love.physics.newCircleShape(self.radius)
  self.physics.fixture = love.physics.newFixture(self.physics.body, self.physics.shape, 1)
end

function player:update(dt)
  physicsWorld:update(dt)
end

function player:draw()
  love.graphics.setColor(darkblue)
  love.graphics.circle("fill", self.physics.body:getX(), self.physics.body:getY(), self.radius, 64)
end

function player:mousepressed(x, y, button)
  if(button == 1) then
    self.physics.body:applyLinearImpulse(0,-1300)
  end
end

return player
