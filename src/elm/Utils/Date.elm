module Utils.Date exposing (..)
import String
import Date

dateFromString: String -> Result String Date.Date
dateFromString str =
  Date.fromString str

formatDate : String -> String
formatDate str =
  let
    date = dateFromString str
  in
    case date of
      Ok value ->
        let
          year = Date.year value |> toString
          month = Date.month value |> toString
          day = Date.day value |> toString
        in
          String.join "/" [day, month, year]
      Err msg -> ""
