class Category < ActiveRecord::Base
    validates_presence_of :description

    # scopes
    scope :order_by_description, -> { order(:description) }

end
