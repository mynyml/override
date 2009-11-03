require 'test/test_helper'
require 'lib/override'

class OverrideTest < Test::Unit::TestCase
  context "Override" do
    context "in reopened class" do
      before do
        class ::A
          def a() 'canada' end
          define_method(:b) { 'brazil' }
        end
      end
      after do
        Object.send(:remove_const, :A)
        lambda { ::A }.should raise_error(NameError) #make sure ::A is unset
      end
      test "allows using 'super' keyword" do
        class ::A
          override(:a)
          def a() super + '&montreal' end
        end
        A.new.a.should be('canada&montreal')
      end
      test "works with dynamically defined methods" do
        class ::A
          override(:b)
          def b() super + '&saopaulo' end
        end
        A.new.b.should be('brazil&saopaulo')
      end
      test "accepts multiple method names" do
        class ::A
          override(:a,:b)
          def a() super + '&montreal' end
          def b() super + '&saopaulo' end
        end
        A.new.a.should be('canada&montreal')
        A.new.b.should be('brazil&saopaulo')
      end
    end
  end
end
