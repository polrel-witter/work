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
  $%  [%clue =clue]                    :: set the task hint
      [%track =app paths=(list path)]  :: track tasks within a set of files
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
