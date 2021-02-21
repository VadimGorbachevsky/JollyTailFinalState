class CreateBuffers < ActiveRecord::Migration[5.2]
  def change
    create_table :buffers do |t|
      t.timestamps
    end
  end
end
