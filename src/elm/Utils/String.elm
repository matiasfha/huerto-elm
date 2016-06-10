module Utils.String exposing (..)
import String

excerpt : String -> Int -> String
excerpt str length =
  (String.slice 0 length str) ++ "..."


concat : List String -> String
concat list =
  String.concat list
