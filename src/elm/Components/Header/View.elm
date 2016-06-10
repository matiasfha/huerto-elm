module Components.Header.View exposing (..)
import Html exposing (..)
import Html.Attributes exposing (..)

logo : Html a
logo =
  div [ classList [("logo",True), ("text-center", True)] ][
    h2 [][ text ("Huerto Ripe Inalaf")]
    ,div [ class "lil-line"][]
  ]

navbar : Html a
navbar =
  nav [class "row"] [
    h1 [ class "pull-left"] [
      a [ href "/"][ (text "Huerto Ripe Inalaf")]
    ]
    ,a [ href "/", classList [("pull-right", True),("btn-menu", True)]][
      i [ classList [("fa", True), ("fa-bars", True)] ][]
    ]
  ]

content : Html a
content =
  div [ class "col-sm-12", style [("transform","translate(0px, 100%)"), ("font-size","20px"), ("color","#fff")]][
    p[][
      em[][
        text("Hace tres años ya, decidimos consumir verduras libres de químicos, por lo que iniciamos propia huerta familiar.
            Pronto la producción creció y comenzamos a abastacer a cada día más personas con nuestra misma inquietud...")
      ]
    ]
  ]

view : Html a
view =
  header [] [
    div [ class "bg-overlay"][
      div [ class "container"][
        navbar
      , logo
      , content
      ]
    ]
  ]
