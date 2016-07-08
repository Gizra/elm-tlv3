module Pages.Login.Update exposing (update, Msg(..))

import Pages.Login.Model as Login exposing (..)


type Msg
    = SetLogin String


init : ( Model, Cmd Msg )
init =
    emptyModel ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetLogin login ->
            { model | login = login } ! []
