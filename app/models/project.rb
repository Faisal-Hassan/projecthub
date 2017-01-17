class Project < ActiveRecord::Base
  belongs_to :tenant
  validates_uniqueness_of :title
  validate :free_plan_can_only_have_one_project
  
  def free_plan_can_only_have_one_project
    if self.new_record? && (tenant.project.count > 0) && (tenant.plan == 'free')
      errors.add(:base, "Free plans cannot have more than one project")
    end
  end
  
end
