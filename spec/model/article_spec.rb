require "rails_helper"

RSpec.describe Article, type: :model do
  it "is valid with a title, content" do
    article = build(:article)
    expect(article).to be_valid
  end

  it "is invalid without a title" do
    article = build(:article, title: nil)
    article.valid?
    expect(article.errors[:title]).to include("can't be blank")
  end

  it "is invalid with a short title" do
    article = build(:article, title: "hell")
    article.valid?
    expect(article.errors[:title]).to include("is too short (minimum is 5"\
                                              " characters)")
  end

  it "is invalid with a nil content" do
    article = build(:article, content: nil)
    article.valid?
    expect(article.errors[:content]).to include("can't be blank")
  end
end
