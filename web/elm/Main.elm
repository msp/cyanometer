module Main exposing (..)

import Html exposing (Html, text)
import Visualization.Shape as Shape exposing (defaultPieConfig, Arc)
import Visualization.Path as Path
import Array exposing (Array)
import Svg exposing (Svg, svg, g, path, text)
import Svg.Attributes exposing (transform, d, style, dy, width, height, textAnchor)
import Constants exposing (..)


indicies =
    [ 22, 19, 21, 20, 21, 23, 21, 20, 20, 19, 20, 26, 20, 16, 24, 21, 19, 21, 20, 21, 23, 21, 20, 20, 19, 20, 26, 20, 16, 24, 21, 19, 21, 20, 21, 23, 21, 20, 20, 19, 20, 26, 20, 16, 24, 21, 19, 21, 20, 21, 23, 21, 20, 20, 19, 20, 26, 20, 16, 24 ]


radius : Float
radius =
    min (screenWidth / 2) screenHeight / 2 - 10


dot : String
dot =
    Path.begin |> Path.moveTo 5 5 |> Path.arc 0 0 5 0 (2 * pi) False |> Path.toAttrString


circular : List Arc -> Svg msg
circular arcs =
    let
        makeSlice index datum =
            path [ d (Shape.arc datum), style ("fill:" ++ (Maybe.withDefault "#000" <| Array.get index Constants.colors) ++ "; stroke: #000;") ] []

        makeDot datum =
            path [ d dot, transform ("translate" ++ toString (Shape.centroid datum)) ] []
    in
        g [ transform ("translate(" ++ toString radius ++ "," ++ toString radius ++ ")") ]
            [ g [] <| List.indexedMap makeSlice arcs
            , g [] <| List.map makeDot arcs
            ]


annular : List Arc -> Svg msg
annular arcs =
    let
        makeSlice index datum =
            path [ d (Shape.arc { datum | innerRadius = radius - 80 }), style ("fill:" ++ (Maybe.withDefault "#ccc" <| Array.get (Maybe.withDefault 1 <| Array.get index (Array.fromList indicies)) Constants.colors) ++ ";") ] []

        makeDot datum =
            path [ d dot, transform ("translate" ++ toString (Shape.centroid { datum | innerRadius = radius - 60 })) ] []
    in
        g [ transform ("translate(" ++ toString (3 * radius + 20) ++ "," ++ toString radius ++ ")") ]
            [ g [] <| List.indexedMap makeSlice arcs
              -- , g [] <| List.map makeDot arcs
            ]


view : List Float -> Svg msg
view model =
    let
        pieData =
            model |> Shape.pie { defaultPieConfig | outerRadius = radius }
    in
        svg [ width (toString screenWidth ++ "px"), height (toString screenHeight ++ "px") ]
            [ annular pieData
            ]


model : List Float
model =
    -- List.map (\n -> toFloat n) (List.repeat 100 1)
    List.map (\n -> 1) (indicies)


main : Svg msg
main =
    view model
