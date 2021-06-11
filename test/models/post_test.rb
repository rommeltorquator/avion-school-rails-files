require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test 'should not save post without title' do
    post = Post.new
    post.body = "This is the test body hohohohohoho merry christmas"

    assert_not post.save, 'saved post without title' # must return false
  end
end
