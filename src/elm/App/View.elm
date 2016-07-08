module App.View exposing (..)

import Html exposing (..)
import Html.App as Html
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import App.Model exposing (..)
import App.Update exposing (..)
import Pages.Login.View exposing (..)


view : Model -> Html Msg
view model =
    div [ class "ui container main" ]
        [ viewHeader model
        , viewContent model
        , pre
            [ class "ui padded secondary segment" ]
            [ div [] [ text <| "activePage: " ++ toString model.activePage ]
            , div [] [ text <| "pageLogin: " ++ toString model.pageLogin ]
            ]
        ]


viewHeader : Model -> Html Msg
viewHeader model =
    div [ class "ui secondary pointing menu" ]
        [ a
            [ classByPage Login model.activePage
            , onClick <| SetActivePage Login
            ]
            [ text "Login" ]
        , a
            [ classByPage PageNotFound model.activePage
            , onClick <| SetActivePage PageNotFound
            ]
            [ text "404 page" ]
        ]


viewContent : Model -> Html Msg
viewContent model =
    case model.activePage of
        Login ->
            Html.map PageLogin (Pages.Login.View.view model.pageLogin)

        PageNotFound ->
            div [ class "ui container main" ]
                [ h2 [] [ text "Page not found" ]
                ]


{-| Get menu items classes. This function gets the active page and checks if
it is indeed the page used.
-}
classByPage : Page -> Page -> Attribute a
classByPage page activePage =
    classList
        [ ( "item", True )
        , ( "active", page == activePage )
        ]
