class StatisticsController < ApplicationController

  # GET /statistics
  # GET /statistics.json
  def index
    @statistics = Statistic.all
    @leaders = Statistic.fin
  end

  # GET /statistics/1
  # GET /statistics/1.json
  def show
  end
  

end
