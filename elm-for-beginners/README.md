# Course: Elm for Beginners

Course notes

## Hello World

```
elm package install elm-lang/html
```

```elm
module Main exposing (..)

import Html


main =
    Html.text "Hello World"
```

```
elm reactor
```

## Functions

```elm
module main exposing (..)

import Html

add a b =
  a + b

result =
  add 1 2

main =
  Html.text result
```

* The pipe operator is `|>`.
* Anonymous functions use Haskell syntax with a backslash
* Elm ensures that functions are pure, i.e. do not modify state (the outside world)
* You can use let-in blocks like in Haskell

## Resources

* [Elm Syntax](http://elm-lang.org/docs/syntax)
* [Elm for Beginners](http://courses.knowthen.com/courses/elm-for-beginners)
* [Course Github Repo](https://github.com/knowthen/elm)
* [Elm Packages](http://package.elm-lang.org/)
