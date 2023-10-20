module QualityIssuesHelper

  def include_blank_option(object)
    if object.new_record?
      { include_blank: 'Please select...' }
    else
      {}
    end
  end
  
end