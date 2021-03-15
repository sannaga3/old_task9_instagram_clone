class AddIndexToUsersEmail < ActiveRecord::Migration[5.2]
  def change
    rails g migration add_index_to_users_email
  end
end
