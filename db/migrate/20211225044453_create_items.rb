class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product       , null: false 
      t.text       :instruction   , null: false
      t.integer    :category_id   , null: false
      t.integer    :condition_id  , null: false
      t.integer    :postage_id    , null: false
      t.integer    :prefecture_id , null: false
      t.integer    :ship_period_id, null: false
      t.integer    :price         , null: false
      t.references :user          , null: false, foreign_key: true
      t.timestamps null: false
    end
  end
end
