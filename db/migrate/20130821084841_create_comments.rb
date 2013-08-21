class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commenter
      t.text :body
      t.references :post, index: true   # DATABASE'E  index ekliyor karmasa olmamasi icin

      t.timestamps
    end
  end
end
