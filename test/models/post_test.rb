require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "creating a new post with both title and description" do
    user = users(:user) # Reference the user fixture
    post_title = "Great achievement!"
    post_description = "Hello Sir"

    post = Post.new(title: post_title, description: post_description, user: user)

    assert post.valid?, "Post is not valid: #{post.errors.messages}"
    assert post.save, "Failed to save the post"

    assert_equal post_title, post.title
    assert_equal post_description, post.description
    assert_equal user, post.user
    assert_not_nil post.created_at
  end

  test "deleting a post removes associated replies" do
    # Mock user object
    user = users(:user) # Assuming you have a fixture for users

    # Create a post by the user
    post = Post.create(title: "Test Post", description: "Test Description", user: user)

    # Create replies associated with the post
    reply1 = Reply.create(post: post, user: user, message: "Reply 1")
    reply2 = Reply.create(post: post, user: user, message: "Reply 2")

    # Ensure that the post has associated replies
    assert_equal 2, post.replies.count

    # Delete the post
    post.destroy

    # Ensure that the post is removed
    assert_not Post.exists?(post.id), "Post should be deleted"

    # Ensure that associated replies are also removed
    assert_empty Reply.where(post_id: post.id), "Associated replies should be deleted"
  end

  test "adding a post with only a title" do
    # Mock user object
    user = users(:user) # Assuming you have a fixture for users

    # Title for the post
    title = "This is the title of the test post."

    # Create a new post with only a title and no description
    post = Post.new(title: title, user: user)

    # Validate the post
    assert_not post.valid?, "Post should not be valid without a description"

    # Check for error message indicating that description is required
    assert_includes post.errors.messages[:description], "can't be blank"
  end

  test "adding a post without both title and description" do
    # Mock user object
    user = users(:user) # Assuming you have a fixture for users

    # Create a new post without providing a title and description
    post = Post.new(user: user)

    # Validate the post
    assert_not post.valid?, "Post should not be valid without both title and description"

    # Check for error messages indicating that title and description are required
    assert_includes post.errors.messages[:title], "can't be blank"
    assert_includes post.errors.messages[:description], "can't be blank"
  end

  test "adding a post with only a description" do
    # Mock user object
    user = users(:user) # Assuming you have a fixture for users

    # Description for the post
    description = "This is the description of the test post."

    # Create a new post with only a description and no title
    post = Post.new(description: description, user: user)

    # Validate the post
    assert_not post.valid?, "Post should not be valid without a title"

    # Check for error message indicating that title is required
    assert_includes post.errors.messages[:title], "can't be blank"
  end
end
