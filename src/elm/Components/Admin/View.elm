module Components.Admin.View exposing (view)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

import Model exposing (..)
import Router
import Utils.String exposing (excerpt, toClassList)
import Components.Admin.Messages exposing (Msg(..))
import Components.Admin.ProductsView as ProductsView
import Components.Admin.NewsView as NewsView

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

container : Model.Model -> Maybe Router.AdminSubRoutes -> Html Msg
container model subRoute=
  div [ class "container-fluid"] [
    div [ class "row" ] [
      sidebar
    , mainContent model subRoute
    ]
  ]


sidebar : Html Msg
sidebar =
  div [ classList (toClassList "col-md-1 sidebar") ] [
    ul [ classList (toClassList "nav nav-sidebar") ] [
      li [] [
        a [ onClick ShowProducts ] [
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
  div [ classList (toClassList "col-md-11 col-md-offset-1 main") ] [
    h1 [ class "page-header" ] [
     text "Dashboard"
    ]
  , div [ classList (toClassList "row placeholders") ] [

    ]
  , h2 [ class "sub-header"] [
      text "Últimos Productos"
    ]
  , div [ class "table-responsive"] [

    ]
  , h2 [ class "sub-header"] [
      text "Últimas Noticias"
    ]
  , div [ class "table-responsive"] [

    ]
  ]


newsView : Html Msg
newsView =
  div [ classList (toClassList "col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main") ] [
    h1 [ class "page-header" ] [
     text "Productos"
    ]
  , div [ class "table-responsive"] [

    ]
  ]


mainContent : Model.Model -> Maybe Router.AdminSubRoutes -> Html Msg
mainContent model subRoute =
  case subRoute of
    Nothing ->
      baseView
    Just Router.News ->
      NewsView.view model
    Just Router.Products ->
      ProductsView.view model
    Just Router.NewProduct ->
      ProductsView.editor
    Just Router.NewNews ->
      NewsView.view model --TODO
    Just (Router.UpdateProduct selectedId) ->
      ProductsView.view model --TODO
    Just (Router.UpdateNews selectedId) ->
      NewsView.view model --TODO

view : Model.Model -> Maybe Router.AdminSubRoutes -> Html Msg
view model subRoute =
  div [class "admin" ] [
    navbar
  , container model subRoute
  ]
