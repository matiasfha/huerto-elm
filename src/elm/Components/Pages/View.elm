module Components.Pages.View exposing (homepage, newsPage, productsPage, adminPage)
import Html exposing (..)
import Html.App

import Messages exposing (Msg(..))
import Model exposing (Model)

-- components
import Components.Header.View as Header
import Components.Productos.View as Productos
import Components.About.View as About
import Components.News.View as News
import Components.Footer.View as Footer
import Components.Admin.View as Admin

homepage : Model -> Html Msg
homepage model =
  div [] [
    Header.view
  , Html.App.map ProductsMsg (Productos.view model.products)
  , About.view
  , Html.App.map NewsMsg (News.view  model.news)
  , Footer.view
  ]

newsPage : Model -> Html Msg
newsPage model =
  div [] [
    Header.view
  , Html.App.map NewsMsg (News.fullView  model.news)
  , Footer.view
  ]

productsPage : Model -> Html Msg
productsPage model =
    div [] [
      Header.view
    , Html.App.map ProductsMsg (Productos.fullView model.products)
    , Footer.view
    ]

adminPage : Model -> Html Msg
adminPage model =
  div [] [
    Admin.view model
  ]
