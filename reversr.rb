require 'rubygems'
require 'sinatra'
require 'sinatra/content_for'
require 'erb'
require 'json'

UPLOAD_FOLDER = 'public/media/audio'
ALLOWED_EXTENSIONS = ['wav', 'mp3']

def allowed_file(filename)
    filename.include?('.')  and ALLOWED_EXTENSIONS.include?(filename.split(/\./)[1])
end

get '/' do
	erb :home
end

post '/' do
  if params['audio_file']
    filename = params['audio_file'][:filename]
    if allowed_file(filename)
        tempfile = params['audio_file'][:tempfile]
        target = "#{UPLOAD_FOLDER}/#{filename}"
        File.open(target, 'wb') {|f| f.write tempfile.read }
        return {:filename => filename, :filepath => "/media/audio/#{filename}"}.to_json
    end
  end
  erb :home
end

get '/iknow' do
  erb :iknow
end