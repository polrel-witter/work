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
    =^  cards  state  abet:(arvo:cor wire sign-arvo)
    [cards this]
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
++  arvo
  |=  [=wire =sign-arvo]
  ^+  cor
  ?+    wire  ~|(bad-arvo-wire+wire !!)
      [%eyre %connect ~]
    ?.  ?=([%eyre %bound *] sign-arvo)
      ~|(unexpected-system-response+sign-arvo !!)
    ~?  !accepted.sign-arvo
      [dap.bowl 'eyre bind rejected!' binding.sign-arvo]
    cor
  ::
      [%update *]
    ?+    t.wire  ~|(bad-arvo-wire+wire !!)
        [%file @ *]
      ?.  ?=([%clay %writ *] sign-arvo)
        ~|(unexpected-system-response+sign-arvo !!)
      =/  =desk  (slav %tas i.t.t.wire)
      =/  =path  t.t.t.wire
      =/  =riot:clay  p.sign-arvo
      ?~  riot
        =/  update=(unit _cor)
          %-  mole
          |.  (poke action+!>(`action`[%ignore [our.bowl desk] [path]~]))
        ?~  update
          ~&(>>> "failed to ignore {<path>}, still tracking" cor)
        =.  cor  u.update
        cor
      :: TODO parse the updated file which is included in the riot
      ::
      ~&  >  "resubscribing to {<path>}"
      (track-file %start desk [path]~)
    ==
  ==
::  +is-live: is the app installed and alive?
::
++  is-live
  |=  =desk
  ^-  ?
  =/  live-desks=rock:tire:clay
    .^(rock:tire:clay %cx /(scot %p our.bowl)//(scot %da now.bowl)/tire)
  ?~  status=(~(get by live-desks) desk)
    ~&(>>> "{<desk>} desk not found" |)
  ?.  ?=(%dead zest.u.status)  &
  ~&(>>> "{<desk>} desk is %dead" |)
::  +we-maintain: are we the maintainer of a desk?
::
++  we-maintain
  |^  |=  crook=desk
      ^-  ?
      =/  remote-desks=(map [desk ship desk] *)
        .^  (map [desk ship desk] *)
          %gx
          /(scot %p our.bowl)/hood/(scot %da now.bowl)/kiln/syncs/noun
        ==
      ?.  (is-remote crook ~(tap in ~(key by remote-desks)))  &
      ~&(>>> "{<crook>} is a remote desk, not tracking" |)
  ::
  ++  is-remote
    |=  [crook=desk desks=(list [=desk * *])]
    |-  ^-  ?
    ?~  desks  |
    ?:(=(crook desk.i.desks) & $(desks t.desks))
  --
::  +file-check: remove files from a (list path) that aren't in a
::  particular desk
::
++  file-check
  |=  [=desk paths=(list path)]
  ^+  paths
  =/  local-paths=(list path)
    .^  (list path)
      %ct
      /(scot %p our.bowl)/(scot %tas desk)/(scot %da now.bowl)
    ==
  ?~  local-paths
    ~&(>>> "no paths found in {<desk>}" ~)
  =/  l=(set path)
    (silt local-paths)
  %+  murn  paths
  |=  =path
  ?.  (~(has in l) path)
    ~&(>> "{<path>} not found in {<desk>}" ~)
  `path
::  +track-file: subscribe to or cancel tracking updates to a list of files in
::  Clay
::
++  track-file
  |=  [act=?(%start %stop) =desk paths=(list path)]
  ^+  cor
  %-  emil
  %+  turn  paths
  |=  =path
  ^-  card
  =;  =task:clay
    =/  =wire
      (weld /update/file/(scot %tas desk) path)
    [%pass wire %arvo %c task]
  :*  %warp
      our.bowl
      desk
      ?-  act
        %stop   ~                                 :: cancel subscription
        %start  [~ %next %x [%da now.bowl] path]  :: subscribe
      ==
  ==
::
++  poke
  |=  [=mark =vase]
  ^+  cor
  ?+    mark  ~|(bad-poke+mark !!)
      %action
    =/  act  !<(action vase)
    ?.  =(src.bowl our.bowl)  cor
    ?-    -.act
        %clue
      =;  c=(unit clue)
        ?~  c  cor
        ~&  >  "set {<desk.app.act>} clue as {<clue.act>}"
        cor(clues (~(put by clues) app.act clue.act))
      ?~  current=(~(get by clues) app.act)
        `clue.act
      ?:  =(u.current clue.act)
        ~&(>> "{<clue.act>} already set as task hint" ~)
      ?~  paths=(~(get ju sites) app.act)
        ~&(>> "no files to reparse in {<desk.app.act>}" `clue.act)
      ~&  >  "reparsing {<desk.app.act>} files with new clue: {<clue.act>}"
      :: TODO (parse-files u.paths)
      `clue.act
    ::
        %ignore
      ?.  =(ship.app.act our.bowl)
        ~&(>>> "cannot track another ship's desk" cor)
      ?.  (is-live desk.app.act)  cor
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
      ::  cancel Clay subscription
      ::
      ~&  >  "stopped surfacing {<paths.act>}"
      (track-file %stop desk.app.act paths.act)
    ::
        %surface
      ?.  =(ship.app.act our.bowl)
        ~&(>>> "cannot surface someone else's tasks" cor)
      ?.  (is-live desk.app.act)  cor
      ?.  (we-maintain desk.app.act)  cor
      ?.  (~(has by clues) app.act)
        ~&(>>> "clue not set for {<desk.app.act>}" cor)
      =/  files-to-parse=(list path)
        (file-check desk.app.act paths.act)
      ::  update sites
      ::
      =?  sites  ?~(files-to-parse | &)
        =+  f=files-to-parse
        |-
        ?~  f  sites
        $(sites (~(put ju sites) app.act i.f), f t.f)
      ?~  files-to-parse  cor
      :: TODO (parse files-to-parse)
      ::  subscribe to file updates
      ::
      ~&  >  "surfacing {<paths.act>}"
      (track-file %start desk.app.act paths.act)
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
--
