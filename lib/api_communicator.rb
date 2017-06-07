require 'rest-client'
require 'json'
require 'pry'

#films
# http://www.swapi.co/api/films/2/
# http://www.swapi.co/api/films/6/
# http://www.swapi.co/api/films/3/
# http://www.swapi.co/api/films/1/
# http://www.swapi.co/api/films/7/

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  film_urls = []
  character_hash["results"].select do |character_info|
    if character_info["name"].downcase == character.downcase
      film_urls << character_info["films"]
    end
  end
  film_urls.flatten!
  films_data = film_urls.map do |film_url|
    JSON.parse(RestClient.get(film_url))
  end
  return films_data
end



def parse_character_movies(films_array)
  puts "Here are the titles of your character"
  films_array.each_with_index do |film, index|
    puts "#{index+1}. #{film["title"]}"
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
