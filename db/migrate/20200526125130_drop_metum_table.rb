class DropMetumTable < ActiveRecord::Migration[5.0]
  def up
    drop_table :meta
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
