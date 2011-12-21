class UniSentidoUnicoUninstall < ActiveRecord::Migration
   def change
     drop_table :partner_institutions
     remove_column :courses, :partner_institution_id
     
     drop_table :course_contracts
     remove_column :courses, :course_contract_id
  end
end