module Components.News.Update exposing (..)

import Components.News.Messages exposing (Msg(..))
import Components.News.Models exposing (..)
import Router exposing (navigationCmd)


update : Msg -> Maybe (List News) -> (Maybe (List News), Cmd Msg)
update msg model =
  case msg of
    ShowNews ->
      (model, navigationCmd "/news")
    FetchAllDone items ->
      (Just items, Cmd.none)

    FetchAllFail error ->
      (Just [], Cmd.none)

    SaveSuccess updateItem ->
      (model, Cmd.none) --TODO

    SaveFail error ->
      (model, Cmd.none)
