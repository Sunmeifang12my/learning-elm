module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App exposing (beginnerProgram)


type alias Model =
    Int


initModel : Model
initModel =
    0


type Msg
    = AddCalorie
    | Clear


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddCalorie ->
            model + 1

        Clear ->
            initModel


view : Model -> Html Msg
view model =
    div []
        [ h3 []
            [ text ("Total calories: " ++ (toString model)) ]
        , button
            [ type' "button"
            , onClick AddCalorie
            ]
            [ text "Add" ]
        , button
            [ type' "button"
            , onClick Clear
            ]
            [ text "Clear" ]
        ]


main : Program Never
main =
    beginnerProgram
        ({ model = initModel
         , update = update
         , view = view
         }
        )
