require 'json'
require 'mtg_sdk'
require 'sinatra'

set = '3ED'

cards = MTG::Card.where(set: '3ED').all
card_image_urls = cards.map{|card| card.image_url}

get '/api/cards/all' do
  return JSON.dump card_image_urls
end

get '/api/cards/hand' do
  hand = card_image_urls.sample 7
  return JSON.dump hand
end

get '/ui/viewer/hand' do
  @hand = card_image_urls.sample 7
  erb :index
end
