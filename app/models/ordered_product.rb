class OrderedProduct < ApplicationRecord
    enum production_status: { 着手不可: 0, 制作待ち: 1, 製作中: 2, 制作完了: 3 }
    
    belongs_to :order, optional: true
    belongs_to :product
end
