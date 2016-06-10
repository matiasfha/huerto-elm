module Utils.Rest exposing (..)

import Http
import Json.Decode as Decode
import Json.Encode as Encode
import Task

defaultHeaders : List (String, String)
defaultHeaders =
  [ ( "Content-Type", "application/json"), ("AnonymousToken", "5e9a64d0-034d-42e9-b21c-2d786aa79401")]


fetchTask : String -> Decode.Decoder (List a) -> Task.Task Http.Error (List a)
fetchTask fetchAllUrl collectionDecoder =
  let
    config =
      { verb = "GET"
      , headers = defaultHeaders
      , url = fetchAllUrl
      , body = Http.empty
      }
  in
    Http.send Http.defaultSettings config
      |> Http.fromJson collectionDecoder



saveTask : a -> (a -> Encode.Value) -> Decode.Decoder a -> String -> Task.Task Http.Error a
saveTask item itemEncoded itemDecoder saveUrl=
  let
    body =
      itemEncoded item
        |> Encode.encode 0
        |> Http.string
    config =
      { verb = "POST"
      , headers = defaultHeaders
      , url = saveUrl
      , body = body
      }
  in
    Http.send Http.defaultSettings config
      |> Http.fromJson itemDecoder
