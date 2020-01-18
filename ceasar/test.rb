class Caesar

  attr_reader :text, :rotation

  def initialize ( text, rotation )
    @text = text
    @rotation = rotation
  end


  def shift ( byte, a_byte, z_byte )
    @rotation -= 26 while @rotation > 26
    byte = byte + @rotation
    return ( a_byte - ( z_byte - byte ) - 1 ).chr if byte > z_byte
    byte.chr
  end

  def unshift ( byte, a_byte, z_byte )
    @rotation -= 26 while @rotation > 26
    byte = byte - @rotation
    return ( z_byte - ( a_byte - byte ) + 1 ).chr if byte < a_byte 
    byte.chr
  end

  def cipher
    text.bytes.map do | byte |
      case byte
        when 65..90 then shift( byte, 65, 90 )
        when 97..122 then shift( byte, 97, 122 )
        else byte.chr
      end
    end.join()
  end

  def decipher
    text.bytes.map do | byte |
      case byte
        when 65..90 then unshift( byte, 65, 90 )
        when 97..122 then unshift( byte, 97, 122 )
        else byte.chr
      end
    end.join() 
  end
end

p Caesar.new('Abcd efg!', 74 ).cipher
p Caesar.new('Abcd efg!', 74 ).decipher
