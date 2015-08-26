class User < ActiveRecord::Base

  def determine_url(email_address)
    email_address.split('@')[1]
  end

  def determine_pattern(email_address)
    localpart_array = email_address.split('@')[0].split('.')
    fname_length = localpart_array[0].length
    lname_length = localpart_array[1].length
    case
    when fname_length == 1 && lname_length == 1
      return 'first_initial_dot_last_initial'
    when fname_length == 1 && lname_length > 1
      return 'first_initial_dot_last_name'
    when fname_length > 1 && lname_length == 1
      return 'first_name_dot_last_initial'
    when fname_length > 1 && lname_length > 1
      return 'first_name_dot_last_name'
    else
      return nil
    end
  end




end

# first_name_dot_last_name: "john.ferguson@alphasights.com"
# first_name_dot_last_initial: "john.f@alphasights.com"
# first_initial_dot_last_name: "j.ferguson@alphasights.com"
# first_initial_dot_last_initial: "j.f@alphasights.com"