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
  
  emo_file.each do |eng, jap|
    if emoticon = eng 
        return jap
  else 
    return sorry_message
  end 
end



# describe "#get_english_meaning" do

#   it "accepts two arguments, the YAML file path and the emoticon" do
#     expect { get_english_meaning("./lib/emoticons.yml", "(Ｔ▽Ｔ)") }.to_not raise_error
#   end

#   it "calls on #load_library and gives it the argument of the file path" do
#     emoticon_hash = load_library("./lib/emoticons.yml")

#     file_path = "./lib/emoticons.yml"
#     expect(self).to receive(:load_library).with(file_path).and_return(emoticon_hash)
#     answer = get_english_meaning("./lib/emoticons.yml", "=D")
#   end

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




# def get_english_meaning
#   # code goes here
# end