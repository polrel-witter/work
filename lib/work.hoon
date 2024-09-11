:: %work library
::
/-  *work
/+  *mip
|%
++  get-text
  |=  [=bowl:gall =app file=path]
  ^-  @t
  ~|  '{<file>} is a directory'
  =/  prefix=path
    /(scot %p ship.app)/(scot %tas desk.app)/(scot %da now.bowl)
  !<(@t .^(vase %cr (weld prefix file)))
::  +pa: parser door
::
++  pa
  |_  [=bowl:gall =clue txt=tape]
  ::  +parse: pull tasks from a file and prepend an id to each
  ::
  ++  parse
    ^-  (unit (list [task-id task]))
    |^  =/  raw=(unit (list tape))
          (rust txt comb)
        ?~  raw
          ~&(>>> "failed to parse" ~)
        ?~  u.raw
          ~&  >  "parse succeeded"
          ~&(>> "no tasks found" [~ ~])
        =/  l=(list tape)  u.raw
        =/  =task-id
          %+  slav  %uv
          (crip (weld "0v" (swag [6 4] (scow %uv eny.bowl))))
        =|  out=(list [_task-id task])
        |-
        ?~  l  `out
        =.  task-id  +(task-id)
        $(out [[task-id (crip i.l)] out], l t.l)
    ::  +comb: recursively parse a file, extracting tasks that follow an
    ::  inline clue (task hint); producing a list of tasks
    ::
    ++  comb
      |=  a=nail
      %.  a
      %+  knee  *(list tape)
      |.  ~+
      ;~  pose
        ;~  plug
          %+  cook
            |=  a=(list tape)
            (zing a)
          ;~(pfix dent ;~(pfix (jest clue) block))
          comb
        ==
        inline
        (cold ~ gay)
      ==
    ::  +take: extract a task line
    ::
    ++  take
      ;~  sfix
        ;~  plug
          (cold ' ' ;~(pose dent (star ace)))
          (star ;~(pose prn alf))
        ==
        (jest '\0a')
      ==
    ::  +inline: recurse over a line, hunting for an inline task;
    ::  discard if no task is found
    ::
    ++  inline
      %+  knee  *(list tape)
      |.  ~+
      ;~  pose
        ;~(pfix dent ;~(pfix (jest clue) ;~(plug take comb)))
        ;~(pfix ;~(pose dent prn alf) inline)
        ;~(pfix (jest '\0a') comb)
      ==
    ::  +block: extract a single or multi-line task
    ::
    ++  block
      %+  knee  *(list tape)
      |.  ~+
      ;~  pose
        ::  terminate task extraction when a non-:: rune is reached
        ::
        %+  cold  ~
        ;~(less dent ;~(pose ;~(plug rune) ;~(plug (star ace) rune)))
        ::  otherwise, keep extracting the task
        ::
        ;~(plug take block)
      ==
    ::  +dent: parse a the beginning of a comment, with or w/o
    ::  whitespace
    ::
    ++  dent
      ;~  pose
        ;~(plug col col (star ace))
        ;~(plug col col)
        ;~(plug (star ace) col col (star ace))
        ;~(plug (star ace) col col)
      ==
    ::  +rune: match a rune
    ::
    ++  rune
      ;~(plug haf haf)
    ::  +haf: match a piece of a rune
    ::
    ++  haf
      ;~  pose
        bar
        buc
        cab
        cen
        col
        com
        dot
        fas
        gar
        gal
        hep
        ket
        lus
        mic
        pam
        pat
        sig
        tar
        tis
        wut
        hep
        zap
      ==
    --
  --
--
