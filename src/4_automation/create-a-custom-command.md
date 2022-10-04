## Create a custom command

To create a personalized command, if you are using bash as a OS shell like
in most of the UNIX like system, write at the end of your shell config file

```console
echo "alias <\nameCommand\>=’<\list of command you want execute digiting
nameCommand\>" >> ~/.bashrc’
```

For example, a useful alias which create a dummy file with the name of
the directory and then open ParaView in series is declared as following:
```console
alias ParaView ='touch "${PWD\#\#\*/}".foam && ParaView "${PWD\#\#\*/}".foam
```