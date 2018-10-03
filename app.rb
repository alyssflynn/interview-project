require 'rubygems'
require 'bundler/setup'
require 'sinatra'
require 'json'
require 'httparty'
require 'nokogiri'

set :bind, '0.0.0.0'
set :port, '8080'

get '/' do
  output = "Hello world! Version 3. Now with test-suite! </br>"
  env_string = JSON.pretty_generate(ENV.to_a).gsub!("\n",'</br>')
  output += "Environment: </br> #{env_string} </br>"
  output
end

get '/section/:section_number' do
  response = HTTParty.get('https://www.osha.gov/Publications/OSHA3514.html')
  @doc = Nokogiri::HTML(response)
  sections = @doc.css('div.well.well-small.well-white')
  index = params[:section_number].to_i - 1
  output = "#{sections[index]}"
  output
end

get '/hello' do
  "Hello World"
end