module Main exposing (..)

import Html exposing (div)
import String


add a b =
    a + b


result =
    add 1 2 |> add 5 |> \x -> x % 2 == 0


counter =
    0


increment cnt amt =
    let
        localCount =
            cnt + 1
    in
        localCount


uppercaseLongName name =
    let
        resultName =
            if (String.length name) > 10 then
                String.toUpper name
            else
                name
    in
        resultName ++ " - name length: " ++ (String.length resultName |> toString)


main =
    div []
        [ Html.text (toString result)
        , Html.text
            (uppercaseLongName "Peter Marklund")
        ]
