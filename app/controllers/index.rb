require 'pry'
require_relative '../models/user'
get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/emailprediction' do
  @emailprediction_hash = Hash.new
  @emailprediction_hash[:patterns] = []
  @emailprediction_hash[:name] = params['user']['name']
  @emailprediction_hash[:company_url] = params['user']['company_url']
  pattern_array = User.find_patterns(params['user']['company_url']).uniq
  @emailprediction_hash[:single_pattern] = true if pattern_array[0] != nil && pattern_array.length == 1
  pattern_array.each do |pattern|
    @emailprediction_hash[:patterns] << create_predicted_email(pattern, params['user']['name'], params['user']['company_url'])
  end
  erb :emailprediction



end
