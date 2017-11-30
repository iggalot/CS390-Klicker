class StudentInfo < ApplicationRecord
  belongs_to :room
  validates :name, presence: true
  has_many :responses, dependent: :destroy
  validates :roomcode, presence: true,
            length: {is: 4}, format: { with: /\A[a-zA-Z]+\z/}
            before_save :upcase_field
  validates_uniqueness_of :name, scope: :roomcode


def upcase_field
  self.roomcode.upcase!
end

end
