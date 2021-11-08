require 'json'
require 'open-uri'
class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10).join(' ')
  end

  def score
    @answer = params[:word]
  end

  def dictionary(word)
    # require 'json'
    # require 'open-uri'
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    word_serialized = URI.open(url).read
    word = JSON.parse(word_serialized)
    word[:found]
  end

  def score
    @answer = params[:word]
    @grid_letters = params[:letters]
    if dictionary(@answer)
     @answer.chars.all? { |letter| answer.count(letter) >= grid_letters.count }
    else
      @response = "Sorry, it's not an english word!"
    end
  end

  def dictionary(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    url_serialized = open(url).read
    json = JSON.parse(url_serialized)
    json[:found]
  end
end
