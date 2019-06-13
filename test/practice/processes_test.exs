defmodule Practice.Processes.Test do
  use ExUnit.Case

  alias Practice.Processes

  describe "new/1" do
    @tag :skip
    test "accepts a 0-argument function" do
      Processes.new(fn -> :does_nothing end)
    end

    @tag :skip
    test "rejects functions that require arguments" do
      Processes.new(fn -> :does_nothing end)
    end

    @tag :skip
    test "returns a pid" do
      pid = Processes.new(fn -> :does_nothing end)
      assert is_pid(pid)
    end
  end

  describe "new/3" do
    @tag :skip
    test "Accepts module, function, args" do
      Processes.new(Kernel, :+, [1, 2])
    end

    @tag :skip
    test "returns a pid" do
      pid = Processes.new(Kernel, :+, [1, 2])
      assert is_pid(pid)
    end
  end

  describe "deliver/2" do
    @tag :skip
    test "sends a message to the given pid, including the sender's pid" do
      pid = Processes.new(__MODULE__, :echo, [])

      assert Process.alive?(pid)
      Processes.deliver(pid, :hi)
      assert_receive({:echo, :hi})

      assert Process.alive?(pid)
      Processes.deliver(pid, :wassup)
      assert_receive({:echo, :wassup})

      Processes.deliver(pid, :stop)
      assert_receive({:echo, :stop})

      # Technically, this check for `aliveness` is a race condition.
      # Consider the following sequence of events:
      # 1. We send the `:stop` message
      # 2. The other process receives the `:stop` message
      # 3. The other process sends an `{:echo, :stop}` back.
      # 4. The other process gets backgrounded for a moment
      # 5. We check if it's still alive (it is), causing a test failure
      # 6. The other process is forgrounded, finishes execution, and finally dies
      refute Process.alive?(pid)
    end
  end

  def echo do
    receive do
      {:stop = msg, sender} ->
        send(sender, {:echo, msg})
        :ok

      {msg, sender} ->
        send(sender, {:echo, msg})
        echo()
    end
  end
end
