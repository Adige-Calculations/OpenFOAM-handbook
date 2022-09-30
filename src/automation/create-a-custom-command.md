Open the file \~/.bashrc and write at the end of this file the command
you need following this layout

alias \<nameCommand\>=’\<list of command you want execute digiting
nameCommand\>’

For example, a useful alias which create a dummy file with the name of
the directory and then open ParaView in series:
```console
alias ParaView ='touch "${PWD\#\#\*/}".foam && ParaView "${PWD\#\#\*/}".foam
```