module Components.Admin.Messages exposing (..)

type Msg =
  ShowNews
  | ShowProducts
  | ShowProduct Int
  | SelectedNew Int
  | UpdateProduct Int
  | UpdateNews Int
  | NewProduct
  | NewNews
