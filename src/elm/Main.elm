import Navigation
import Hop.Types

import Router
import Model exposing (..)
import Messages exposing (Msg(..))
import View exposing (view)
import Update exposing (update, updateFromUrl)
import Ports exposing (..)


-- SUBSCRIPTIONS
subscriptions : Model -> Sub Msg
subscriptions model =
  loggedin UserData

init : ( Router.Route, Hop.Types.Location ) -> ( Model, Cmd Msg )
init ( route, location ) =
  let
    newModel = initialModel location route
  in
    updateFromUrl newModel route


urlUpdate : ( Router.Route, Hop.Types.Location ) -> Model -> ( Model, Cmd Msg)
urlUpdate (route, location) model =
  let
    newModel = { model | routing = Router.Model location route }
  in
    updateFromUrl newModel route


main: Program Never
main =
  Navigation.program Router.urlParser
  { init = init
  , view = view
  , update = update
  , subscriptions = subscriptions
  , urlUpdate = urlUpdate
  }
