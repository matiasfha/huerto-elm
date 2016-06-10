module Model exposing (..)
import Hop.Types
import Router

import Components.Productos.Models exposing (Product)
import Components.News.Models exposing (News)


type alias Model =
  { routing: Router.Model
  , products : Maybe (List Product)
  , news : Maybe (List News)
}

initialModel : Hop.Types.Location -> Router.Route -> Model
initialModel location route =
  { routing = Router.Model location route
  , products = Just []
  , news = Just []}
