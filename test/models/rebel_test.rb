require 'test_helper'

class RebelTest < ActiveSupport::TestCase

  def setup
    @user = Rebel.new(name: "corey", email: "example.com")
    @no_email = rebels(:no_email)
    @no_name = rebels(:no_name)
    @perfect = rebels(:perfect)
    @injection_chars = %w[
    -- `` # / \\ SELECT WHERE admin /* */ FROM ! DROP TABLE ; IF
    ELSE THEN ( ) CHAR \'\' || UNION
    ]
  end

  test ' will not save without name' do
    assert_not @no_name.save, 'rebel saved without a name'
  end

  test 'name is no longer than 34 characters' do
    @perfect.name = 'a' * 35
    assert_not @perfect.save, 'model saved with a name longer then 34 chars '
  end

  test 'will not save without email' do
    assert_not @no_email.save, 'model saved without an email'
  end

  test 'email meets length requirements' do
    @no_email.email = "q" * 244 + "@example.com"
    assert_not @no_email.valid?, "email saved without meeting lenght requirements"
  end

  test "validation should reject invalid email\s" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |e|
      @no_email.email = e
      assert_not @no_email.save, "#{e.inspect} should be invalid"
    end
  end


=begin

  test 'email excludes injection characters' do
    @injection_chars.each do |i|
      @user.email = @user.email.concat(i)
      assert_not @perfect.valid?, "Email saved with an SQL character"
    end
  end


  test 'name excludes injection characters' do

  end
  # each of list, append it to name, email
  # assert that model does not save
=end
end
