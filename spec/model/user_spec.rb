require "rails_helper"

RSpec.describe User, :type => :model do
  it "is valid with a email, password" do
    user = build(:user)
    expect(user).to be_valid
  end
  
  it "is invalid with a nil email" do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("can't be blank")
  end

  it "is invalid with a nil password" do
    user = build(:user, password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end

  it "is invalid with a short password" do
    user = build(:user, password: 'passwo')
    user.valid?
    expect(user.errors[:password]).to include("is too short (minimum is 8 characters)")
  end
end
