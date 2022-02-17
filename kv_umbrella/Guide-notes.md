# Notes

## Distributed

```
## foo session
iex --sname foo@localhost

## bar session
iex --sname bar

Node.spawn_link :foo@rj, fn -> IO.puts "hi"; IO.puts node() end
```