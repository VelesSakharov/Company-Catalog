# frozen_string_literal: true
require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  test 'get index' do
    get :index
    assert_response :success
  end

  test 'get new' do
    get :new
    assert_response :success
  end

  test 'get create' do
    get :create
    assert_response :success
  end

  test 'get show' do
    get :show
    assert_response :success
  end
end
