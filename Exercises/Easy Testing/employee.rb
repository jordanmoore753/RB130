

class Employee
  class NoExperienceError < StandardError
  end

  def hire
    raise NoExperienceError
  end
end