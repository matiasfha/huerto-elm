module Components.Footer.View exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)

view : Html a
view =
  footer [ class "text-center"] [
    span [] [
      (text "Huerto Ripe Inalaf © 2015 - 2016 ")
    ]
  , span [] [
      a [ href "/#/login" ] [ text "Admin"]
    ]
  ]
