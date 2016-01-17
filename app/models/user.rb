class User < ActiveRecord::Base
	has_many :orders

	def fullname
		self.name + " " + self.lastname
	end

	class << self

		def get_all_promos
  			promos = self.connection.select_all("select distinct promo from users")	
		end

		def from_OAuth2(hash)
			user = find_or_create_by(uid: hash['uid'])
			user.name = hash['name']
			user.lastname = hash['lastname']
			user.email = hash['email']
			user.promo = hash['promo']
			if user.solde.nil?
				user.solde = 0.0
			end
			if user.admin.nil?
				user.admin = false
			end
			user.save!
			user
		end

	end
end
