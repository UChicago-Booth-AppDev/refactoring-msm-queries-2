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
  
  # ACTOR TO CHARACHTER
  
  # Once actor can play many characters, but a character can be played by only one actor, so this is a 1-to-many relationship

  # Therefore, we have to use the has_many() method

  # has_many(:characters, {:foreign_key => "actor_id", :class_name => "Character"})

  # Since the names are all the same, we can use the abbreviated version:
  
  has_many(:characters)
  
  # Remember that both codes are the same as:

  #def characters
   # key = self.id

    #the_many = Character.where({ :actor_id => key })

    #return the_many
  #end
  

  # ACTOR TO MOVIES (AND CHARACTERS)

  # One actor can be in multiple movies, and a movie has severall actors.

  # Therefore, filmography is a special case, because it is a many to many, so has_many() won't work in the traditional way.

  # We first have to define the characters played by the actor

  has_many :characters

  # or (depending on the names)

  # has_many(:characters, { {:foreign_key => "actor_id", :class_name => "Actor"}})

  # and then we define the movie

  has_many(:filmography, { :through => "characters", :source => "movie"})
  
  # this only works because we defined characters on the step before

  # the abbreviated code is the same as the code below:

  #def filmography
   # the_many = Array.new

    #self.characters.each do |joining_record|
     # destination_record = joining_record.movie

      #the_many.push(destination_record)
    #end

    #return the_many
  #end

end
