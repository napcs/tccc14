module ApplicationHelper
  def status_field(formObject, object)
    formObject.select :status, object::STATUSES
  end
end
