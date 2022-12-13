require "application_system_test_case"

class BatchesTest < ApplicationSystemTestCase
  setup do
    @batch = batches(:one)
  end

  test "visiting the index" do
    visit batches_url
    assert_selector "h1", text: "Batches"
  end

  test "should create batch" do
    visit batches_url
    click_on "New batch"

    fill_in "Block", with: @batch.block
    fill_in "Boundaries", with: @batch.boundaries
    fill_in "Description", with: @batch.description
    fill_in "Lot", with: @batch.lot
    fill_in "Price", with: @batch.price
    fill_in "State", with: @batch.state
    click_on "Create Batch"

    assert_text "Batch was successfully created"
    click_on "Back"
  end

  test "should update Batch" do
    visit batch_url(@batch)
    click_on "Edit this batch", match: :first

    fill_in "Block", with: @batch.block
    fill_in "Boundaries", with: @batch.boundaries
    fill_in "Description", with: @batch.description
    fill_in "Lot", with: @batch.lot
    fill_in "Price", with: @batch.price
    fill_in "State", with: @batch.state
    click_on "Update Batch"

    assert_text "Batch was successfully updated"
    click_on "Back"
  end

  test "should destroy Batch" do
    visit batch_url(@batch)
    click_on "Destroy this batch", match: :first

    assert_text "Batch was successfully destroyed"
  end
end
