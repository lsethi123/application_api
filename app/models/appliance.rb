class Appliance < ActiveRecord::Base
  has_many :targets, dependent: :destroy

  validates :name,     uniqueness: true,
                       presence:   true

  validates :customer, presence:   true

  def update_appliance_targets
    self.targets.each do |target|
      target.check_and_update_status
    end
  end

end
