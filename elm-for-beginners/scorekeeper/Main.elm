module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App


type alias Model =
    { players : List Player
    , name : String
    , playerId : Maybe Int
    , plays : List Play
    }


type alias Player =
    { id : Int
    , name : String
    , points : Int
    }


type alias Play =
    { id : Int
    , playerId : Int
    , name : String
    , points : Int
    }


initModel : Model
initModel =
    { players = []
    , name = ""
    , playerId = Nothing
    , plays = []
    }


type Msg
    = Edit Player
    | Score Player Int
    | Input String
    | Save
    | Cancel
    | DeletePlay Play


updatePlayer : Int -> Model -> Model
updatePlayer playerId model =
    let
        players =
            List.map
                (\p ->
                    if p.id == playerId then
                        { p
                            | name = model.name
                        }
                    else
                        p
                )
                model.players
    in
        { model
            | players = players
        }


createPlayer : Model -> Model
createPlayer model =
    let
        newPlayer =
            Player 123 model.name 0

        players =
            newPlayer :: model.players
    in
        { model
            | players = players
        }


savePlayer : Model -> Model
savePlayer model =
    case model.playerId of
        Just playerId ->
            updatePlayer playerId model

        Nothing ->
            createPlayer model


update : Msg -> Model -> Model
update msg model =
    case msg of
        Input name ->
            Debug.log "Input updated model"
                { model | name = name }

        Save ->
            savePlayer model

        Cancel ->
            { model
                | name = ""
                , playerId = Nothing
            }

        _ ->
            model


view : Model -> Html Msg
view model =
    div [ class "scoreboard" ]
        [ h1 []
            [ text "Score Keeper" ]
        , playerForm model
        , p [] [ text (toString model) ]
        ]


playerForm : Model -> Html Msg
playerForm model =
    Html.form [ onSubmit Save ]
        [ input
            [ type' "text"
            , placeholder "Add/Edit player"
            , onInput Input
            , value model.name
            ]
            []
        , button [ type' "submit", onClick Save ] [ text "Save" ]
        , button [ type' "button", onClick Cancel ] [ text "Cancel" ]
        ]


main : Program Never
main =
    App.beginnerProgram
        { model = initModel
        , view = view
        , update = update
        }
