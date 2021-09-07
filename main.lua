require "example"
io.stdout:setvbuf("no")


function love.load()
  tick = require "tick"
  Object = require "classic"
  checkCollision = require "collision"
  require "shape"
  require "rectangle"
  require "circle"
  
  r1 = Rectangle(10, 100, 100, 100)
  r2 = Rectangle(30, 120, 150, 120)
  c1 = Circle(100, 150, 40)
  
  x = 100
  velocity = 100
  
  drawRectangle = false
  
  myImage = love.graphics.newImage("sheep.png")
  width = myImage:getWidth()
  height = myImage:getHeight()
  
  tick.delay(function() drawRectangle = true end, 2)
  love.graphics.setBackgroundColor(1, 1, 1)
end

--[[
function love.keypressed(key)
    -- Remember, 2 equal signs (==) for comparing!
    if key == "space" then
        createRect()
    end
end
]]--

function love.update(dt)
  if love.keyboard.isDown("left") then
    x = x - 100 * dt
  else
    x = x + velocity * dt
  end
  
  tick.update(dt)
  r1:update(dt)
  r2:update(dt)
  c1:update(dt)
end

function love.draw()
  
  if drawRectangle then
    love.graphics.rectangle("fill", x, 100, 300, 200)
  end
  
  local mode
  if checkCollision(r1, r2) then
    mode = "fill"
  else 
    mode = "line"
  end
  
  r1:draw(mode)
  r2:draw(mode)
  c1:draw()
  
  love.graphics.draw(myImage, 100, 100, 0, 2, 2, width/2, height/2)
  love.graphics.setColor(1, 0, 0)
end

function love.quit()
  print("Thanks for playing! Come back soon!")
end

print(test)
