defmodule KVServerTest do
  use ExUnit.Case

  # 18:12:10.698 [info] Application kv exited: :stopped
  # To avoid printing log messages during tests, ExUnit provides a neat feature called :capture_log. By setting @tag :capture_log before each test or @moduletag :capture_log for the whole test case, ExUnit will automatically capture anything that is logged while the test runs. In case our test fails, the captured logs will be printed alongside the ExUnit report.
  @moduletag :capture_log

  setup do
    Application.stop(:kv)
    :ok = Application.start(:kv)
  end

  setup do
    opts = [:binary, packet: :line, active: false]
    {:ok, socket} = :gen_tcp.connect('localhost', 4040, opts)
    %{socket: socket}
  end

  # @tag :distributed

  test "server interaction", %{socket: socket} do
    assert send_and_recv(socket, "UNKNOWN shopping\r\n") ==
             "UNKNOWN COMMAND\r\n"

    assert send_and_recv(socket, "GET shopping eggs\r\n") ==
             "NOT FOUND\r\n"

    assert send_and_recv(socket, "CREATE shopping\r\n") ==
             "OK\r\n"

    assert send_and_recv(socket, "PUT shopping eggs 3\r\n") ==
             "OK\r\n"

    # GET returns two lines
    assert send_and_recv(socket, "GET shopping eggs\r\n") == "3\r\n"
    assert send_and_recv(socket, "") == "OK\r\n"

    assert send_and_recv(socket, "DELETE shopping eggs\r\n") ==
             "OK\r\n"

    # GET returns two lines
    assert send_and_recv(socket, "GET shopping eggs\r\n") == "\r\n"
    assert send_and_recv(socket, "") == "OK\r\n"
  end

  defp send_and_recv(socket, command) do
    :ok = :gen_tcp.send(socket, command)
    {:ok, data} = :gen_tcp.recv(socket, 0, 1000)
    data
  end
end
