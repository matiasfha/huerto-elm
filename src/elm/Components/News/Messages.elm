module Components.News.Messages exposing (..)

import Http exposing (Error)

import Components.News.Models exposing (News)

type Msg =
  ShowNews
  | FetchAllFail Error
  | FetchAllDone (List News)
  | SaveSuccess News
  | SaveFail Error
