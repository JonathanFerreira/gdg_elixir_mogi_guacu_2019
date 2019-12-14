### Criando meu primeiro processo
spawn(fn -> IO.puts "Meu primeiro processo em Elixir" end)


### Enviando msgs

caller = self()
spawn(fn -> send(caller, {:saudacao, "Ola mundo!"}) end)

receive do
  {:saudacao, msg} -> IO.puts(msg)
end
