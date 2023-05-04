# == Schema Information
#
# Table name: actors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Actor < ApplicationRecord
  
  has_many :characters
  
  #def characters
   # key = self.id

    #the_many = Character.where({ :actor_id => key })

    #return the_many
  #end

  
  # filmography is many to many, so has_many won't work in the traditional way.

  has_many :characters
  has_many(:filmography, { :through => "characters", :source => "movie"})
  # this only works because we defined characters on the step before

  def filmography
    the_many = Array.new

    self.characters.each do |joining_record|
      destination_record = joining_record.movie

      the_many.push(destination_record)
    end

    return the_many
  end

end
