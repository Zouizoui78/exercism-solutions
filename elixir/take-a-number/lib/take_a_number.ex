defmodule TakeANumber do
  @initial_state 0

  def start() do
    spawn(&loop/0)
  end

  defp loop(), do: loop(@initial_state)
  defp loop(state) do
    receive do
      {:report_state, sender_pid} ->
        send_state_and_loop(sender_pid, state)
      {:take_a_number, sender_pid} ->
        state = state + 1
        send_state_and_loop(sender_pid, state)
      :stop -> :noop
      _ -> loop(state)
    end
  end

  defp send_state_and_loop(sender_pid, state) do
    send(sender_pid, state)
    loop(state)
  end
end
