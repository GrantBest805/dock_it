class AddSendToToMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :send_to, :string
  end
end
