require 'sinatra'
require 'unirest'
require 'elasticsearch'

#TODO Externalize
es_config = {host: "10.64.28.104:9200"}

es = Elasticsearch::Client.new(es_config)
Unirest.timeout(20)

# Show welcome page
get "/" do

  # Get known cameras from Elasticsearch
  ts = Time.now.to_i
  @cameras = []
  response = es.search index: 'camera', q: '*', size: '100'
  response['hits']['hits'].each do |r|
    status = (ts - r['_source']['epoch_timestamp'].to_i < 120)
    @cameras << {:name => r['_source']['camera_name'], :ip => r['_id'], :online => status}
  end

  # Get 4 latest photos
  # FIXME, Doesnt return 4 latest yet
  @photos = []
  response = es.search index: 'photo', q: '*', size: '4'
  response['hits']['hits'].each do |r|
    @photos << {:url => r['_source']['url'], :camera_name => r['_source']['camera_name']}
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
