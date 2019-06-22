require 'test_helper'

class MicropostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  def setup
      @patient = patients(:10336773@mydbs.ie)
      # This code is not idiomatically correct.
      @micropost = Micropost.new(content: "Test Micropost", patient_id: @patient.id)
  end
  
  test "should be valid" do
  assert @micropost.valid?
end

test "user id should be present" do
    @micropost.patient_id = nil
    assert_not @micropost.valid?
end

test "content should be present" do
    @micropost.content = "   "
    assert_not @micropost.valid?
end

test "content should be at most 140 characters" do
    @micropost.content = "a" * 141
    assert_not @micropost.valid?
end

end
