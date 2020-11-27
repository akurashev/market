require 'csv'

class ItemsController < ApplicationController
  def index
    @items = Item.order(:id)
    @total_sold = Item.sum('sold * price')
  end

  def sell
    Item.find(params[:id]).increment!(:sold)

    redirect_to root_path
  end

  def undo
    Item.find(params[:id]).decrement!(:sold)

    redirect_to root_path
  end

  def new
  end

  def create
    return if params[:file].blank?

    Item.destroy_all

    file = File.read(params[:file])
    csv = CSV.parse(file, headers: true)
    csv.each do |row|
      name = row[0].to_s.strip
      price = row[2].to_s.gsub(/\D/, '').to_i
      qty = row[3].to_s.strip.to_i

      next if name.blank?

      Item.create(name: name, price: price, qty: qty)
    end

    redirect_to root_path
  end
end
