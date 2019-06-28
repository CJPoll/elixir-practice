defmodule Practice.Stack.Test do
  use ExUnit.Case

  @test_module Practice.Stack

  describe "new/0" do
    @tag :skip
    test "returns an empty stack" do
      assert %@test_module{} = stack = @test_module.new()
      assert @test_module.count(stack) == 0
    end
  end

  describe "push/2" do
    @tag :skip
    test "returns a stack" do
      assert %@test_module{} =
               @test_module.new()
               |> @test_module.push(1)
               |> @test_module.push(2)
    end
  end

  describe "peek/1" do
    @tag :skip
    test "returns the last element that was pushed onto the stack" do
      assert @test_module.new()
             |> @test_module.push(1)
             |> @test_module.push(2)
             |> @test_module.peek == 2
    end

    @tag :skip
    test "returns nil if the stack is empty" do
      assert @test_module.new() |> @test_module.peek == nil
    end
  end

  describe "pop/1" do
    @tag :skip
    test "returns a 2-tuple" do
      assert {_, _} = @test_module.new |> @test_module.pop
    end

    @tag :skip
    test "the first element of the returned tuple is the last element pushed onto the stack" do
      assert {nil, _} = @test_module.new |> @test_module.pop
      assert {1, _} = @test_module.new |> @test_module.push(1) |> @test_module.pop

      assert {2, _} =
               @test_module.new
               |> @test_module.push(1)
               |> @test_module.push(2)
               |> @test_module.pop
    end

    @tag :skip
    test "the second element of the returned tuple is the stack with the last-pushed element removed" do
      assert {_, %@test_module{elements: []}} = @test_module.new |> @test_module.pop

      assert {_, %@test_module{elements: []}} =
               @test_module.new |> @test_module.push(1) |> @test_module.pop

      assert {_, %@test_module{elements: [1]}} =
               @test_module.new
               |> @test_module.push(1)
               |> @test_module.push(2)
               |> @test_module.pop
    end
  end
end
