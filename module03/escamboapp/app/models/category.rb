class Category < ActiveRecord::Base
    # validates_presence_of :description
    validates :description, presence: true

    # scopes
    scope :order_by_description, -> { order(:description) }

end
