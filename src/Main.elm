module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main : Program () Model Msg
main =
    Browser.element { init = init, update = update, view = view, subscriptions = subscriptions }



-- MODEL


type PlayerLocation
    = City
    | Fields


type alias Model =
    { playerLocation : PlayerLocation }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { playerLocation = City }, Cmd.none )



-- UPDATE


type Msg
    = NoOp
    | MoveLocation PlayerLocation


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        MoveLocation newLocation ->
            ( { model
                | playerLocation = newLocation
              }
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "flex-col p-6 space-y-4" ]
        [ div []
            [ div [ class "text-xl underline" ] [ text "Location" ]
            , div [ class "" ]
                [ text <|
                    case model.playerLocation of
                        City ->
                            "City"

                        Fields ->
                            "Fields"
                ]
            , div [ class "flex items-center space-x-2" ]
                [ button [ class "btn", onClick <| MoveLocation City ] [ text "Move to city" ]
                , button [ class "btn", onClick <| MoveLocation Fields ] [ text "Move to fields" ]
                ]
            ]
        ]
