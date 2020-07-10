require 'yaml'
require 'pry'

def load_library(path)
  emoticons = YAML.load_file(path)
  new_emoticon = {'strip_meaning' => {}, 'strip_value' => {} }

  emoticons.each do |meaning , value|
    english_value = value[0]
    japanese_value = value[1]
    binding.pry
    new_emoticon['strip_meaning'][japanese_value] = meaning
    mew_emoticon['string_value'][english] = japanese

  end


  end



def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end
