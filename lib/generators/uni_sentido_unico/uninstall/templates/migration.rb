class UniSentidoUnicoUninstall < ActiveRecord::Migration
   def change
     drop_table :partner_institutions
     remove_column :courses, :partner_institution_id
  end
end