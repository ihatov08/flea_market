class AddImagesToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :images, :json
  end
end
