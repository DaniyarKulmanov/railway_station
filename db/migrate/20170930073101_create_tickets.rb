class CreateTickets < ActiveRecord::Migration[5.1]
  def change
    create_table :tickets do |t|

      t.timestamps
    end
  end

  def change
    add_column :trains, :ticket_id, :integer
  end
end
