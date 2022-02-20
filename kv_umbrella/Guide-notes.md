# Notes

## Distributed

```
## foo session
iex --sname foo

## bar session
iex --sname bar

## 好像不好使。。。
Node.spawn_link :foo@rj, fn -> IO.puts "hi"; IO.puts node() end
```