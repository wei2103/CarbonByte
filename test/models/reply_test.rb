require 'test_helper'

class ReplyTest < ActiveSupport::TestCase
  test "adding a reply to an existing post" do
    # Mock parent post object
    parent_post = posts(:post1) # Assuming you have a fixture for posts

    # Mock user object
    user = users(:user) # Assuming you have a fixture for users

    # Reply text
    reply_text = "Thank you!"

    # Create a new reply associated with the parent post and user
    reply = Reply.new(post: parent_post, user: user, message: reply_text)

    # Validate the reply
    assert reply.valid?, "Reply is not valid: #{reply.errors.messages}"

    # Save the reply
    assert reply.save, "Failed to save the reply"

    # Verify associations
    assert_equal parent_post, reply.post
    assert_equal user, reply.user

    # Verify timestamp
    assert_not_nil reply.created_at
  end

  # test "submitting a blank reply" do
  #   # Mock parent post object
  #   parent_post = posts(:post1) # Assuming you have a fixture for posts

  #   # Mock user object
  #   user = users(:user) # Assuming you have a fixture for users

  #   # Empty reply text
  #   reply_text = ""

  #   # Create a new reply associated with the parent post and user
  #   reply = Reply.new(post: parent_post, user: user, message: reply_text)

  #   # Validate the reply
  #   assert_not reply.valid?, "Reply should be invalid without text"

  #   # Check for error message indicating that reply text is required
  #   assert_includes reply.errors.messages[:message], "can't be blank"
  # end

  test "handling a long reply" do
    # Mock parent post object
    parent_post = posts(:post1) # Assuming you have a fixture for posts

    # Mock user object
    user = users(:user) # Assuming you have a fixture for users

    # Long reply text
    long_reply_text = "A" * 281

    # Create a new reply associated with the parent post and user
    reply = Reply.new(post: parent_post, user: user, message: long_reply_text)

    # Validate the reply
    assert reply.valid?, "Reply should be valid"

    # Save the reply
    assert reply.save, "Failed to save the reply"

    # Verify that the reply text is truncated to the first 280 characters
    assert_equal long_reply_text[0..279] + "...", reply.message
  end

  test "deleting a reply removes it from the list of replies associated with the post" do
    # Mock parent post object
    parent_post = posts(:post1) # Assuming you have a fixture for posts

    # Mock user object
    user = users(:user) # Assuming you have a fixture for users

    # Create a reply associated with the post
    reply = Reply.create(post: parent_post, user: user, message: "Test Reply")

    # Ensure that the reply is associated with the post
    assert_includes parent_post.replies, reply

    # Delete the reply
    reply.destroy

    # Reload the parent post from the database to reflect changes
    parent_post.reload

    # Ensure that the reply is removed from the list of replies associated with the post
    assert_not_includes parent_post.replies, reply
  end
end
