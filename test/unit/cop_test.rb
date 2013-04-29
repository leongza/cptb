require 'test_helper'

class CopTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Cop.new.valid?
  end
end
