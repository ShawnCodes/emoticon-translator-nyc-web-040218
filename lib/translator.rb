require "yaml"


def load_library(path)
  # code goes here
  get_meaning = {}
  get_emoticon = {}
  emoticons = YAML.load_file(path)
  emoticons.each do |emoticon|
    meaning = emoticon.first
    english = emoticon.last.first
    japanese = emoticon.last.last

    get_meaning[japanese] = meaning
    get_emoticon[english] = japanese
  end
  {"get_emoticon" => get_emoticon, "get_meaning" => get_meaning}
end


def get_japanese_emoticon(path, emoticon)
  # code goes here
  hash = load_library(path)
  if hash.values.first[emoticon]
    hash.values.first[emoticon]
  else
    "Sorry, that emoticon was not found"
end
end

def get_english_meaning(path, emoticon)
  # code goes here
  hash = load_library(path)
  if hash.values.last[emoticon]
    hash.values.last[emoticon]
  else
    "Sorry, that emoticon was not found"
  end
  end
