class CreateAffinitySubgroups < ActiveRecord::Migration
  def change
    create_table :affinity_subgroups do |t|
      t.string     :name
      t.references :affinity_group

      t.timestamps
    end
    add_index :affinity_subgroups, :affinity_group_id
  end
end
