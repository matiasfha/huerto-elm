module Components.Productos.Commands exposing (..)

import Json.Decode as Decode exposing ((:=))
import Task

import Utils.Rest as Rest
import Components.Productos.Models exposing (Product, itemDecoder, itemEncoded)
import Components.Productos.Messages exposing (..)


fetchAll : Cmd Msg
fetchAll =
  Rest.fetchTask fetchAllUrl collectionDecoder
    |> Task.perform FetchAllFail FetchAllDone

fetchSome : Cmd Msg
fetchSome =
  Rest.fetchTask fetchSomeUrl collectionDecoder
    |> Task.perform FetchAllFail FetchAllDone

fetchAllUrl : String
fetchAllUrl =
  "https://api.backand.com/1/objects/products"

fetchSomeUrl : String
fetchSomeUrl =
  "https://api.backand.com/1/objects/products?pageSize=10&pageNumber=1&sort=[{\"fieldName\":\"id\",\"order\":\"id\"}]"

saveUrl : String
saveUrl =
  "https://api.backand.com/1/objects/products?returnObject=true"



save : Product -> Cmd Msg
save item =
  Rest.saveTask item itemEncoded itemDecoder saveUrl
    |> Task.perform SaveFail SaveSuccess

-- DECODERS

collectionDecoder : Decode.Decoder (List Product)
collectionDecoder =
  Decode.object1 identity
    ("data":= Decode.list itemDecoder)
