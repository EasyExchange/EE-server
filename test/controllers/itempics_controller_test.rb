require 'test_helper'

class ItempicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @itempic = itempics(:one)
  end

  test "should get index" do
    get itempics_url, as: :json
    assert_response :success
  end

  test "should create itempic" do
    assert_difference('Itempic.count') do
      post itempics_url, params: { itempic: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show itempic" do
    get itempic_url(@itempic), as: :json
    assert_response :success
  end

  test "should update itempic" do
    patch itempic_url(@itempic), params: { itempic: {  } }, as: :json
    assert_response 200
  end

  test "should destroy itempic" do
    assert_difference('Itempic.count', -1) do
      delete itempic_url(@itempic), as: :json
    end

    assert_response 204
  end
end
