class FiguresController < ApplicationController
  
  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures' do 
    @figures = Figure.all
    erb :'figures/index'
  end

  post '/figures' do
    @figure = Figure.create(params[:figure])
    @figure.titles << Title.create(params[:title])
    @figure.landmarks << Landmark.create(params[:landmark])
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end

  get '/figures/:id' do 
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do 
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/edit'
  end

  patch '/figures/:id' do 
    @figure = Figure.find_by_id(params[:id])
    @figure.update(params[:figure])
    @figure.landmarks << Landmark.find_or_create_by(params[:landmark])
    @figure.save
    redirect to "/figures/#{@figure.id}"
  end


end