class Service < ActiveRecord::Base
	has_many :suscriptions, dependent: :destroy
end
