:: extra functions for %work
::
/-  *work
/+  *mip
|%
++  pa
  |_  [=app =bowl:gall]
  ::
  ++  get-text
    |=  file=path
    ^-  @t
    ~|  '{<file>} is a directory'
    =/  prefix=path
      /(scot %p ship.app)/(scot %tas desk.app)/(scot %da now.bowl)
    !<(@t .^(vase %cr (weld prefix file)))
  ::
  ++  parse
    |=  [=clue text=@t]
    ^-  (list [task-id task])
    :: TODO stubbed test data to test parser calls; still need to
    :: implement
    =/  =task-id
      %+  slav  %uv
      (crip (weld "0v" (swag [6 4] (scow %uv eny.bowl))))
    ~[[task-id 'this is a task'] [+(task-id) 'and so is this']]
  --
--
