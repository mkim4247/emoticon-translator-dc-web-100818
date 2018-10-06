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


#   it "returns the English meaning of the Japanese emoticon (＾ｖ＾)" do
#     expect(get_english_meaning("./lib/emoticons.yml", "(＾ｖ＾)")).to eq("happy")
#   end

#   it "returns the English meaning of the Japanese emoticon (￣ー￣)" do
#     expect(get_english_meaning("./lib/emoticons.yml", "(￣ー￣)")).to eq("grinning")
#   end

#   it "returns the English meaning of the Japanese emoticon (Ｔ▽Ｔ)" do
#     expect(get_english_meaning("./lib/emoticons.yml", "(Ｔ▽Ｔ)")).to eq("sad")
#   end

#   it "returns an apology message if the argument is not a known emoticon" do
#     sorry_message = "Sorry, that emoticon was not found"
#     expect(get_english_meaning("./lib/emoticons.yml", "$#$%{}*")).to eq(sorry_message)
#   end

# end




