Hack Steve's Secters
==
Copyright (C) 2015 V. Atlidakis

COMS W4187 Fall 2015, Columbia University

## Project structure

* Makefile: build, test, exec
* src/interpose.c:  Intrerposing on strcat
* scripts/shark.sh: reproduces the buffer overflow

## Notes
* In order to identify the secret path, we executed
  strings /home/w4187/hw4\_bin/pretend-hw and found ou
  that the binary has a hidden debug option. Thereafter,
  it was quite straightforward to recover the secret.

* For the buffer overflow, we exected the submission
  binary and found out the use of \_unsafe\_ sprintf.
  Then, I wrote a trivial script trying different lenghts
  on the environent variables.

* For the bug/hole, I interpose  on strcat, which is used
  to constract the final filename -- after all checks are done,
  and thereforeI can create a file with arbitrary name, not starting
  with my user name.

## Exec - Test
* make exec : to interpose and create forbidden file.
* shark.sh : to cause buffer overflow. 
