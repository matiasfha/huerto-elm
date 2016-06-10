module View exposing (view)
import Html exposing (..)

import Model exposing (..)
import Router
import Messages exposing (Msg(..))
-- components
import Components.Pages.View exposing (..)


-- MAIN VIEW
view : Model -> Html Msg
view model =
  case model.routing.route of
    Router.MainRoute ->
      homepage model
    Router.NewsRoute ->
      newsPage model
    Router.ProductsRoute ->
      productsPage model
    Router.NotFoundRoute ->
      homepage model --TODO
