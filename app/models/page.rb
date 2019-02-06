class Page < ApplicationRecord

    #*** Relations ***
    belongs_to :book
    has_many   :sections

    #*** scopes ***
    scope :visible           , lambda { where(:visible => true) }
    scope :sortedByPosition  , lambda { order(:position => :asc) }
    scope :sortedByTitle     , lambda { order(:title => :asc) }

    #*** validations ***
    validates :title ,:presence => true , :length   => {:within => 8..300} 

end
