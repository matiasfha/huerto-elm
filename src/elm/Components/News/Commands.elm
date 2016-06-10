module Components.News.Commands exposing (..)

import Json.Decode as Decode exposing ((:=))
import Task

import Utils.Rest as Rest
import Components.News.Models exposing (News, itemDecoder, itemEncoded)
import Components.News.Messages exposing (..)


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
  "https://api.backand.com/1/objects/news"

fetchSomeUrl : String
fetchSomeUrl =
  "https://api.backand.com/1/objects/news?pageSize=10&pageNumber=1&sort=[{\"fieldName\":\"id\",\"order\":\"id\"}]"


saveUrl : String
saveUrl =
  "https://api.backand.com/1/objects/news?returnObject=true"



save : News -> Cmd Msg
save item =
  Rest.saveTask item itemEncoded itemDecoder saveUrl
    |> Task.perform SaveFail SaveSuccess

-- DECODERS

collectionDecoder : Decode.Decoder (List News)
collectionDecoder =
  Decode.object1 identity
    ("data":= Decode.list itemDecoder)
