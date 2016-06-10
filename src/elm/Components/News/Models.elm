module Components.News.Models exposing (..)

import Json.Decode as Decode exposing ((:=))
import Json.Encode as Encode


type alias News =
  {id : Int
  ,date: String
  ,title: String
  ,content: String
  ,image: String
  }

itemDecoder : Decode.Decoder News
itemDecoder =
  Decode.object5 News
    ("id" := Decode.int)
    ("date" := Decode.string)
    ("title" := Decode.string)
    ("content" := Decode.string)
    ("image" := Decode.string)


itemEncoded : News -> Encode.Value
itemEncoded item =
  let
    list =
      [ ("id", Encode.int item.id)
      , ("date", Encode.string item.date)
      , ("title", Encode.string item.title)
      , ("content", Encode.string item.content)
      , ("image", Encode.string item.image)
      ]
  in
    list
      |> Encode.object
