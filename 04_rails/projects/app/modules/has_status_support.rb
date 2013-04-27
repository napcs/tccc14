module HasStatusSupport

  STATUSES = [
    ["Open", 1],
    ["On Hold", 2],
    ["Cancelled", 3],
    ["Completed", 99]
  ]
  
  def status_as_string
    status = Project::STATUSES.find{|s| s[1] == 1}
    status[0]
  end
end
