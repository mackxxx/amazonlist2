class RankingsController < ApplicationController
  def want
    @ranking_counts = Want.item_ids_ranking_wants
    @items = Item.find(@ranking_counts.keys)
  end
  
  def desire
    @ranking_counts = Desire.item_ids_ranking_desires
    @items = Item.find(@ranking_counts.keys)
  end
end
