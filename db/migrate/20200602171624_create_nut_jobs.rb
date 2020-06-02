class CreateNutJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :nut_jobs do |t|
      t.string :password_digest
      t.string :email
      t.string :password
      t.integer :crazy

      t.timestamps
    end
  end
end
