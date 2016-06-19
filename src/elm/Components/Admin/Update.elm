module Components.Admin.Update exposing (update)

import Components.Admin.Messages exposing (Msg(..))
import Router exposing (navigationCmd)
import Model exposing (..)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    ShowNews ->
      (model, navigationCmd "/admin/news")
    ShowProducts ->
      (model, navigationCmd "/admin/products")
    NewNews ->
      (model, navigationCmd "/admin/news/new")
    UpdateNews selectedId ->
      let
        url = "/admin/news/" ++ (toString selectedId)
      in
        (model, navigationCmd url)
    NewProduct ->
      (model, navigationCmd "/admin/products/new")
    UpdateProduct selectedId ->
      let
        url = "/admin/products/" ++ (toString selectedId)
      in
        (model, navigationCmd url)
    ShowProduct selectedId ->
      case model.products of
        Nothing ->
          (model , Cmd.none)
        Just products ->
          let
            currentProduct = List.head (List.filter (\item -> item.id == selectedId) products)
            admin = model.admin
            admin' = { admin | currentProduct = currentProduct}
          in
            ({ model | admin = admin' }, Cmd.none)
    SelectedNew selectedId ->
      case model.news of
        Nothing ->
          (model , Cmd.none)
        Just news ->
          let
            currentNews = List.head (List.filter (\item -> item.id == selectedId) news)
            admin = model.admin
            admin' = { admin | currentNews = currentNews}
          in
            ({ model | admin = admin' }, Cmd.none)
