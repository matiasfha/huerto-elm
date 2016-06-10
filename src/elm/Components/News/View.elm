module Components.News.View exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

import Utils.Date exposing (formatDate)
import Utils.String exposing (excerpt, concat)
import Components.News.Messages exposing (Msg(..))
import Components.News.Models exposing (News)

getContent : String -> Bool -> Html Msg
getContent str trunc =
  if trunc then
    p [] [ text (excerpt str 125) ]
  else
    p [] [ text str ]

card : News -> Bool -> Html Msg
card item trunc =
  div [ class "col-xs-12" ] [
    div [ class "card-news" ] [
      div [ class "col-sm-2" ] [
        div [ class "picture", style [ ("background-image", concat ["url(", item.image, ")"]) ] ] []
      ]
    , div [ class "col-sm-10" ][
        div [ class "content" ][
          p [][ text (formatDate item.date)]
        , h5 [] [ text item.title]
        , getContent item.content trunc
        ]
      ]
    ]
  ]

newsRows : Maybe (List News) -> Bool -> Html Msg
newsRows news trunc =
  case news of
    Just news ->
      div [ class "row"] (List.map2 card news [trunc])
    Nothing ->
      div [class "row"] [ text "Cargando..."]

view : Maybe (List News) -> Html Msg
view news =
  div [ classList [ ("section", True), ("green", True) ] ] [
    div [ class "container" ] [
      h3 [ class "text-center" ] [
        i [ classList [ ("fa", True), ("fa-book", True) ] ] []
        , br [] []
        , (text "Noticias")
      ]
      , newsRows news True

      , div [ classList [ ("row", True), ("text-center", True) ] ] [
        button [ class "btn" , onClick ShowNews] [
          (text "Ver más noticias")
        ]
      ]
    ]
  ]

fullView : Maybe (List News) -> Html Msg
fullView news =
  div [ classList [ ("section", True), ("green", True) ] ] [
    div [ class "container" ] [
      h3 [ class "text-center" ] [
        i [ classList [ ("fa", True), ("fa-book", True) ] ] []
        , br [] []
        , (text "Noticias")
      ]
      , newsRows news False
    ]
  ]
