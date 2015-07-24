class CoinsController < ApplicationController

  # GET /coins
  # GET /coins.json
  def index
  end

  # GET /coins/1
  # GET /coins/1.json
  def show
    render 'show'
  end

  def buy
    puts 'buy path'
    render 'buy'
  end

end
