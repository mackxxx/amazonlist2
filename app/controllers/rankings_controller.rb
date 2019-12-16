class RankingsController < ApplicationController
  def want
    @ranking_counts = Want.ranking
    @items = Item.find(@ranking_counts.keys)
  end
  
  def desire
    @ranking_counts = Desire.ranking
    @items = Item.find(@ranking_counts.keys)
  end
end
