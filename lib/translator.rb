require 'yaml'
require 'pry'

def load_library(path)
  library = YAML.load_file(path)
  update = {}

  library.each do |names,values|
    update[names] = {}
    update[names][:english] = values[0]
    update[names][:japanese] = values[1]
    #binding.pry
  end
  update
  #binding.pry
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

def get_english_meaning(path, emoticon)
  library = load_library(path)
  library.each do |name, value|
  binding.pry
  end
end
