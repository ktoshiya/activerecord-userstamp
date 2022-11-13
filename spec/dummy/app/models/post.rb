class Post < ActiveRecord::Base
  stampable stamper_class_name: :person
  validates :creator, presence: true
  has_many :comments

  # override destroy to get soft delete like acts_as_paranoid style delete
  # Note: delete_all (used in helper) bypasses this and deletes all rows.
  def destroy
    run_callbacks :destroy do
      self.deleted_at = DateTime.now
    end
  end
end
