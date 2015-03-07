class RemoveCountryFieldFromAddressTable < ActiveRecord::Migration
  def change
    remove_column :addresses, :country
  end
end
