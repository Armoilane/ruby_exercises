DICTIONARY = %w(below,down,go,going,horn,how,howdy,it,i,low,own,part,partner,sit)

def substrings(str)

  clean_arr = str.downcase.split(/\s|\p{P}/).map { |w| 
    if w =~ /\p{P}/
      w.chop
    elsif w =~ /\w/
      w
    end
  }.compact

  matches = Hash.new(0)

  clean_arr.map { |word|  
    DICTIONARY.map { |dict| 
      matches[word] += 1 if dict[word]
    }
  }

  matches

end

p substrings("Howdy partner, sit down! How's it going?")
