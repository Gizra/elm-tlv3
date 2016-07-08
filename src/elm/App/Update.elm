module App.Update exposing (init, update, Msg(..))

import App.Model exposing (..)


type Msg
    = SetActivePage Page


init : ( Model, Cmd Msg )
init =
    emptyModel ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetActivePage page ->
            { model | activePage = page } ! []
