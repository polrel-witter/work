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
::
++  pa
  |_  [=bowl:gall =clue txt=tape]
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
    ::
    ++  take
      |=  a=nail
      %.  a
      ~&  a
      %+  knee  *(list tape)
      |.  ~+
      ;~  pose
        :: hunt for clue and extract the task
        ;~(plug ;~(pfix dent ;~(pfix (jest clue) line)) take)
        :: keep going until '\0a' and then code
        :: ;~(pfix dent pull)
        :: terminate at first rune
        ::;~(pfix ;~(plug dent (just '\0a')) take)
        :: continue cycling
        ;~(pfix line take)
        (cold ~ gay)
      ==
    ::
    ++  line
      ;~(sfix (star ;~(pose prn alf)) (jest '\0a'))
    ::
    :: TODO refactor: probably simpler config
    ++  dent
      ;~  pose
        ;~(plug col col (star ace))
        ;~(plug col col)
        ;~(plug (star ace) col col (star ace))
        ;~(plug (star ace) col col)
      ==
    ::
    ++  rune
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
