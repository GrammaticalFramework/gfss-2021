concrete UnixConc of Unix = {

  lin
    -- Add flags to a command
    -- NB. this grammar has no guarantee that flags match the command
    AddFlag f c = {s = c.s ++ f.s} ;

    Ls = {s = "ls"} ;
    All = {s = "-a"} ;
}
