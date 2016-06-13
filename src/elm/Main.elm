import Navigation
import Hop.Types

import Router
import Model exposing (..)
import Messages exposing (Msg(..))
import View exposing (view)
import Update exposing (update)
import Commands exposing (..)


-- SUBSCRIPTIONS
subscriptions : a -> Sub b
subscriptions = \_ -> Sub.none

init : ( Router.Route, Hop.Types.Location ) -> ( Model, Cmd Msg )
init ( route, location ) =
  let
    model = initialModel location route
  in
  case route of
    Router.MainRoute ->
      ( model, Cmd.batch [newsCmdSome , productsCmdSome])
    Router.AdminRoute ->
      ( model, Cmd.batch [newsCmdSome, productsCmdSome])
    Router.NewsRoute ->
      ( model, newsCmdAll)
    Router.ProductsRoute ->
      ( model, productsCmdAll)
    _ ->
      ( initialModel location route, Cmd.none)



urlUpdate : ( Router.Route, Hop.Types.Location ) -> Model -> ( Model, Cmd Msg)
urlUpdate (route, location) model =
  let
    newModel = { model | routing = Router.Model location route }
  in
    case route of
      Router.MainRoute ->
        ( newModel, Cmd.batch [newsCmdSome, productsCmdSome])
      Router.AdminRoute ->
        ( newModel, Cmd.batch [newsCmdSome, productsCmdSome])
      Router.NewsRoute ->
        ( newModel, newsCmdAll)
      Router.ProductsRoute ->
        ( newModel, productsCmdAll)
      _ ->
        ( newModel, Cmd.none)


main: Program Never
main =
  Navigation.program Router.urlParser
  { init = init
  , view = view
  , update = update
  , subscriptions = subscriptions
  , urlUpdate = urlUpdate
  }
