class AddStatusToTargets < ActiveRecord::Migration
  def change
    add_column :targets, :status, :integer, default:0
  end
end
