class ChangeAreaFormatFromFranchise < ActiveRecord::Migration
  def change
  	change_column :franchises, :area, :text
  end
end
