module Utils.String exposing (..)
import String

excerpt : String -> Int -> String
excerpt str length =
  (String.slice 0 length str) ++ "..."


concat : List String -> String
concat list =
  String.concat list


{-| Transform a String of css class names to a classList argument.
  toClassList "class1 row sidebar" == [ ("class1", True), ("row", True), ("sidebar", True)]
-}
toClassList : String -> List (String, Bool)
toClassList str =
  let
    list = String.split " " str
    len = List.length list
    trues = List.repeat len (True)
  in
    List.map2 (,) list trues
