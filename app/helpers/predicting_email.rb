helpers do
  def predict_email(pattern, name, url)
    pattern_hash = {
      'first_initial_dot_last_initial' => create_f_init_dot_l_init(name, url),
      'first_initial_dot_last_name' => create_f_init_dot_l_name(name, url),
      'first_name_dot_last_initial' => create_f_name_dot_l_init(name, url),
      'first_name_dot_last_name' => create_f_name_dot_l_name(name, url),
      nil => 'Unable to find any possible patterns'
    }
    pattern_hash[pattern]
  end

  def create_f_init_dot_l_init(name, company_url)
    name = name.downcase
    "#{name.split(' ')[0][0]}.#{name.split(' ')[1][0]}@#{company_url}"
  end

  def create_f_init_dot_l_name(name, company_url)
    name = name.downcase
    "#{name.split(' ')[0][0]}.#{name.split(' ')[1]}@#{company_url}"
  end

  def create_f_name_dot_l_init(name, company_url)
    name = name.downcase
    "#{name.split(' ')[0]}.#{name.split(' ')[1][0]}@#{company_url}"
  end

  def create_f_name_dot_l_name(name, company_url)
    name = name.downcase
    "#{name.split(' ')[0]}.#{name.split(' ')[1]}@#{company_url}"
  end

  def collect_predicted_emails(patterns, view_hash)
    view_hash[:addresses] = []
    view_hash[:single_pattern] = true if patterns[0] != nil && patterns.length == 1
    patterns.each do |ptrn|
      view_hash[:addresses] << predict_email(ptrn, params['user']['name'], params['user']['url'])
    end
    view_hash
  end
end
