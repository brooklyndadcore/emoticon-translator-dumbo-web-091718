require 'pry'
require 'yaml'
# path = YAML.load_file('./lib/emoticons.yml')

def load_library(emoticon_path)
  path = YAML.load_file('./lib/emoticons.yml')
  yammed_hash = {}
  mean_arr = []
  emot_arr = []
  path.each do |meaning, emots|
    mean_arr << {emots[1] => meaning}
    emot_arr << {emots[0] => emots[1]} 
  end
  mean = mean_arr.reduce Hash.new, :merge
  emot = emot_arr.reduce Hash.new, :merge
  yammed_hash['get_meaning'] = mean
  yammed_hash['get_emoticon'] = emot
  return yammed_hash
end

def get_japanese_emoticon(path, emoticon)
  ha_sh = load_library(path)
  ha_sh['get_emoticon'].each do |key, val| 
    if emoticon ==  key
      return val
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(path, emoticon)
  ha_sh = load_library(path)
  ha_sh['get_emoticon'].each do |key, val| 
    if emoticon ==  val
      return key
    end
  end
  return "Sorry, that emoticon was not found"
end