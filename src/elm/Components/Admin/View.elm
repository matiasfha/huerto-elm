module Components.Admin.View exposing (view)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import String

import Model exposing (..)
-- import Router
import Components.Admin.Messages exposing (Msg(..))

{-| Transform a String of css class names to a classList argument.
  toClassList "class1 row sidebar" == [ ("class1", True), ("row", True), ("sidebar", True)]
-}
toClassList : String -> List (String, Bool)
toClassList str =
  let
    list = String.split " " str
    len = List.length list
    trues = List.repeat len (True)
  in
    List.map2 (,) list trues

navbar : Html Msg
navbar =
  nav [ classList (toClassList "navbar navbar-inverse navbar-fixed-top") ] [
    div [ class "container-fluid"] [
      div [ class "navbar-header"] [
        a [ class "navbar-brand", href "/" ] [
          text "Huerto Ripe Inalaf"
        ]
      ]
    ]
  ]

container : Model.Model -> Html Msg
container model =
  div [ class "container-fluid"] [
    div [ class "row" ] [
      sidebar
    , mainContent model
    ]
  ]


sidebar : Html Msg
sidebar =
  div [ classList (toClassList "col-sm-3 col-md-2 sidebar") ] [
    ul [ classList (toClassList "nav nav-sidebar") ] [
      li [] [
        a [ onClick ShowProducts] [
          text "Productos"
        ]
      ]
    , li [] [
        a [onClick ShowNews ] [
          text "Noticias"
        ]
      ]
    ]
  ]

baseView : Html Msg
baseView =
  div [ classList (toClassList "col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main") ] [
    h1 [ class "page-header" ] [
     text "Dashboard"
    ]
  , div [ classList (toClassList "row placeholders") ] [

    ]
  , h2 [ class "sub-header"] [
      text "Últimos Productos"
    ]
  , div [ class "table-responsive"] [
      -- table [ classList (toClassList "table table-striped") ] [
      --
      -- ] TODO table for products and for news
    ]
  , h2 [ class "sub-header"] [
      text "Últimas Noticias"
    ]
  , div [ class "table-responsive"] [
      -- table [ classList (toClassList "table table-striped") ] [
      --
      -- ] TODO table for products and for news
    ]
  ]

productsView : Html Msg
productsView =
  div [ classList (toClassList "col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main") ] [
    h1 [ class "page-header" ] [
     text "Productos"
    ]
  , div [ class "table-responsive"] [
      -- table [ classList (toClassList "table table-striped") ] [
      --
      -- ] TODO table for products and for news
    ]
  ]

newsView : Html Msg
newsView =
  div [ classList (toClassList "col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main") ] [
    h1 [ class "page-header" ] [
     text "Productos"
    ]
  , div [ class "table-responsive"] [
      -- table [ classList (toClassList "table table-striped") ] [
      --
      -- ] TODO table for products and for news
    ]
  ]


mainContent : Model.Model -> Html Msg
mainContent model =
  case model.routing.route of
    _ ->
      baseView


view : Model.Model -> Html Msg
view model =
  div [class "admin" ] [
    navbar
  , container model
  ]
