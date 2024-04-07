require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creating a new post" do
    let(:user) { User.first } # Assuming you have a factory for creating users
    let(:post_title) { "Great achievement!" }
    let(:post_description) { "Hello Sir" }

    it "creates a new post with both title and description" do
      post = Post.create(title: post_title, description: post_description, user: user)
      expect(post.title).to eq(post_title)
      expect(post.description).to eq(post_description)
      expect(post.user).to eq(user)
      expect(post.created_at).not_to be_nil
    end
  end
end
