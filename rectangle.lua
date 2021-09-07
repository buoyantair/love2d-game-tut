Rectangle = Shape:extend()

function Rectangle:new(x, y, width, height)
  Rectangle.super.new(self, x, y)
  self.width = width
  self.height = height
end


function Rectangle:draw(mode)
  if mode == nil then
    mode = "line"
  end
  love.graphics.rectangle(mode, self.x, self.y, self.width, self.height)
end

