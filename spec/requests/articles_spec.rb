require 'rails_helper'

RSpec.describe "Articles", type: :request do

  before do
    @article = Article.create(title: "Article Title", body: "Body body of the article!")
  end

  describe 'GET /articles/:id' do
    context 'with existing article' do
      before { get "/articles/#{@article.id}" }

      it "handles existing article" do
        expect(response.status).to eq 200
      end
    end

    context 'with non-existant article' do
      before { get "/articles/xxxx" }

      it "handles non-existant article" do
        expect(response.status).to eq 302
        flash_message = "The article you requested can't be found"
        expect(flash[:alert]).to eq flash_message
      end
    end
  end

end
