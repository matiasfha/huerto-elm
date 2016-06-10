module Components.Productos.Messages exposing (..)

import Http exposing (Error)

import Components.Productos.Models exposing (Product)

type Msg =
  ShowProducts
  | FetchAllFail Error
  | FetchAllDone (List Product)
  | SaveSuccess Product
  | SaveFail Error
