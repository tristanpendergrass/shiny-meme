module Main exposing (main)

import Browser
import Html exposing (Html, div, text)
import Html.Attributes exposing (class)


main : Program () Model Msg
main =
    Browser.element { init = init, update = update, view = view, subscriptions = subscriptions }



-- MODEL


type alias Model =
    String


init : () -> ( Model, Cmd Msg )
init _ =
    ( "Why hello there", Cmd.none )



-- UPDATE


type Msg
    = HandleThingInput String


update : Msg -> Model -> ( Model, Cmd Msg )
update msg _ =
    case msg of
        HandleThingInput str ->
            ( str, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div [ class "flex-col p-6 space-y-4" ]
        [ div []
            [ div [ class "text-xl underline" ] [ text "Logging" ]
            , div [ class "" ] [ text <| "Wood: " ++ String.fromInt 5 ]
            ]
        ]
