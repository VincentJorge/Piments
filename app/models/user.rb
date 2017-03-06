class User < ApplicationRecord
  require 'csv'
  def self.import(file, id)
    CSV.foreach(file.path, headers: true, col_sep: ";") do |row|

      product_hash = row.to_hash # exclude the price field
      user = User.where(email: product_hash["email"])
      if user.count != 1
        user.create("email" => row[0], "promotion" => id, "role" => "student")
      else
        User.create!(product_hash)
      end # end if !product.nil?
    end # end CSV.foreach
  end # end self.import(file)
end
