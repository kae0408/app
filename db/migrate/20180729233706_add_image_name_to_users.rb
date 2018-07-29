class AddImageNameToUsers < ActiveRecord::Migration[5.1]
  def change
    #カラムを追加
    create_table :post do |t|
      t.text :content
      
      t.timestamps
    end
  end
end
