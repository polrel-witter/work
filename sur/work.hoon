::  %work: job discovery
::
|%
::  $app: local application
::
+$  app  [=ship =desk]
::  $site: a file with task tracking
::
+$  site  [=app =path]
::  $task-id: task identifier
::
+$  task-id  @uv
::  $task: a job
::
+$  task  @t
::  $clue: task signifier
::
+$  clue  @t
::  $action: agent poke
::
+$  action
  $%  [%clue =app clue=(unit clue)]      :: set task hint for an app
      [%surface =app paths=(list path)]  :: publish tasks for set of files
      [%ignore =app paths=(list path)]   :: stop surfacing tasks
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
