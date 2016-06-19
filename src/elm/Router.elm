module Router exposing (..)
import Navigation
import Hop exposing (makeUrl, makeUrlFromLocation, matchUrl, setQuery)
import Hop.Types exposing (Config, Query, Location, PathMatcher, Router)
import Hop.Matchers exposing (..)

-- ROUTES
type AdminSubRoutes
  = News
  | Products
  | NewProduct
  | NewNews
  | UpdateProduct Int
  | UpdateNews Int

type Route
  = MainRoute
  | NewsRoute
  | ProductsRoute
  | NotFoundRoute
  | Login
  | Admin
  | AdminRoutes (AdminSubRoutes)

--- Model
type alias Model =
  { location : Location
  , route : Route
}

type Msg =
  NavigateTo String

navigationCmd : String -> Cmd a
navigationCmd path =
    Navigation.modifyUrl (makeUrl routerConfig path)

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    NavigateTo path ->
      ( model, navigationCmd path)

-- MATCHERS
adminMatchers : List (PathMatcher AdminSubRoutes)
adminMatchers =
  [ match1 News "/news"
  , match1 Products "/products"
  , match1 NewProduct "/products/new" --TODO NEED MORE NESTING
  , match1 NewNews "/products/new"
  , match2 UpdateNews "/news/" int
  , match2 UpdateProduct "/products" int
  ]

matchers : List (PathMatcher Route)
matchers =
  [ match1 MainRoute ""
  , match1 NewsRoute "/news"
  , match1 ProductsRoute "/products"
  , match1 Admin "/admin"
  , match1 Login "/login"
  , nested1 AdminRoutes "/admin" adminMatchers
  ]

-- RouterConfig
routerConfig : Config Route
routerConfig =
  { hash = True
  , basePath = ""
  , matchers = matchers
  , notFound = NotFoundRoute}

-- URL parser
urlParser : Navigation.Parser (Route, Location)
urlParser =
  Navigation.makeParser (.href >> matchUrl routerConfig)
