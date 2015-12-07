require 'test_helper'

class ChefTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.new(chefname: "John",email: "john@example.com")
  end
  
  test "chef should be valid" do
    assert @chef.valid?  
  end
  
  test "chefname must be present" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end
  
  test "chefname length should not be too long" do
    @chef.chefname = "a" * 41
    assert_not @chef.valid?
  end
  
  test "chefname length should not be too short" do
    @chef.chefname = "a" * 2
    assert_not @chef.valid?
  end
  
  test "email must be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end
  
  test "email length must be within bounds" do
    @chef.email = "a" * 101 + "@example.com"
    assert_not @chef.valid?
  end
  
  test "email address must be unique" do
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
  test "email validation should accept valid addresses" do
    valid_addresses = %w[yser@eee.com ashg.jkdk@ase.eu r-Tdss@eee.hello.org user@example.com]
    valid_addresses.each do |va|
      @chef.email = va
      assert @chef.valid?, '#{va.inspect} should be valid'
    end
  end
  
  test "email validation should not accept invalid address" do
      invalid_addresses = %w[user@eeecom R_tdd-dseee.hello.org @example.com @eem.au bha@.com]
      invalid_addresses.each do |ia|  
        @chef.email = ia
        assert_not @chef.valid?, '#{ia.inspect} should be invalid'
      end
   end
  
end