require 'rails_helper'

describe Photo do
  it {should validate_presence_of(:title)}
  it {should validate_presence_of(:url)}
end
