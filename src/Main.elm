module Main exposing (main)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)


main : Program () Model Msg
main =
    Browser.element { init = init, update = update, view = view, subscriptions = subscriptions }



-- MODEL


type alias Inventory =
    { wood : Int
    , stone : Int
    , berries : Int
    }


type Location
    = Camp Activities
    | Forest Activities


type alias Model =
    { playerLocation : Location
    , playerInventory : Inventory
    , campInventory : Inventory
    }


type Activity
    = SupplyDrop Bool Inventory
    | Tree
    | Rock
    | BerryBush


type alias Activities =
    List Activity


emptyInventory : Inventory
emptyInventory =
    { wood = 0
    , stone = 0
    , berries = 0
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( { playerLocation = Camp []
      , playerInventory = emptyInventory
      , campInventory = emptyInventory
      }
    , Cmd.none
    )



-- UPDATE


type Msg
    = NoOp
    | MoveLocation Location


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


locationHeader : Model -> Html Msg
locationHeader model =
    let
        locationButton : String
        locationButton =
            "btn w-32"

        locationSrc : String
        locationSrc =
            case model.playerLocation of
                Camp _ ->
                    "camp.png"

                Forest _ ->
                    "forest.png"
    in
    div [ class "flex items-center space-x-4" ]
        [ div [ class "flex items-center space-x-2" ]
            [ img [ src locationSrc ] []
            , div [ class "underline text-4xl w-32" ]
                [ text <|
                    case model.playerLocation of
                        Camp _ ->
                            "Camp"

                        Forest _ ->
                            "Forest"
                ]
            ]
        , div [ class "flex items-center space-x-2" ]
            [ case model.playerLocation of
                Camp _ ->
                    button [ class locationButton, onClick <| MoveLocation (Forest []) ] [ text "=> Forest" ]

                Forest _ ->
                    button [ class locationButton, onClick <| MoveLocation (Camp []) ] [ text "=> Camp" ]
            ]
        ]


view : Model -> Html Msg
view model =
    div [ class "flex-col p-6 space-y-4" ]
        [ locationHeader model
        ]
