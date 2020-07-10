require 'yaml'
require 'pry'

def load_library(path)
  update = {'get_meaning'=> {}, 'get_emoticon' => {} }
  library = YAML.load_file(path)
  library.each do |names, values|  # meaning= "surprised"   # value= [":o", "o_O"]  <-(e,j)
    update['get_meaning'][values[1]] = meaning
    update['get_emoticon'][values[0]] = values[1]
    #binding.pry
  end
  update
end

def get_japanese_emoticon(path, english_emoticon)
  library = load_library(path)
  update = nil
  library['get_emoticon'].each do |english, japanese|
    if english == english_emoticon
      update = japanese
    end
  end
  if update == nil
    return "Sorry, that emoticon was not found"
  else
    return update
  end
end

def get_english_meaning(path, japanese_emoticon)
  library = load_library(path)
  update = nil
  library['get_meaning'].each do |value, meaning |
    if value == japanese_emoticon
      update = meaning
    end
  end
  if update == nil
    return "Sorry, that emoticon was not found"
  else
    return update
  end
end
