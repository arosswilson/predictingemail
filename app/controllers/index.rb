require_relative '../models/user'
get '/' do
  erb :index
end

post '/emailprediction' do
  @predict_hash = { name: params['user']['name'], url: params['user']['url'] }
  pattern_array = User.find_patterns(params['user']['url']).uniq
  collect_predicted_emails(pattern_array, @predict_hash)
  erb :emailprediction
end
