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

```elm
List.map ((+) 2) [1, 2, 3]
List.map (\n -> n + 2) [1, 2, 3]
```

You can create your own infix functions (use sparingly). All functions with names with only non-alphanumeric characters are considered infix by Elm:

```elm
(~+) a b =
  a + b + 0.1
1 ~+ 2 -- > 3.1
(~+) 1 2 -- > 3.1
```

Like in Haskell, you can invoke prefix functions as infix functions with backticks:

```elm
add a b =
  a + b

1 `add` 2
```

Functions are curried.

It's worthwhile looking through the [Basics functions]() in the core package.

The default imports in Elm are:

```elm
import Basics exposing (..)
import Debug
import List exposing ( List, (::) )
import Maybe exposing ( Maybe( Just, Nothing ) )
import Result exposing ( Result( Ok, Err ) )
import Platform exposing ( Program )
import Platform.Cmd exposing ( Cmd, (!) )
import Platform.Sub exposing ( Sub )
```

## Resources

* [Elm Syntax](http://elm-lang.org/docs/syntax)
* [Elm for Beginners](http://courses.knowthen.com/courses/elm-for-beginners)
* [Course Github Repo](https://github.com/knowthen/elm)
* [Elm Packages](http://package.elm-lang.org/)
