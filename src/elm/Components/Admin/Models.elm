module Components.Admin.Models exposing (..)

import Components.News.Models exposing (..)
import Components.Productos.Models exposing (..)

type alias Model =
  { currentProduct: Maybe Product
  , currentNews: Maybe News
  }
