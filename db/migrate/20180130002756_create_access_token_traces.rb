class CreateAccessTokenTraces < ActiveRecord::Migration[5.1]
  def change
    create_table :access_token_traces do |t|
      t.string :access_token, null: false
      t.timestamps
    end
  end
end
