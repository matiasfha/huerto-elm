module Components.Productos.Update exposing (..)

import Components.Productos.Messages exposing (Msg(..))
import Components.Productos.Models exposing (..)
import Router exposing (navigationCmd)


update : Msg -> Maybe (List Product) -> ( Maybe (List Product), Cmd Msg)
update msg model =
  case msg of
    ShowProducts ->
      (model, navigationCmd "/products")
    FetchAllDone items ->
      (Just items, Cmd.none)
    FetchAllFail error ->
      (Just [], Cmd.none)
    SaveSuccess updateItem ->
      (model, Cmd.none) --TODO
    SaveFail error ->
      (model, Cmd.none)
