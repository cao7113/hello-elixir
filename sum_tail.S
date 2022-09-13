{module, sum}.  %% version = 0

{exports, [{module_info,0},{module_info,1},{sum_tail,1}]}.

{attributes, []}.

{labels, 10}.


{function, sum_tail, 1, 2}.
  {label,1}.
    {line,[{location,"erlang/sum_tail.erl",5}]}.
    {func_info,{atom,sum},{atom,sum_tail},1}.
  {label,2}.
    {move,{integer,0},{x,1}}.
    {call_only,2,{f,4}}. % sum_tail/2


{function, sum_tail, 2, 4}.
  {label,3}.
    {line,[{location,"erlang/sum_tail.erl",8}]}.
    {func_info,{atom,sum},{atom,sum_tail},2}.
  {label,4}.
    {'%',{var_info,{x,1},[{type,number}]}}.
    {test,is_nonempty_list,{f,5},[{x,0}]}.
    {get_list,{x,0},{x,2},{x,0}}.
    {line,[{location,"erlang/sum_tail.erl",9}]}.
    {gc_bif,'+',{f,0},3,[{x,2},{tr,{x,1},number}],{x,1}}.
    {call_only,2,{f,4}}. % sum_tail/2
  {label,5}.
    {test,is_nil,{f,3},[{x,0}]}.
    {move,{x,1},{x,0}}.
    return.


{function, module_info, 0, 7}.
  {label,6}.
    {line,[]}.
    {func_info,{atom,sum},{atom,module_info},0}.
  {label,7}.
    {move,{atom,sum},{x,0}}.
    {call_ext_only,1,{extfunc,erlang,get_module_info,1}}.


{function, module_info, 1, 9}.
  {label,8}.
    {line,[]}.
    {func_info,{atom,sum},{atom,module_info},1}.
  {label,9}.
    {move,{x,0},{x,1}}.
    {move,{atom,sum},{x,0}}.
    {call_ext_only,2,{extfunc,erlang,get_module_info,2}}.
