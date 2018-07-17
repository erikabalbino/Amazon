class Tag < ApplicationRecord
    validates :name, presence: true, unqueness: true

    before_validation :downcase_name

    

    private
    def downcase_name
        self.name&.downcase!
    end

end
