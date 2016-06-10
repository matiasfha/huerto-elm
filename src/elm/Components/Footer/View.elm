module Components.Footer.View exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)


view : Html a
view =
  footer [ class "text-center"] [
    (text "Huerto Ripe Inalaf © 2015 - 2016 ")
  ]
