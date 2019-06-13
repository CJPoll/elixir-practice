defmodule Practice.Struct.Test do
  use ExUnit.Case

  alias Practice.User

  describe "user/0" do
    @tag :skip
    test "returns a User" do
      assert %User{} = User.new()
    end

    @tag :skip
    test "returns a user with 0 logins" do
      assert %User{logins: 0} = User.new()
    end
  end

  describe "login/1" do
    @tag :skip
    test "increments the login_count of the given user" do
      assert %User{logins: 4} =
               User.new()
               |> User.login()
               |> User.login()
               |> User.login()
               |> User.login()
    end
  end

  describe "login/2" do
    @tag :skip
    test "increments the login_count of the given user by the given amount" do
      assert %User{logins: 6} =
               User.new()
               |> User.login()
               |> User.login(2)
               |> User.login(4)
               |> User.login(-1)
               |> User.login(2.5)
    end
  end
end
