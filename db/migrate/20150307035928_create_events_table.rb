class CreateEventsTable < ActiveRecord::Migration
  def change
    create_table :events_tables do |t|
      t.text :research
      t.text :key_findings
      t.text :takeaways
      t.text :outcome
      t.boolean :thankyou_note, :default => false
      t.boolean :follow_up, :default => false
      t.boolean :referral, :default => false
      t.boolean :feedback, :default => false
      t.boolean :business_card, :default => false


      t.timestamps null: false
    end
  end
end
