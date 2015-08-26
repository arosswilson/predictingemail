helpers do
  def create_predicted_email(pattern, name, company_url)
    pattern_hash = {
      'first_initial_dot_last_initial' => create_first_initial_dot_last_initial(name, company_url),
      'first_initial_dot_last_name' => create_first_initial_dot_last_name(name, company_url),
      'first_name_dot_last_initial' => create_first_name_dot_last_initial(name, company_url),
      'first_name_dot_last_name' => create_first_name_dot_last_name(name, company_url),
      nil => 'Unable to find any possible patterns'
    }
    pattern_hash[pattern]
  end

  def create_first_initial_dot_last_initial(name, company_url)
    name = name.downcase
    return "#{name.split(' ')[0][0]}.#{name.split(' ')[1][0]}@#{company_url}"
  end

  def create_first_initial_dot_last_name(name, company_url)
    name = name.downcase
    return "#{name.split(' ')[0][0]}.#{name.split(' ')[1]}@#{company_url}"
  end

  def create_first_name_dot_last_initial(name, company_url)
    name = name.downcase
    return "#{name.split(' ')[0]}.#{name.split(' ')[1][0]}@#{company_url}"
  end

  def create_first_name_dot_last_name(name, company_url)
    name = name.downcase
    return "#{name.split(' ')[0]}.#{name.split(' ')[1]}@#{company_url}"
  end
end