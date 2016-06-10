module Update exposing (update)

import Model exposing (..)
import Messages exposing (Msg(..))
import Router


-- Components
import Components.Productos.Update as Products
import Components.News.Update as News

-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update message model =
  case message of
    Router subMsg ->
      let
        ( updated, cmd ) =
          Router.update subMsg model.routing
      in
        ( { model | routing = updated }, Cmd.map Router cmd )
    ProductsMsg subMsg ->
      let
        ( updated, cmd) =
          Products.update subMsg model.products
      in
        ( { model | products = updated}, Cmd.map ProductsMsg cmd)
    NewsMsg subMsg ->
      let
        ( updated, cmd) =
          News.update subMsg model.news
      in
        ( { model | news = updated}, Cmd.map NewsMsg cmd)
    None ->
      (model, Cmd.none)
