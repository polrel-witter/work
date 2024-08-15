|%
::
+|  %types
::
::  $flag: identifier
::
+$  flag  (pair ship term)
::  $about: job description; an udon file
::
+$  about  (unit manx)
::  $payment: compensation amount
::
+$  payment  (unit @rs)
::  $worker: job contributor
::
+$  worker  (pair ?(%hired %claimed) ship)
::  $bound: organizing entity that generates work
::
+$  bound  $@(ship (pair ?(%desk %group) flag))
::  $period: job duration
::
+$  period  [start=(unit time) end=(unit time)]
::  $status: state of a job
::
+$  status
  $~  %draft
  $?  %draft        :: created, unpublished
      %open         :: published, accepting inquiries
      %in-progress  :: underway
      %done         :: complete
  ==
::  $job: a scope of work and its metadata
::
+$  job
  $:  title=cord
	    =about
	    =period
      =status
      =payment
      =bound
	    tags=(set term)
	    workers=(set worker)
  ==
::  $board: a set of jobs organized by bound
::
+$  board  [=about tags=(set term) jobs=(map flag job)]
::  +subs: sss structures
::
++  subs
  |%
  ++  name  %subs
  +$  rock  =board
  +$  wave
    $%  [%job =flag =job]
        [%board =board]
    ==
  ++  wash
    |=  [=rock =wave]
    ^+  rock
    ?-    -.wave
        %board  rock(board board.wave)
        %job
      =,  wave
      %_  rock
        board  (~(put by jobs.board.rock) flag job)
      ==
    ==
  --
::
+|  %commands
::
::  $job-edit: modify a piece of a job
::
+$  job-edit
  $%  [%title title=cord]
      [%about =about]
      [%period =period]
      [%status =status]
      [%payment =payment]
      [%bound =bound]
      [%tags (list term)]
      [%workers (list worker)]
  ==
::  $job-action: act on a job
::
+$  job-action
  %+  pair  flag
  $%  [%create =job]
      [%delete ~]
      [%edit =job-edit]
      [%claim ~]
  ==
::  $board-action: act on a board
::
+$  board-action
  %+  pair  bound
  $%  [%save =about]
      [%delete ~]
  ==
::  $action: agent poke
::
+$  action
  $%  [%job =job-action]
      [%board =board-action]
  ==
--
