# Warnings.

I TAKE NO RESPONSIBILITY FOR THE THIS.  YOU ARE USING IT AT YOUR OWN
RISK.  I SAY THIS BECAUSE I AM NOT PRETENDING TO KNOW WHAT "MAINTAINERS"
USE TO DOUBLE CHECK / SAFTEY CHECK THE PRODUCTION OF A DEB FILE

I have NO idea how the "maintainers" actually create thier releases.

I examine a recent .DEB file and then worked to find out what I thought
needed to be put into one.  I am at this stage shamlessly copying things
because that is what was in the maintainers deb.  I should really
quetion every man file, etc.

This is going to be imperfect.

The "control" file here is generic as all get out

## Purpose

This is being used to learn more about creating a deb file for a larger scale project.  Plus sometimes its awkward to find a deb file for new versions of projects.
I do not ever recall having a source file contain the code to build the deb or rpm alongside it.

## This is designed for libz 1.3.1

This script is designed to create a DEB file based on a fresh compile of libz 1.3.1

## Getting this

```bash
git clone https://github.com/tlh45342/create-libz-deb.git
```

The next steps should consist only of

```bash
cd create-libz-deb
make
```
## Additional note

Because I am ~~lazy~~ efficient I have set the default all target to execute "pullsource" "buildsource" ; "buildeb"
In this way it should attempt to go get the source; break it out; execute configure and then make it.
In this way the binaries can be configured that can then begin the next step of construbcting the deb.

## OVERZELOUS MUCH

Yes I am probably being a litte caustious in some of my Makefile for constructing the DEB directory structure.  So be it.

## Assumptions

This does assume you have basic development tools install such as gcc; make and the like.
