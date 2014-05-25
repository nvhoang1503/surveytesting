class AddIsOtherToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :is_other, :boolean, :default => false
  end
end
