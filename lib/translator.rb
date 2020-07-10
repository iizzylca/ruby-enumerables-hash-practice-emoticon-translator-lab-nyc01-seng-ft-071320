require 'yaml'
require 'pry'

def load_library(path)
  library = YAML.load_file(file_path)
  update = {}

  emoticons.each do |key,value|
    new_hash[key] = {}
    new_hash[key][:english] = value[0]
    new_hash[key][:japanese] = value[1]
  end

  new_hash
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
