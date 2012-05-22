class ModifySubmissionForPaperclip < ActiveRecord::Migration
  def self.up
    add_column :submissions, :portfolio_updated_at,   :datetime
    add_column :submissions, :portfolio_processing, :boolean
    add_column :submissions, :portfolio, :string
    add_column :submissions, :portfolio_owner_netid, :string
    rename_column :submissions, :size, :portfolio_file_size
    rename_column :submissions, :content_type, :portfolio_content_type
    rename_column :submissions, :filename, :portfolio_file_name
  end

  def self.down
    remove_column :submissions, :portfolio_updated_at
    remove_column :submissions, :portfolio_processing
    remove_column :submissions, :portfolio
    remove_column :submissions, :portfolio_owner_netid
    rename_column :submissions, :portfolio_file_size, :size
    rename_column :submissions, :portfolio_content_type, :content_type
    rename_column :submissions, :portfolio_file_name, :filename
  end
end
