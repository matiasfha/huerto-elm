module Components.Productos.Models exposing (..)

import Json.Decode as Decode exposing ((:=))
import Json.Encode as Encode


type alias Product =
  {id : Int
  ,image: String
  ,title: String
  ,description: String
  ,price: Int
  ,quality: String
  }

itemDecoder : Decode.Decoder Product
itemDecoder =
  Decode.object6 Product
    ("id" := Decode.int)
    ("image" := Decode.string)
    ("title" := Decode.string)
    ("description" := Decode.string)
    ("price" := Decode.int)
    ("quality" := Decode.string)



itemEncoded : Product -> Encode.Value
itemEncoded item =
  let
    list =
      [ ("id", Encode.int item.id)
      , ("image", Encode.string item.image)
      , ("title", Encode.string item.title)
      , ("description", Encode.string item.description)
      , ("price", Encode.int item.price)
      , ("quality", Encode.string item.quality)
      ]
  in
    list
      |> Encode.object
