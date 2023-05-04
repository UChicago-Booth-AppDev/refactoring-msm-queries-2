# == Schema Information
#
# Table name: directors
#
#  id         :integer          not null, primary key
#  bio        :text
#  dob        :date
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Director < ApplicationRecord
  
  # DIRECTOR TO MOVIE

  # One director can write many movies, but a movie has only one director (usually)

  # Therefore, this is a 1-to-many relationship, and we have to use the has_many() function.

  # Since the method's name (filmography) is not the same as the table's name (movie), we can't use the abbreviated version of the function.

  has_many(:filmography, { :foreign_key => "director_id", :class_name => "Movie"})

  # This code does the same as this code below:
  
  #def filmography
   # key = self.id

    #the_many = Movie.where({ :director_id => key })

    #return the_many
  #end
end
