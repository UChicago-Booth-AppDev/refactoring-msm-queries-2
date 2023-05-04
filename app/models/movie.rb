# == Schema Information
#
# Table name: movies
#
#  id          :integer          not null, primary key
#  description :text
#  duration    :integer
#  image       :string
#  title       :string
#  year        :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  director_id :integer
#
class Movie < ApplicationRecord
  
  # belongs_to(:director, {:foreign_key => "director_id", :class_name => :Director})

  belongs_to :director 

  # this works if the the names are the same.
  
  #def director
   # key = self.director_id

    #matching_set = Director.where({ :id => key })

    #the_one = matching_set.at(0)

    #return the_one
  #end

  

  has_many(:characters, {:foreign_key => "movie_id", :class_name => "Character"})

  #def characters
  

    
  
  #end

end
