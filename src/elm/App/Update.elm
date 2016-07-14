module App.Update exposing (init, update, Msg(..))

import App.Model exposing (..)
import Pages.Login.Update exposing (..)


type Msg
    = PageLogin Pages.Login.Update.Msg
    | SetActivePage Page


init : ( Model, Cmd Msg )
init =
    emptyModel ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        SetActivePage page ->
            { model | activePage = page } ! []

        PageLogin msg ->
            let
                ( val, cmds, user ) =
                    Pages.Login.Update.update msg model.pageLogin

                model' =
                    { model
                        | pageLogin = val
                        , user = user
                    }
            in
                ( model', Cmd.map PageLogin cmds )
