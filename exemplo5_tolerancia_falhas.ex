# Define o modulo Ping
defmodule Ping do
  use GenServer

  def init(_) do
    IO.puts "Iniciando o Ping..."
    {:ok, nil}
  end

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end
end

# Define o modulo Pong
defmodule Pong do
  use GenServer

  def init(_) do
    IO.puts "Iniciando o Pong..."
    {:ok, nil}
  end

  def start_link(_) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end
end

# Define o supervisor do jogo
defmodule Game do
  use Application

  def start(_type, _args) do
    children = [
      Ping,
      Pong
    ]
    IO.puts "Inicando o jogo..."
    opts = [strategy: :one_for_one, name: Game.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
