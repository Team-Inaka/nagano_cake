class Costomer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :shipping_addresses, dependent: :destroy
         has_many :carts, dependent: :destroy

          # costomerのis_withdrawがfalseならtrueを返す
          # def active_for_authentication?
          #     super && (self.is_withdraw == false)
          # end

          # # costomerのis_withdrawがfalseならtrueを返す
          # def active_for_authentication?
          #     super && (self.is_withdraw == false)
          # end

          def full_name
          	  return self.family_name + self.middle_name

          end

          def full_name_kana
          	  self.family_name_kana + self.middle_name_kana
          end


end
