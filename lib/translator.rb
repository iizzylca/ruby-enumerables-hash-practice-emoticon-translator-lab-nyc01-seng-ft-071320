require 'yaml'
require 'pry'

def load_library(path)
  update = {'get_name'=> {}, 'get_emoticon' => {} }
  library = YAML.load_file(path)
  library.each do |names, values|
    update['get_name'][values[1]] = names
    update['get_emoticon'][values[0]] = values[1]
    #binding.pry
  end
  update
end

def get_japanese_emoticon(path, english_emoticon)
  library = load_library(path)
  update = nil
  library['get_emoticon'].each do |english, japanese|
  #binding.pry
    if english_emoticon == english
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
  library['get_name'].each do |value, name|
  #binding.pry
    if value == japanese_emoticon
      update = name
    end
  end
  if update == nil
    return "Sorry, that emoticon was not found"
  else
    return update
  end
end
