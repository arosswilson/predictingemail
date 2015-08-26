class User < ActiveRecord::Base

  def determine_url(email_address)
    email_address.split('@')[1]
  end

  def hashify_info(email_address, name)
    return {
      fname: name.downcase.split(' ')[0],
      lname: name.downcase.split(' ')[1],
      finit: name.downcase.split(' ')[0][0],
      linit: name.downcase.split(' ')[1][0],
      fname_email: email_address.split('@')[0].split('.')[0],
      lname_email: email_address.split('@')[0].split('.')[1]
    }
  end

  def determine_pattern(email_address, name)
    hash = hashify_info(email_address, name)
    case
    when hash[:fname_email] == hash[:finit] && hash[:lname_email] == hash[:linit]
      return 'first_initial_dot_last_initial'
    when hash[:fname_email] == hash[:finit] && hash[:lname_email] == hash[:lname]
      return 'first_initial_dot_last_name'
    when hash[:fname_email] == hash[:fname] && hash[:lname_email] == hash[:linit]
      return 'first_name_dot_last_initial'
    when hash[:fname_email] == hash[:fname] && hash[:lname_email] == hash[:lname]
      return 'first_name_dot_last_name'
    else
      return nil
    end
  end

  def self.find_patterns(company_url)
    pattern_array = User.where(company_url: company_url).pluck(:email_pattern)
    if pattern_array.empty?
      return [nil]
    else
      return pattern_array
    end
  end

end
