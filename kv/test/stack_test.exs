defmodule Test.StackTest do
  use ExUnit.Case

  test "try stack" do
    {:ok, stack} = Stack.start_link([:hello])
    assert :hello == Stack.pop(stack)

    Stack.push(stack, :world)
    assert :world == Stack.pop(stack)

    assert [] == Stack.state(stack)
  end
end
