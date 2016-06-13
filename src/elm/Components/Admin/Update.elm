module Components.Admin.Update exposing (..)

import Components.Admin.Messages exposing (Msg(..))
import Model exposing (..)
import Router exposing (navigationCmd)

update: Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    ShowProducts ->
      (model, navigationCmd "/admin/products")
    ShowNews ->
      (model, navigationCmd "/admin/news")
