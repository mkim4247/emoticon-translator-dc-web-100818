# require modules here
require "yaml"

def load_library(file_path)
  emoticons = YAML.load_file(file_path)

  translator = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  japanese_emoticons = []
  english_emoticons = []
  meaning = []
  
  emoticons.each do |key, array|
    japanese_emoticons << array[1]
    english_emoticons << array[0]
    meaning << key 
  end 
  
  i = 0 
  while i < meaning.length 
    translator["get_meaning"][japanese_emoticons[i]] = meaning[i]
    translator["get_emoticon"][english_emoticons[i]] = japanese_emoticons[i]
    i += 1 
    end 

  translator

end

def get_japanese_emoticon(file_path, emoticon)
  emo_file = load_library(file_path)["get_emoticon"]
  sorry_message = "Sorry, that emoticon was not found"
  
  if emo_file.has_key?(emoticon)
    emo_file.fetch_values(emoticon).join
  else 
    return sorry_message
  end 
end

def get_english_meaning(file_path, emoticon)
  emo_file = load_library(file_path)["get_meaning"]
  sorry_message = "Sorry, that emoticon was not found"
  
  if emo_file.has_key?(emoticon)
    emo_file.fetch_values(emoticon).join
  else 
    return sorry_message
  end 
end
