module App.Model exposing (emptyModel, Model, Page(..))


type Page
    = Login
    | PageNotFound


type alias Model =
    { activePage : Page
    }


emptyModel : Model
emptyModel =
    { activePage = Login
    }
