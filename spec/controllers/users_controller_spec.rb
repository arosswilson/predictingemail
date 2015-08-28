require 'spec_helper'

describe 'IndexController' do

  describe 'GET #/' do
    it "renders the index page" do
      get '/'
      expect(last_response).to be_ok
    end

    it "displays homepage content" do
      get '/'
      expect(last_response.body).to include("<form action='/emailprediction' method='post' id='emailprediction'>")
    end
  end

  describe 'GET #/emailprediction' do
    before :each do
      User.create(
        name: "John Ferguson",
        email: "john.ferguson@alphasights.com",
        company_url: "alphasights.com",
        email_pattern: "first_name_dot_last_name"
        )
      User.create(
        name: "Damon Aw",
        email: "damon.aw@alphasights.com",
        company_url: "alphasights.com",
        email_pattern: "first_name_dot_last_name"
        )
      User.create(
        name: "Linda Li",
        email: "linda.li@alphasights.com",
        company_url: "alphasights.com",
        email_pattern: "first_name_dot_last_name"
        )
      User.create(
        name: "Larry Page",
        email: "larry.p@google.com",
        company_url: "google.com",
        email_pattern: "first_name_dot_last_initial"
        )
      User.create(
        name: "Sergey Brin",
        email: "s.brin@google.com",
        company_url: "google.com",
        email_pattern: "first_initial_dot_last_name"
        )
      User.create(
        name: "Steve Jobs",
        email: "s.j@apple.com",
        company_url: "apple.com",
        email_pattern: "first_initial_dot_last_initial"
        )
    end
    context 'google url' do
      it 'should return two emails' do
        post '/emailprediction', {"user"=>{"name"=>"Craig Silverstein", "url"=>"google.com"}}
        expect(last_response.body).to include('<p>craig.s@google.com</p>' && '<p>c.silverstein@google.com</p>')
      end
    end
    context 'alphasights url' do
      it 'should return one email' do
        post '/emailprediction', {"user"=>{"name"=>"Peter Wong", "url"=>"alphasights.com"}}
        expect(last_response.body).to include('<p>peter.wong@alphasights.com</p>')
      end
    end
    context 'apple url' do
      it 'should return one email' do
        post '/emailprediction', {"user"=>{"name"=>"Steve Wozniak", "url"=>"apple.com"}}
        expect(last_response.body).to include('<p>s.w@apple.com</p>')
      end
    end
    context 'whitehouse url' do
      it 'should return no emails' do
        post '/emailprediction', {"user"=>{"name"=>"Barack Obama", "url"=>"whitehouse.gov"}}
        expect(last_response.body).to include('<p>Unable to find any possible patterns</p>')
      end
    end
    context 'my name with alphasights url' do
      it 'should return one email address' do
        post '/emailprediction', {"user"=>{"name"=>"Ross Wilson", "url"=>"alphasights.com"}}
        expect(last_response.body).to include('<p>ross.wilson@alphasights.com</p>')
      end
    end
  end
end
