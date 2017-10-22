require 'test_helper'
require 'json'

class TableEntriesControllerTest < ActionDispatch::IntegrationTest
  test "should get valid list of table_entries" do
    get api_v1_table_entries_url
    assert_response :success
    assert_equal response.content_type, 'application/vnd.api+json'
    jdata = JSON.parse response.body
    assert_equal 2, jdata['data'].length
    assert_equal jdata['data'][0]['type'], 'table-entries'
  end

  test "should get valid table_entry data" do
  end

  test "should get JSON:API error block when requesting table_entry data with invalid ID" do
    skip
  end

  test "creating new table_entry without sending correct content-type should result in error" do
    skip
  end

  test "creating new table_entry with invalid data should result in error" do
    skip
  end

  test "creating new table_entry with valid data should create new league" do
    skip
  end

  test "updating an existing table_entry with valid data should update that match" do
    skip
  end

  test "should delete table_entry" do
    skip
  end
end
