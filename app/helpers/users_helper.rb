module UsersHelper
  def status_humanizable(t)
    if t == 1
      status_humanizable = "Trainee"
    else if t == 2
           status_humanizable = "Working"
           else if t == 3
                  status_humanizable = "Fired"
                end
         end
    end
  end
end
