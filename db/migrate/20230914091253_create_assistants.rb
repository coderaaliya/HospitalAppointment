class CreateAssistants < ActiveRecord::Migration[7.0]
  def change
    create_table :assistants do |t|

      t.timestamps
    end
  end
end
