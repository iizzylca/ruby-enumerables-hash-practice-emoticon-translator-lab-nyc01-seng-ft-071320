require 'yaml'
require 'pry'

def load_library(path)
  library = YAML.load_file(path)
  #binding.pry
  emoticon_lib = {'get_meaning'  => {},
                    'get_emoticon' => {} }

  library.each do |meaning, values|  # meaning= "surprised"   # value= [":o", "o_O"]  <-(e,j)
    english = values[0]
    japanese = values[1]
    emoticon_lib['get_meaning'][japanese] = meaning
    emoticon_lib['get_emoticon'][english] = japanese
    #binding.pry
  end
  emoticon_lib
end

def get_japanese_emoticon(path, english_emoticon)
  library = load_library(path)


end

def get_english_meaning(path, japanese_emoticon)
  library = load_library(path)
  output = nil
  library['get_meaning'].each do |value, meaning |
    if value == japanese_emoticon
      output = meaning
      #binding.pry
    end
  end
  if output == nil
    return "Sorry, that emoticon was not found"
  else
    return output
  end
end
