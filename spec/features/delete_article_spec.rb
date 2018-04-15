require 'rails_helper'

RSpec.feature "Deleting an article" do

  before do
    @article = Article.create(title: "Article Title", body: "Body body of the article!")
  end

  scenario "A user deletes an article" do
    visit "/"

    click_link @article.title
    click_link "Delete Article"

    expect(page).to have_content("Article has been deleted")
    expect(current_path).to eq(articles_path)
  end

end