module App.Model exposing (emptyModel, Model, Page(..))

import Exts.RemoteData exposing (RemoteData(..), WebData)
import Pages.Login.Model exposing (..)
import User.Model exposing (..)


type Page
    = Login
    | PageNotFound


type alias Model =
    { activePage : Page
    , pageLogin : Pages.Login.Model.Model
    , user : WebData User
    }


emptyModel : Model
emptyModel =
    { activePage = Login
    , pageLogin = Pages.Login.Model.emptyModel
    , user = NotAsked
    }
