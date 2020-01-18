dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings ( str, dictionary )

  # in_arr = str.downcase.split(/\s|\p{P}/)
  clean_arr = str.downcase.split(/\s|\p{P}/).map { |w| 
    if w =~ /\p{P}/
      w.chop
    elsif w =~ /\w/
      w
    end
  }.compact

  matches = Hash.new(0)
# 
#  dictionary.map { |dict| 
#    clean_arr.map { |word| 
#      matches[word] += 1 if dict[word]
#    }
#  }
#  

  clean_arr.map { |word|  
    dictionary.map { |dict| 
      matches[word] += 1 if dict[word]
    }
  }
  
  #invite_group = Hash.new(0)
  #invites.each { |invite| invite_group[invite] += 1 }


  p matches

end

substrings("Howdy partner, sit down! How's it going?", dictionary)
