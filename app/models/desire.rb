class Desire < Ownership
  def self.item_ids_ranking_desires
    self.group(:item_id).order('count_item_id DESC').limit(10).count(:item_id)
  end
end
