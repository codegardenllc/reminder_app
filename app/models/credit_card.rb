class CreditCard
  include ActiveModel::Model

  attr_accessor :name_on_card, :number, :month, :year, :cvv

  validates :name_on_card, presence: true
  validates :number, presence: true, length: { minimum: 15, maximum: 16 }
  validates :month, presence: true, inclusion: { in: (1..12).collect(&:to_s) }
  validates :year, presence: true, inclusion: { in: (Date.today.year..Date.today.year + 20).collect(&:to_s) }
  validates :cvv, presence: true, length: { is: 3 }

  def attributes=(attrs)
    attrs.each do |key,value|
      instance_variable_set("@#{key}", value)
    end
  end

  def save
    return false unless self.valid?
    return true
    # Add card
  end
end