class User < ActiveRecord::Base
  validates :name, presence: true
  def self.find_patterns(company_url)
    pattern_array = User.where(company_url: company_url).pluck(:email_pattern)
    if pattern_array.empty?
      return [nil]
    else
      return pattern_array
    end
  end
end
