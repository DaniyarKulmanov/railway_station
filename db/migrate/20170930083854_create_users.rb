class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name

      t.timestamps
    end
    add_belongs_to :tickets, :user
  end
end
