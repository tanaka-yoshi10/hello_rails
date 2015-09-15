class Comment < ActiveRecord::Base
  belongs_to :entry

  def approved?
    self.status == "approved"
  end
end
