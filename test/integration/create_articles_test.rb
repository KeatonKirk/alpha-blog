require 'test_helper'

class CreateArticlesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "john", email: "john@example.com",
            password: "password", admin: true)
    @category = Category.create(name: "Test")
  end

  test "get new article form and create article" do
    sign_in_as(@user, "password")
    get new_article_path
    assert_template 'articles/new'
    assert_difference 'Article.count', 1 do
      post articles_path, params: { article: {title: "New Article", description: "Test Description"}}
      follow_redirect!
    end
    assert_template 'articles/show'
  end

  test "create new article with category" do
    sign_in_as(@user, "password")
    assert_difference 'ArticleCategory.count', 1 do
      post articles_path, params: { article: {title: "New Article", description: "Test Description",
            category_ids: @category.id}}
      follow_redirect!
    end
  end
end
