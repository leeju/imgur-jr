require 'rails_helper'

describe Photo do
  it {should have_many(:answers)}
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:content)}
end
