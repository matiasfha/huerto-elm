module Commands exposing (..)
import Messages exposing (Msg(..))
import Components.News.Commands as News
import Components.Productos.Commands as Products


newsCmdSome : Cmd Msg
newsCmdSome = News.fetchSome |> Cmd.map NewsMsg

newsCmdAll : Cmd Msg
newsCmdAll = News.fetchAll |> Cmd.map NewsMsg

productsCmdSome : Cmd Msg
productsCmdSome = Products.fetchSome |> Cmd.map ProductsMsg

productsCmdAll : Cmd Msg
productsCmdAll = Products.fetchAll |> Cmd.map ProductsMsg
