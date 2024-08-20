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
  $%  [%clue =clue]                     :: set the task hint
      [%track =app paths=(list path)]   :: track a list of files for tasks
      [%ignore =app paths=(list path)]  :: stop tracking list of files
      [%reparse =app =path]             :: reparse a file we'realready tracking
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
