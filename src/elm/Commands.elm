module Commands exposing (..)

import Components.News.Commands as News
import Components.News.Messages as NewsMsg
import Components.Productos.Commands as Products
import Components.Productos.Messages as ProductsMsg
import Messages exposing (Msg(..))

newsCmd : Cmd NewsMsg.Msg -> Cmd Msg
newsCmd cmd = Cmd.map NewsMsg cmd

productsCmd : Cmd ProductsMsg.Msg -> Cmd Msg
productsCmd cmd = Cmd.map ProductsMsg cmd

newsCmdFetchSome : Cmd Msg
newsCmdFetchSome = newsCmd News.fetchSome

productsCmdFetchSome : Cmd Msg
productsCmdFetchSome = productsCmd Products.fetchSome

newsCmdFetchAll : Cmd Msg
newsCmdFetchAll = newsCmd News.fetchAll

productsCmdFetchAll : Cmd Msg
productsCmdFetchAll = productsCmd Products.fetchAll

fetchAll : Cmd Msg
fetchAll = Cmd.batch [newsCmdFetchAll, productsCmdFetchAll]

fetchSome : Cmd Msg
fetchSome = Cmd.batch [newsCmdFetchSome, productsCmdFetchSome]
