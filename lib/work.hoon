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
  ::  +parse: parse a tape, extracting tasks that follow an inline clue
  ::  (task hint)
  ::
  ++  parse
    ^-  (list [task-id task])
    |^  =/  raw=(list tape)
          (scan txt take)
        ~&  raw
        =/  =task-id
          %+  slav  %uv
          (crip (weld "0v" (swag [6 4] (scow %uv eny.bowl))))
        =|  out=(list [_task-id task])
        |-
        ?~  raw  out
        =.  task-id  +(task-id)
        $(out [[task-id (crip i.raw)] out], raw t.raw)
    ::  +take: recursively parse a file
    ::
    ++  take
      |=  a=nail
      %.  a
      ~&  a
      %+  knee  *(list tape)
      |.  ~+
      ;~  pose
        ::  hunt for task hint, and extract task if found
        ::
        ;~  plug
          %+  cook
            |=  a=(list tape)
            (zing a)
          ;~(pfix dent ;~(pfix (jest clue) block-task))
          take
        ==
        ::  ignore non-task line
        ::
        ;~(pfix ;~(sfix line (jest '\0a')) take)
        (cold ~ gay)
      ==
    ::  +line: parse a printable line
    ::
    ++  line
      (star ;~(pose prn alf))
    ::  +block-task: extract a single or multi-line task
    ::
    ++  block-task
      %+  knee  *(list tape)
      |.  ~+
      ;~  pose
        ::  terminate task extraction when a non-:: rune is reached
        ::
        %+  cold  ~
        ;~(less dent ;~(pose ;~(plug rune) ;~(plug (star ace) rune)))
        ::  otherwise, keep extracting the task
        ::
        ;~  plug
          ;~  sfix
            ;~(plug (cold ' ' ;~(pose dent (star ace))) line)
            (jest '\0a')
          ==
          block-task
        ==
      ==
    ::  +dent: parse a the beginning of a comment
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
