class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter

    define_method("#{attr_name}_history") do
      log = instance_variable_get("@#{attr_name}_log")
      log[0..-2] if log
    end

    define_method("#{attr_name}=") do |value|
      log = instance_variable_get("@#{attr_name}_log") || [nil]
      instance_variable_set "@#{attr_name}_log", log << value
      instance_variable_set "@#{attr_name}", value
    end
  end
end
