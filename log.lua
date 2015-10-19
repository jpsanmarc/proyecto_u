require("x_functions") 

LogArch = io.open('SuperMarioBros_log.txt','w') 
LogArch:close()
Input = io.open("input_nes.txt","r")
largo = "ok"
b_1 = string.byte("1")
FCEU.frameadvance() 

repeat 
  LogArch = io.open('SuperMarioBros_log.txt','a') 
  joyput = Input:read()
  pulsar = {}
  frame = FCEU.framecount()

  if (joyput == nil) then largo = "null" 
    else 
      if (string.byte(joyput, 1) == b_1) then pulsar.left=1 end
      if (string.byte(joyput, 3) == b_1) then pulsar.right=1  end
      if (string.byte(joyput, 5) == b_1) then pulsar.up=1 end
      if (string.byte(joyput, 7) == b_1) then pulsar.down=1 end
      if (string.byte(joyput, 9) == b_1) then pulsar.A=1 end
      if (string.byte(joyput, 11) == b_1) then pulsar.B=1  end
      if (string.byte(joyput, 13) == b_1) then pulsar.start=1  end
      if (string.byte(joyput, 15) == b_1) then pulsar.select=1  end
    
  joypad.set(1,pulsar)
  end

  marioypos = memory.readbyte(0x4AD) 
  speedX = memory.readbytesigned(0x0057) 
  speedy = memory.readbytesigned(0x009F)
  marioxpos = memory.readbyte(0x4AC)
  vidas = memory.readbyte(0x075a)+1
  if (vidas==256) then vidas = 0 end

  Linea_frame = string.format('%d:%d:%d:%d:%d:%s\n', frame, marioxpos, marioypos, speedX, vidas, largo) 

  LogArch:write(Linea_frame)  
  LogArch:close()
  FCEU.frameadvance() 
until (vidas == 0)
terminado = io.open("null.txt","w")
terminado:close()
Input:close()
