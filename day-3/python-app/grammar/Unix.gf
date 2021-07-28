abstract Unix = {
  flags startcat = Command ;
  cat
    Command ;
    Flag ;

  fun
    -- Add flags to a command
    -- NB. this grammar has no guarantee that flags match the command
    AddFlag : Flag -> Command -> Command ; -- ls -l -a

    Ls : Command ; -- ls is already a standalone command
    All : Flag ;   -- -a
}
