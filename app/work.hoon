::  %work: job discovery
::
/-  *work
/+  *sss, *mip, verb, dbug, default-agent
::
|%
::
+$  versioned-state  $%(state-0)
::
+$  state-0
  $:  %0
      sites=(jug app path)                       :: files with task tracking
      clues=(map app clue)                       :: task hints by app
      tasks=(mip path flag task)                 :: all surfaced tasks
      subs=_(mk-subs records ,[%records @ @ ~])  :: subscriptions
      pubs=_(mk-pubs records ,[%records @ @ ~])  :: publications
  ==
::
+$  card  card:agent:gall
::
--
::
%+  verb  &
%-  agent:dbug
=|  state-0
=*  state  -
::
^-  agent:gall
::
=<
  |_  =bowl:gall
  +*  this  .
      def  ~(. (default-agent this %|) bowl)
      cor  ~(. +> [bowl ~])
  ::
  ++  on-init
    ^-  (quip card _this)
    =^  cards  state  abet:init:cor
    [cards this]
  ::
  ++  on-save
    ^-  vase
    !>(state)
  ::
  ++  on-load
    |=  =vase
    ^-  (quip card _this)
    =^  cards  state  abet:(load:cor vase)
    [cards this]
  ::
  ++  on-poke
    |=  =cage
    ^-  (quip card _this)
    =^  cards  state  abet:(poke:cor cage)
    [cards this]
  ::
  ++  on-peek
    |=  =path
    ^-  (unit (unit cage))
    [~ ~]
  ::
  ++  on-agent
    |=  [=wire =sign:agent:gall]
    ^-  (quip card _this)
    =^  cards  state  abet:(agent:cor wire sign)
    [cards this]
  ::
  ++  on-arvo
    |=  [=wire =sign-arvo]
    ^-  (quip card _this)
    `this
  ::
  ++  on-watch
    |=  =path
    ^-  (quip card _this)
    `this
  ::
  ++  on-fail   on-fail:def
  ++  on-leave  on-leave:def
  --
|_  [=bowl:gall dek=(list card)]
+*  cor  .
    du-records    =/  du  (du records ,[%records @ @ ~])
                  (du pubs bowl -:!>(*result:du))
    da-records    =/  da  (da records ,[%records @ @ ~])
                  (da subs bowl -:!>(*result:da) -:!>(*from:da) -:!>(*fail:da))
::
++  emit  |=(=card cor(dek [card dek]))
++  emil  |=(lac=(list card) cor(dek (welp lac dek)))
++  abet  ^-((quip card _state) [(flop dek) state])
::  +sss-pubs: update +cor cards and pubs state
::
::   sss library produces a (quip card _pubs) so we need to split it
::   to write to +cor state
::
++  sss-pubs
  |=  [c=(list card) p=_pubs]
  ^+  cor
  =.  pubs  p
  (emil c)
::  +sss-subs: update +cor cards and subs state
::
++  sss-subs
  |=  [c=(list card) s=_subs]
  ^+  cor
  =.  subs  s
  (emil c)
::
++  init
  ^+  cor
  %-  emit
  [%pass /eyre/connect %arvo %e %connect [~ /apps/work] %work]
::
++  load
  |=  =vase
  ^+  cor
  ?>  ?=([%0 *] q.vase)
  cor(state !<(state-0 vase))
