module Main exposing (..)

import String
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
        newPlayers =
            List.map
                (\player ->
                    if player.id == playerId then
                        { player
                            | name = model.name
                        }
                    else
                        player
                )
                model.players

        newPlays =
            List.map
                (\play ->
                    if play.playerId == playerId then
                        { play
                            | name = model.name
                        }
                    else
                        play
                )
                model.plays
    in
        { model
            | players = newPlayers
            , plays = newPlays
        }


createPlayer : Model -> Model
createPlayer model =
    let
        newId =
            (List.length model.players) + 1

        newPlayer =
            Player newId model.name 0

        newPlayers =
            newPlayer :: model.players
    in
        { model
            | players = newPlayers
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
            if (String.isEmpty model.name) then
                model
            else
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
        , button [ type' "submit" ] [ text "Save" ]
        , button [ type' "button", onClick Cancel ] [ text "Cancel" ]
        ]


main : Program Never
main =
    App.beginnerProgram
        { model = initModel
        , view = view
        , update = update
        }
