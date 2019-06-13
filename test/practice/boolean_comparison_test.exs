defmodule Practice.BooleanComparison.Test do
  use ExUnit.Case

  @test_module Practice.BooleanComparison

  # In this module, we'll do some trivial exercises around boolean comparisons.
  #
  # We'll also go over pattern matching in function clauses.

  describe "falsy?/1" do
    # In elixir, `nil` and `false` are both "falsy" values.
    # All other values are truthy.
    #
    # This falsy?/1 function detects if the given value is a falsy value.
    @tag :skip
    test "returns `true` if passed `false`" do
      assert true == @test_module.falsy?(false)
    end

    @tag :skip
    test "returns `true` if passed `nil`" do
      assert true == @test_module.falsy?(nil)
    end

    @tag :skip
    test "returns `false` if passed anything else" do
      assert false == @test_module.falsy?(0)
      assert false == @test_module.falsy?(1)
      assert false == @test_module.falsy?(-1)
      assert false == @test_module.falsy?(:hello)

      # empty string
      assert false == @test_module.falsy?("")

      # empty tuple
      assert false == @test_module.falsy?({})
      # empty map
      assert false == @test_module.falsy?(%{})
      # empty list
      assert false == @test_module.falsy?([])
    end
  end

  describe "truthy?/1" do
    # In elixir, `nil` and `false` are both "falsy" values.
    # All other values are truthy.
    #
    # This truthy?/1 function detects if the given value is a truthy value.
    @tag :skip
    test "returns `false` if passed `false`" do
      assert false == @test_module.truthy?(false)
    end

    @tag :skip
    test "returns `false` if passed `nil`" do
      assert false == @test_module.truthy?(nil)
    end

    @tag :skip
    test "returns `true` if passed anything else" do
      assert true == @test_module.truthy?(0)
      assert true == @test_module.truthy?(1)
      assert true == @test_module.truthy?(-1)
      assert true == @test_module.truthy?(:hello)

      assert true == @test_module.truthy?("")

      assert true == @test_module.truthy?({})
      assert true == @test_module.truthy?(%{})
      assert true == @test_module.truthy?([])
    end
  end

  describe "either/2" do
    # `either/2` is a function we'll create to simulate an inclusive `or`.

    @tag :skip
    test "returns `true` if either argument is `true`" do
      assert true == @test_module.either(true, true)
      assert true == @test_module.either(true, false)
      assert true == @test_module.either(false, true)
      assert false == @test_module.either(false, false)
    end

    @tag :skip
    test "rejects a non-boolean argument" do
      assert_raise FunctionClauseError, fn -> @test_module.either(true, nil) end
      assert_raise FunctionClauseError, fn -> @test_module.either(nil, true) end
    end
  end

  describe "flip/1" do
    # Given a boolean value, return its opposite
    # Check the docs for:
    #   - https://hexdocs.pm/elixir/Kernel.html#!/1
    #   - https://hexdocs.pm/elixir/Kernel.html#not/1
    @tag :skip
    test "returns true if given false" do
      assert true == @test_module.flip(false)
    end

    @tag :skip
    test "returns false if given true" do
      assert false == @test_module.flip(true)
    end

    @tag :skip
    test "rejects any other input" do
      assert_raise FunctionClauseError, fn -> @test_module.flip(nil) end
      assert_raise FunctionClauseError, fn -> @test_module.flip(0) end
      assert_raise FunctionClauseError, fn -> @test_module.flip([]) end
      assert_raise FunctionClauseError, fn -> @test_module.flip(%{}) end
      assert_raise FunctionClauseError, fn -> @test_module.flip({}) end
    end
  end
end
