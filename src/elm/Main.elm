import Navigation
import Hop.Types

import Router
import Model exposing (..)
import Messages exposing (Msg(..))
import View exposing (view)
import Update exposing (update)

import Components.News.Commands as News
import Components.Productos.Commands as Products

-- SUBSCRIPTIONS
subscriptions : a -> Sub b
subscriptions = \_ -> Sub.none

init : ( Router.Route, Hop.Types.Location ) -> ( Model, Cmd Msg )
init ( route, location ) =
  case route of
    Router.MainRoute ->
      let
        newsCmd = Cmd.map NewsMsg News.fetchSome
        productsCmd = Cmd.map ProductsMsg Products.fetchSome
      in
        ( initialModel location route, Cmd.batch [newsCmd, productsCmd])
    Router.NewsRoute ->
      ( initialModel location route, Cmd.map NewsMsg News.fetchAll)
    Router.ProductsRoute ->
      ( initialModel location route, Cmd.map ProductsMsg Products.fetchAll)
    Router.NotFoundRoute ->
      ( initialModel location route, Cmd.none)

urlUpdate : ( Router.Route, Hop.Types.Location ) -> Model -> ( Model, Cmd Msg)
urlUpdate (route, location) model =
  let
    newsCmd = Cmd.map NewsMsg News.fetchAll
    productsCmd = Cmd.map ProductsMsg Products.fetchAll
  in
    case (Debug.log "route" route) of
      Router.NotFoundRoute ->
        ( { model | routing = Router.Model location route }, Cmd.none)
      Router.MainRoute ->
        ( { model | routing = Router.Model location route }, Cmd.batch [newsCmd, productsCmd])
      Router.NewsRoute ->
        ( { model | routing = Router.Model location route }, newsCmd)
      Router.ProductsRoute ->
        ( { model | routing = Router.Model location route }, productsCmd)


main: Program Never
main =
  Navigation.program Router.urlParser
  { init = init
  , view = view
  , update = update
  , subscriptions = subscriptions
  , urlUpdate = urlUpdate
  }
