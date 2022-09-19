# Erlang

erl -eval 'erlang:display(erlang:system_info(otp_release)), halt().'  -noshell

The number of maximum available scheduler threads and online scheduler threads can be specified by passing two colon-seperated numbers to +S flag when booting Erlang emulator with erl start script.

```
erl +S MaxAvailableSchedulers:OnlineSchedulers

erl +S 16:8
erlang:system_info(schedulers).
erlang:system_info(schedulers_online).
```