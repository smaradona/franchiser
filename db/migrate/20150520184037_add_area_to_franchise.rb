class AddAreaToFranchise < ActiveRecord::Migration
  def change
    add_column :franchises, :area, :string
  end
end
