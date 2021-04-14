function love.load()
   keydistance = 33
   printx = 0
   printy = 0
   note0 = love.audio.newSource("sounds/samples/F#1v16.flac", "static")
   note1 = love.audio.newSource("sounds/samples/F#2v16.flac", "static")
   note2 = love.audio.newSource("sounds/samples/F#3v16.flac", "static")
   note3 = love.audio.newSource("sounds/samples/F#4v16.flac", "static")
   image = love.graphics.newImage('sprites/piano.jpg')
end

function love.draw()
   love.graphics.draw(image, image.x, image.y)
   love.graphics.print("", printx, printy)
end

function stopAllSounds()
    note0:stop()
end

function playNote(note, i, x, pitch)
  if x >= i*keydistance and x <= (i+1)*keydistance then
    note:setPitch(pitch)
    note:play()
  end
end

function love.mousepressed(x, y, button, istouch)
   if button == 1 or istouch then
      printx = x
      printy = y
      local pitch = 1
      
      if (y >= 121 and y <= 349) then
        stopAllSounds()
     
        if x >= 0 and x <= keydistance then
          note0:setPitch(1)
          note0:play()
        end
        
        for index = 1,26,1
        do
            pitch = pitch + 0.2
            playNote(note0, index, x, pitch)
        end
        
      end
      print("x,y:", printx, printy)
   end
end