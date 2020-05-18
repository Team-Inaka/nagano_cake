class Order < ApplicationRecord
    enum pay_method: { クレジットカード: 1, 銀行振り込み: 2 }
    enum deliver: { ご自身の住所: 1, 登録済住所から選択: 2, 新しいお届け先: 3 }
end
