#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, { adapter: "sqlite3", database: "pizzashop.db" }

class Product < ActiveRecord::Base

end

get '/' do
  @products = Product.all

  erb :index
end

get '/about' do
  erb :about
end

post '/cart' do
  order = params[:orders]
  @items = parse_orders_line order

  @items.each do |item|
    item[0] = Product.find(item[0])
  end

  erb :cart
end

def parse_orders_line orders_line
  arr = []

  s1 = orders_line.split(',')

  s1.each do |x|
    s2 = x.split('=').map(&:strip)
    s3 = s2[0].split('_')

    id = s3[1]
    cnt = s3

    arr2 = [id, cnt]

    arr.push arr2
  end

  return arr
end
