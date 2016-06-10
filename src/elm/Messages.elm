module Messages exposing (..)

import Router
-- Components
import Components.Productos.Messages
import Components.News.Messages

type Msg =
  None
  | Router Router.Msg
  | NewsMsg Components.News.Messages.Msg
  | ProductsMsg Components.Productos.Messages.Msg
