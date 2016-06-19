module Update exposing (..)

import Model exposing (..)
import Messages exposing (Msg(..))
import Router
import Commands exposing (..)

-- Components
import Components.Productos.Update as Products
import Components.News.Update as News
import Components.Admin.Update as Admin
import Components.Login.Update as Login

-- UPDATE

update : Msg -> Model -> (Model, Cmd Msg)
update message model =
  case (Debug.log "msg" message) of
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
        ( { model | products =   updated}, Cmd.map ProductsMsg cmd)
    NewsMsg subMsg ->
      let
        ( updated, cmd) =
          News.update subMsg model.news
      in
        ( { model | news = updated}, Cmd.map NewsMsg cmd)
    AdminMsg subMsg ->
      let
        ( updated, cmd) =
          Admin.update subMsg model
      in
        ( updated, Cmd.map AdminMsg cmd)
    LoginMsg subMsg ->
      let
        ( updated, cmd) =
          Login.update subMsg model
      in
        ( updated, Cmd.map LoginMsg cmd)
    LoggedIn data ->
      let
        ( updated, cmd) =
          Login.onLogin data model
      in
        (updated, Cmd.map LoggedIn cmd) --TODO This FAILS
    None ->
      (model, Cmd.none)

-- Router based update
updateFromUrl: Model -> Router.Route -> (Model, Cmd Msg)
updateFromUrl model route =
  case route of
    Router.MainRoute ->
      (model, fetchSome)
    Router.NewsRoute ->
      (model, newsCmdFetchAll)
    Router.ProductsRoute ->
      (model, productsCmdFetchAll)
    Router.Login ->
      (model, Cmd.none)
    Router.Admin ->
      (model, fetchSome)
    Router.AdminRoutes subRoute ->
      case subRoute of
        Router.News ->
          (model, newsCmdFetchAll)
        Router.Products ->
          (model, productsCmdFetchAll)
        Router.NewProduct ->
          (model, Cmd.none)
        Router.NewNews ->
          (model, Cmd.none)
        Router.UpdateProduct selectedId ->
          (model, Cmd.none)
        Router.UpdateNews selectedId ->
          (model, Cmd.none)
    Router.NotFoundRoute ->
      (model, Cmd.none)
