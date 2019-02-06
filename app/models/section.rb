class Section < ApplicationRecord

    #*** Relations ***
    belongs_to :page

    #*** scopes ***
    scope :visible           , lambda { where(:visible => true) }
    scope :sortedByPosition  , lambda { order(:position => :asc) }
    scope :sortedByName      , lambda { order(:name => :asc) }

    #*** validations ***
    validates :name    , :presence => true , :length   => {:within => 8..300} 
    validates :content , :presence => true
end
