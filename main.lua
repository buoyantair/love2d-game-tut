require "example"
io.stdout:setvbuf("no")

fruits = {"apple", "banana"}
table.insert(fruits, "pear")

local listOfRectangles = {}

function love.load()
  tick = require "tick"
  x = 100
  velocity = 100
  
  drawRectangle = false
  
  tick.delay(function() drawRectangle = true end, 2)
end

function love.keypressed(key)
    -- Remember, 2 equal signs (==) for comparing!
    if key == "space" then
        createRect()
    end
end

function love.update(dt)
  if love.keyboard.isDown("left") then
    x = x - 100 * dt
  else
    x = x + velocity * dt
  end
  
  for i, v in ipairs(listOfRectangles) do
    v.x = v.x + v.speed * dt
  end
  
  tick.update(dt)

end

function love.draw()
  love.graphics.rectangle("line", x, 50, 200, 150)
  
  for i, v in ipairs(listOfRectangles) do
    love.graphics.rectangle("line", v.x, v.y, v.width, v.height)
  end
  
  
  for i, frt in ipairs(fruits) do
    love.graphics.print(fruits, 100, 100 + 50 * i)
  end
  
  if drawRectangle then
    love.graphics.rectangle("fill", 100, 100, 300, 200)
  end
end

function love.quit()
  print("Thanks for playing! Come back soon!")
end

print(test)


function createRect()
  rect = {}
  rect.x = 100
  rect.y = 100
  rect.width = 70
  rect.height = 90
  rect.speed = 100
  
  table.insert(listOfRectangles, rect)
end
