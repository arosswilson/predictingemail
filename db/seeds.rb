require_relative '../app/models/user'
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

sameple_data = {
  "John Ferguson" => "john.ferguson@alphasights.com",
  "Damon Aw" => "damon.aw@alphasights.com",
  "Linda Li" => "linda.li@alphasights.com",
  "Larry Page" => "larry.p@google.com",
  "Sergey Brin" => "s.brin@google.com",
  "Steve Jobs" => "s.j@apple.com"
}

sameple_data.each do |key, value|
  User.create(name: key, email: value, company_url: determine_url(value), email_pattern: determine_pattern(value, key))
end