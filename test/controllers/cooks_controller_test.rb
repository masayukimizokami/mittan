require "test_helper"

class CooksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cook = cooks(:one)
  end

  test "should get index" do
    get cooks_url
    assert_response :success
  end

  test "should get new" do
    get new_cook_url
    assert_response :success
  end

  test "should create cook" do
    assert_difference('Cook.count') do
      post cooks_url, params: { cook: { cookingday: @cook.cookingday, cookname: @cook.cookname, cookurl: @cook.cookurl, cost: @cook.cost, image: @cook.image, point: @cook.point, pr: @cook.pr, recom: @cook.recom, standby: @cook.standby } }
    end

    assert_redirected_to cook_url(Cook.last)
  end

  test "should show cook" do
    get cook_url(@cook)
    assert_response :success
  end

  test "should get edit" do
    get edit_cook_url(@cook)
    assert_response :success
  end

  test "should update cook" do
    patch cook_url(@cook), params: { cook: { cookingday: @cook.cookingday, cookname: @cook.cookname, cookurl: @cook.cookurl, cost: @cook.cost, image: @cook.image, point: @cook.point, pr: @cook.pr, recom: @cook.recom, standby: @cook.standby } }
    assert_redirected_to cook_url(@cook)
  end

  test "should destroy cook" do
    assert_difference('Cook.count', -1) do
      delete cook_url(@cook)
    end

    assert_redirected_to cooks_url
  end
end
