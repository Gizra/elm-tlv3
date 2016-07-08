module App.Model exposing (emptyModel, Model, Page(..))

import Pages.Login.Model exposing (..)


type Page
    = Login
    | PageNotFound


type alias Model =
    { activePage : Page
    , pageLogin : Pages.Login.Model.Model
    }


emptyModel : Model
emptyModel =
    { activePage = Login
    , pageLogin = Pages.Login.Model.emptyModel
    }
