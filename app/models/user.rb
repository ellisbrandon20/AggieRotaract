require 'csv'
class User < ApplicationRecord
    def self.to_csv
        CSV.generate(headers: true) do |csv|
            csv << %w{ name phone email address classification major shirt gender officer active points} 
            all.each do |user|
                points = Point.where(UIN: user.UIN).sum(:points)
                csv << [ user.name, user.phone, user.email, user.address, user.classification, user.major, user.shirt, user.gender, user.officer, user.active, points]
            end
        end
    end
end