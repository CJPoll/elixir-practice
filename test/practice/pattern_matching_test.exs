defmodule Practice.PatternMatching.Test do
  use ExUnit.Case

  @test_module Practice.PatternMatching

  describe "identity/1" do
    @tag :skip
    test "given an empty map, returns `nil`" do
      assert nil == @test_module.identity(%{})
    end

    @tag :skip
    test "given a map with the key `\"identity\"`, returns the value of that key" do
      assert "123-45-6789" == @test_module.identity(%{"identity" => "123-45-6789"})
    end

    @tag :skip
    test "rejects values that aren't maps" do
      for value <- [0, [], {}, true, nil, 1.1] do
        assert_raise FunctionClauseError, fn -> @test_module.identity(value) end
      end
    end
  end

  describe "reduce/3" do
    @tag :skip
    test "reduces" do
      assert 21 == @test_module.reduce([1, 2, 3, 4, 5, 6], 0, &+/2)
      assert 0 == @test_module.reduce([], 0, &+/2)
      assert 15 == @test_module.reduce([-1, 2, 5, 9], 0, &+/2)
    end
  end

  describe "sum/1" do
    @tag :skip
    test "given a list of integers, returns the sum of elements in the list" do
      assert 21 == @test_module.sum([1, 2, 3, 4, 5, 6])
      assert 0 == @test_module.sum([])
      assert 15 == @test_module.sum([-1, 2, 5, 9])
    end
  end
end
