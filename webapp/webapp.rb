require 'sinatra'
require 'unirest'
require 'elasticsearch'
require 'date'

es_config = {host: "10.64.28.104:9200"}

es = Elasticsearch::Client.new(es_config)
Unirest.timeout(20)

# Show welcome page
get "/" do

  # Get known raspberries/endpoints from Elasticsearch
  @cameras = []
  response = es.search index: 'camera', q: '*', size: '100'
  response['hits']['hits'].each do |r|
    @cameras << {:name => r['_source']['camera_name'], :ip => r['_id']}
  end

  haml :index
end

# Show take photo page
get "/take_photo/:camera_ip" do
  camera_ip = params[:camera_ip]
  response = Unirest.post "http://#{camera_ip}:8080/take_photo"
  @image_url = response.body['url'].to_s
  @timestamp = response.body['timestamp'].to_s

  haml :show_photo
end
