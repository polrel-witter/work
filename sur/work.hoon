::  %work: job discovery
::
|%
::  $app: local application
::
+$  app  [=ship =desk]
::  $flag: task id
::
+$  flag  @uv
::  $task: some job
::
+$  task  @t
::  $clue: task signifier
::
+$  clue  _'TODO'
::  $action: agent poke
::
+$  action
  $%  [%clue =app =clue]                 :: set task hint for an app
      [%surface =app =clue paths=(list path)]  :: publish tasks for set of files
      [%ignore =app paths=(list path)]   :: stop surfacing tasks
      [%reparse =app =path]              :: reparse a file we're surfacing
  ==
::  +records: sss structures
::
++  records
  |%
  ++  name  %records
  +$  rock  =clue
  +$  wave  =clue
  ++  wash  |=([=rock =wave] rock(clue wave))
  --
--
