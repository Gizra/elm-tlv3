module Pages.Login.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput, onSubmit)
import Pages.Login.Model exposing (..)
import Pages.Login.Update exposing (..)


view : Model -> Html Msg
view model =
    Html.form
        [ action "javascript:void(0);"
        , class "ui stacked segment"
        ]
        [ div [ class "ui action input" ]
            [ input
                [ type' "text"
                , placeholder "Github name"
                , onInput SetLogin
                , value model.login
                ]
                []
              -- Submit button
            , button
                [ class "ui primary button"
                , onClick TryLogin
                ]
                [ text "Login" ]
            ]
        ]
