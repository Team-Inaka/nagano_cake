class Costomer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :shipping_addresses, dependent: :destroy

          # costomerのis_withdrawがfalseならtrueを返す
          def active_for_authentication?
              super && (self.is_withdraw == false)
          end
end
