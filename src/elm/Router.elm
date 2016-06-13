module Router exposing (..)
import Navigation
import Hop exposing (makeUrl, makeUrlFromLocation, matchUrl, setQuery)
import Hop.Types exposing (Config, Query, Location, PathMatcher, Router)
import Hop.Matchers exposing (..)

-- ROUTES

type AdminSubRoutes
  = AdminNewsRoute
  | AdminProductsRoute


type Route
  = MainRoute
  | NewsRoute
  | ProductsRoute
  | NotFoundRoute
  | AdminRoute
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
  case (Debug.log "msg" msg) of
    NavigateTo path ->
      ( model, navigationCmd path)

-- MATCHERS
adminMatchers : List (PathMatcher AdminSubRoutes)
adminMatchers =
  [ match1 AdminNewsRoute "/news"
  , match1 AdminProductsRoute "/products"
  ]
matchers : List (PathMatcher Route)
matchers =
  [ match1 MainRoute ""
  , match1 NewsRoute "/news"
  , match1 ProductsRoute "/products"
  , match1 AdminRoute "/admin"
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
