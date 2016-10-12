# Course: Elm Beyond the Basics

Course notes

## Review

Quick recap of the basics of Elm.

The basic cycle is Model -> View -> Update.

```
elm package install elm-lang/Html
elm reactor
```

## The Elm Architecture

A realistic size up should be broken up into several modules and a pattern we
can use is to have one module per page. Each page module has its own
model-update-view sections. There is a Main module that also has model-update-view
sections that delegate to the corresponding page modules.

The name of the module for each page must match its filename. The modules need to expose their
model-view-update functions.
