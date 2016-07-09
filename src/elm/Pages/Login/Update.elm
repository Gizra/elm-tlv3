module Pages.Login.Update exposing (update, Msg(..))

import Exts.RemoteData exposing (RemoteData(..), WebData)
import Http
import Task
import User.Decoder exposing (..)
import User.Model exposing (..)
import Pages.Login.Model as Login exposing (..)


type Msg
    = FetchFail Http.Error
    | FetchSucceed User
    | SetLogin String
    | TryLogin


init : ( Model, Cmd Msg )
init =
    emptyModel ! []


update : Msg -> Model -> ( Model, Cmd Msg, WebData User )
update msg model =
    case msg of
        FetchSucceed github ->
            ( model, Cmd.none, Success github )

        FetchFail err ->
            ( model, Cmd.none, Failure err )

        SetLogin login ->
            ( { model | login = login }, Cmd.none, NotAsked )

        TryLogin ->
            ( model, fetchFromGitHub model.login, Loading )


{-| Get data from GitHub.
-}
fetchFromGitHub : String -> Cmd Msg
fetchFromGitHub login =
    let
        url =
            "https://api.github.com/users/" ++ login
    in
        Task.perform FetchFail FetchSucceed (Http.get decodeFromGithub url)
