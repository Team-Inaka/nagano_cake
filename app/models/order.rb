class Order < ApplicationRecord
    belongs_to :costomer, optional: true
    has_many :shipping_addresses, dependent: :destroy
    has_many :ordered_products, dependent: :destroy
    enum pay_method: { クレジットカード: 1, 銀行振り込み: 2 }
    enum order_status: { 入金待ち: 0, 入金確認: 1, 製作中: 2, 発送準備中: 3, 発送済み: 4 }

    
end
