class RankingsController < ApplicationController
  def want
    @ranking_counts = Want.ranking
    @items = Item.where(id: @ranking_counts.keys)
  end
  
  def desire
    @ranking_counts = Desire.ranking
    @items = Item.where(id: @ranking_counts.keys)
  end
end
