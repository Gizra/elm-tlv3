module App.View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import App.Model exposing (..)
import App.Update exposing (..)


view : Model -> Html Msg
view model =
    case model.activePage of
        Login ->
            div [ class "ui container main" ]
                [ h2 [] [ text "Login page" ]
                , button [ onClick <| SetActivePage PageNotFound ] [ text "Change to 404 page" ]
                , pre [ class "ui padded secondary segment" ]
                    [ text <| toString model ]
                ]

        PageNotFound ->
            div [ class "ui container main" ]
                [ h2 [] [ text "Page not found" ]
                , button [ onClick <| SetActivePage Login ] [ text "Change to Login page" ]
                , pre [ class "ui padded secondary segment" ]
                    [ text <| toString model ]
                ]
