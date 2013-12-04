require "test/unit"
require "string_extension_test1"

class BooleanTest < Test::Unit::TestCase

	def test_is_number
		assert "3".is_number?, "You did something wrong"
	end

    def test_is_not_number
    	assert !"Dave".is_number?, "Here is an error message"
    end

end