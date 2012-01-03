class UniSentidoUnicoInstall < ActiveRecord::Migration
   def change
     create_table :partner_institutions do |t|
       t.string :name
       t.string :phone
       t.string :email
       t.string :website
       t.string :address
       t.string :district
       t.string :zipcode
       t.string :city
       t.string :state
       
       t.timestamps
     end
     
     add_column :courses, :partner_institution_id, :integer
     
     create_table :course_contracts do |t|
       t.string :name
       t.string :slug
       
       t.timestamps
     end
     
     add_column :courses, :course_contract_id, :integer

     create_table :payments do |t|
       t.date :due_date
       t.decimal :amount
       t.references :curriculum_student

       t.timestamps
     end
  end
end
