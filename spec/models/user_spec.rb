require 'spec_helper'

describe User do
  describe 'find unique patters based on company url' do
    context 'should find patterns' do
      it "should return an array of unique patterns based on company url" do
        john = User.create(
          name: 'John Ferguson',
          email: 'john.ferguson@alphasights.com',
          company_url: 'alphasights.com',
          email_pattern: 'first_name_dot_last_name'
          )
        ross = User.create(
          name: 'Ross Wilson',
          email: 'r.w@alphasights.com',
          company_url: 'alphasights.com',
          email_pattern: 'first_initial_dot_last_initial'
          )
        ron = User.create(
          name: 'Ron Winston',
          email: 'ron.winston@alphasights.com',
          company_url: 'alphasights.com',
          email_pattern: 'first_name_dot_last_name'
          )
        expect(User.find_patterns('alphasights.com')).to eq ['first_name_dot_last_name', 'first_initial_dot_last_initial']
      end
    end
    context 'should return nil' do
      it "for a company url that no user has" do
        john = User.create(
          name: 'John Ferguson',
          email: 'john.ferguson@alphasights.com',
          company_url: 'alphasights.com',
          email_pattern: 'first_name_dot_last_name'
          )
        ross = User.create(
          name: 'Ross Wilson',
          email: 'r.w@alphasights.com',
          company_url: 'alphasights.com',
          email_pattern: 'first_initial_dot_last_initial'
          )
        expect(User.find_patterns('unc.edu')).to eq [nil]
      end

      it "for user that have a company url but no pattern" do
        john = User.create(
          name: 'John Ferguson',
          email: 'john.ferguson@alphasights.com',
          company_url: 'alphasights.com'
          )
        ross = User.create(
          name: 'Ross Wilson',
          email: 'r.w@alphasights.com',
          company_url: 'alphasights.com'
          )
        expect(User.find_patterns('alphasights.com')).to eq [nil]
      end
    end
  end
end