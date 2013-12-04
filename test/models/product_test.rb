require 'test_helper'

class ProductTest < ActiveSupport::TestCase
   test "fixture" do
   	 assert_equal "Example", products(:test).name
   end
end
