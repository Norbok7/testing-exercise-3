require 'rails_helper'

RSpec.describe Blog, type: :model do
  it 'validates presence of title and content' do
    blog = Blog.new(title: nil, content: nil)
    expect(blog).to_not be_valid
    expect(blog.errors[:title]).to include("can't be blank")
    expect(blog.errors[:content]).to include("can't be blank")
  end
end