::
++  poke
  |=  [=mark =vase]
  ^+  cor
  ?+    mark  ~|(bad-poke+mark !!)
      %action
    =/  act  !<(action vase)
    ?.  =(src.bowl our.bowl)  cor
    ?-    -.act
        %clue  !!
      :: TODO add to $clues and refactor to reparse by app
   ::   ?:  =(clue clue.act)
   ::     ~&(>> "{<clue.act>} already set as task hint" cor)
   ::   =/  paths=(list path)
   ::     %-  zing
   ::     %+  murn  ~(tap in ~(key by sites))
   ::     |=  =app
   ::     ?.  =(our.bowl ship.app)  ~
   ::     `~(tap in (~(get ju sites) app))
   ::   ?~  paths  cor
      :: TODO reparse all files in path list
      cor
    ::
        %ignore
      ?.  =(ship.app.act our.bowl)
        ~&(>> "cannot track another ship's desk" cor)
      =.  sites
        |-
        ?~  paths.act  sites
        %=  $
          sites  (~(del ju sites) app.act i.paths.act)
          paths.act  t.paths.act
        ==
      =.  tasks
        |-
        ?~  paths.act  tasks
        $(tasks (~(del by tasks) i.paths.act), paths.act t.paths.act)
      cor
    ::
        %reparse  !!
    ::
        %track
      |^
      ?.  =(ship.app.act our.bowl)
        ~&(>> "cannot track another ship's desk" cor)
      ::  is the app installed?
      ::
      =/  live-desks=(map desk [=zest:clay *])
        .^(rock:tire:clay %cx /(scot %p our.bowl)//(scot %da now.bowl)/tire)
      ?~  status=(~(get by live-desks) desk.app.act)
        ~&(>> "{<desk.app.act>} not found" cor)
      ?:  ?=(%dead zest.u.status)
        ~&(>> "{<desk.app.act>} is %dead" cor)
      ::  are we the maintainer?
      ::
      =/  remote-desks=(map [desk ship desk] *)
        .^  (map [desk ship desk] *)
          %gx
          /(scot %p our.bowl)/hood/(scot %da now.bowl)/kiln/syncs/noun
        ==
      ?:  (is-remote app.act ~(tap in ~(key by remote-desks)))
        ~&(>> "{<desk.app.act>} is a remote desk" cor)
      ::  do we have the files we want to track?
      ::
      =/  local-paths=(list path)
        .^  (list path)
          %ct
          /(scot %p our.bowl)/(scot %tas desk.app.act)/(scot %da now.bowl)
        ==
      ?~  local-paths
        ~&(>> "no paths found in {<desk.app.act>}" cor)
      =/  paths-to-parse=(list path)
        =/  l=(set path)
          (silt local-paths)
        %+  murn  paths.act
        |=  =path
        ?.  (~(has in l) path)
          ~&(>> "{<path>} not found in {<desk.app.act>}" ~)
        `path
      ::  update sites and parse files
      ::
      =.  sites
        =+  p=paths-to-parse
        |-
        ?~  p  sites
        $(sites (~(put ju sites) app.act i.p), p t.p)
      :: TODO (parse paths-to-parse)
      ::
      ::  subscribe to file changes so we know when to reparse
      ::
      =.  cor
        %-  emil
        %+  turn  paths.act
        |=  =path
        ^-  card
        =/  =task:clay
          [%warp our.bowl desk.app.act ~ %next %u [%da now.bowl] path]
        [%pass /update %arvo %c task]
      cor
      ::  +is-remote: are we the maintainer?
      ::
      ++  is-remote
        |=  [=app desks=(list [=desk * *])]
        |-  ^-  ?
        ?~  desks  |
        ?:(=(desk.app desk.i.desks) & $(desks t.desks))
      --
    ==
  ::
      %sss-to-pub
    =/  msg  !<(into:du-records (fled vase))
    (sss-pubs (apply:du-records msg))
  ::
      %sss-subs
    =/  msg  !<(into:da-records (fled vase))
    (sss-subs (apply:da-records msg))
  ::
      %sss-fake-on-rock
    =/  msg  !<(from:da-records (fled vase))
    ?>  ?=([[%records @ @ ~] *] msg)
    (emil (handle-fake-on-rock:da-records msg))
  ::
      %sss-on-rock
    :: TODO this is where sub updates come in
    |^
    =/  msg  !<(from:da-records (fled vase))
    ?>  ?=([[%records @ @ ~] *] msg)
    ?>  =(our.bowl `ship`+>-:path.msg)
  ::  =/  name=term  +<:path.msg
  ::  =/  update=clue
  ::    ?~(wave.msg rock.msg u.wave.msg)
    cor
    --
  ==
::
++  agent
  |=  [=wire =sign:agent:gall]
  ^+  cor
  ?+    wire  cor
      [~ %sss %on-rock @ @ @ %records @ @ ~]
    =.  subs
      (chit:da-records |3:wire sign)
    cor
  ::
      [~ %sss %scry-request @ @ @ %records @ @ ~]
    (sss-subs (tell:da-records |3:wire sign))
  ::
      [~ %sss %scry-response @ @ @ %records @ @ ~]
    (sss-pubs (tell:du-records |3:wire sign))
  ==
::
--
