module Components.Admin.NewsView exposing (view)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Markdown

import Utils.String exposing (excerpt, toClassList)
import Utils.Date exposing (formatDate)
import Components.News.Models exposing (News)
import Components.Admin.Messages exposing (Msg(..))
import Model exposing (..)

list : News -> Html Msg
list item =
  li [] [
    a [ onClick (SelectedNew item.id)] [
      h3 [] [
        text item.title
      ]
    , section [] [
        span [ class "description"] [ Markdown.toHtml [] (excerpt item.content 100)]
      ,  span [ class "price"] [
          text (formatDate item.date)
        ]
      ]
    ]
  ]

renderList: Maybe (List News) -> Html Msg
renderList items =
  case items of
    Nothing ->
      div [] []
    Just items ->
      div [ class "col-sm-4 content-list"] [
        ol [class "posts-list"] (List.map list items)
      ]

viewer : Model -> Html Msg
viewer model =
  case model.admin.currentNews of
    Nothing ->
      div [class "col-sm-8"] []
    Just item ->
      section [classList (toClassList "col-sm-8 content-preview")] [
        section [class "post-controls"] [
          a [class "post-edit", onClick (UpdateNews item.id)] [
            i [classList (toClassList "fa fa-pencil-square-o")][]
          ]
        ]
      , section [class "content-preview-content"] [
          div [class "wrapper"] [
            h1 [class "content-preview-title"][
              text item.title
            ]
          , p [] [
              span [ class "price"] [
                text (formatDate item.date)
              ]
            ]
          , br [] []
          , p [] [
              img [ src item.image] []
            ]
          , p [] [Markdown.toHtml [] item.content]
          ]
        ]
      ]


view : Model -> Html Msg
view model =
  div [ classList (toClassList "col-md-11 col-md-offset-1 main") ] [
    div [class "col-sm-12 view-header"] [
      h2 [ ] [
       text "Noticias"
      ]
    , section [class "view-actions"] [
        a [class "new-post", onClick NewNews] [
          text "Nueva Noticia"
        ]
      ]
    ]
    , renderList model.news
    , viewer model
    ]
