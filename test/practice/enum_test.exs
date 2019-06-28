defmodule Practice.Enum.Test do
  use ExUnit.Case

  @test_module Practice.Enum

  describe "sum/1" do
    @tag :skip
    test "accepts a list of integers" do
      @test_module.sum([1, 2, 3, 4, 5, 6, 7])
    end

    @tag :skip
    test "returns the sum of all integers in the list" do
      assert @test_module.sum([1, 2, 3, 4, 5, 6, 7]) == 28
      assert @test_module.sum([10, 11, 12, 15, -1]) == 47
    end

    @tag :skip
    test "defaults to 0 if given an empty list" do
      assert @test_module.sum([]) == 0
    end

    @tag :skip
    test "raises an ArgumentError if any element of the list is not an integer" do
      # The idea is that your code will raise the ArgumentError manually
      assert_raise ArgumentError, "This function accepts a list of integers only", fn ->
        @test_module.sum([1, 2, 3, 4, 5, :ok])
      end
    end
  end

  describe "count_by/1" do
    @tag :skip
    test "accepts a list of elements" do
      assert @test_module.count_by([1, 2, 3, 1, 2, :ok, :error, :ok, :ok])
    end

    @tag :skip
    test "returns a mapping from each element to the number of times it occurred in the list" do
      assert @test_module.count_by([1, 2, 3, 1, 2, :ok, :error, :ok, :ok]) == %{
               1 => 2,
               2 => 2,
               3 => 1,
               :ok => 3,
               :error => 1
             }
    end
  end

  describe "integers?/1" do
    @tag :skip
    test "accepts a list of elements" do
      @test_module.integers?([1, 2, 3])
    end

    @tag :skip
    test "returns true if all elements of the list are integers" do
      assert @test_module.integers?([1, 2, 3, -4]) == true
    end

    @tag :skip
    test "returns false if any elements of the list are not integers" do
      refute @test_module.integers?([1, 2, 3, 1.1])
      refute @test_module.integers?([1, 2, 3, :ok])
      refute @test_module.integers?([1, 2, 3, ""])
      refute @test_module.integers?([1, 2, 3, []])
    end
  end
end
