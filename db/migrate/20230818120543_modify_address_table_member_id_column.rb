class ModifyAddressTableMemberIdColumn < ActiveRecord::Migration[6.1]
  def change
    remove_column :addresses, :member_id_id, :integer, null: false
    add_column :addresses, :member_id, :integer, null: false
  end
end
