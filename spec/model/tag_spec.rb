require 'rails_helper'

RSpec.describe Tag, :type => :model do
  it 'is valid with a valid name' do
    tag = build(:tag)
    expect(tag).to be_valid
  end

  it 'is invalid with a nil name' do
    tag = build(:tag, name: nil)
    tag.valid?
    expect(tag.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with a short name' do
    tag = build(:tag, name: 'name')
    tag.valid?
    expect(tag.errors[:name]).to include("is too short (minimum is 5 characters)")
  end
end
