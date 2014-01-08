class CreateAffinityGroups < ActiveRecord::Migration
  def change
    create_table :affinity_groups do |t|
      t.boolean :enabled
      t.string  :name
      t.string  :scope
      t.string  :button
      t.text    :groups

      t.timestamps
    end
  end
end
