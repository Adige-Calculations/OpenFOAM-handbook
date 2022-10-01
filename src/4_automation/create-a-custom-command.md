## Create a custom command

To create a personalized command, if you are using bash as a shell for you OS like in most of the UNIX like OS out there.
Open its config file with:
```console
micro ~/.bashrc
```
write at the end of this file the command
you need following this layout

```console
alias \<nameCommand\>=’\<list of command you want execute digiting
nameCommand\>’
```

For example, a useful alias which create a dummy file with the name of
the directory and then open ParaView in series is declared as following:
```console
alias ParaView ='touch "${PWD\#\#\*/}".foam && ParaView "${PWD\#\#\*/}".foam
```