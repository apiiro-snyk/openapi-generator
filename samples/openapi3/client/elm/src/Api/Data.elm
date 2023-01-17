{-
   Elm generator test
   No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

   The version of the OpenAPI document: 1.0.0

   NOTE: This file is auto generated by the openapi-generator.
   https://github.com/openapitools/openapi-generator.git

   DO NOT EDIT THIS FILE MANUALLY.

   For more info on generating Elm code, see https://eriktim.github.io/openapi-elm/
-}


module Api.Data exposing
    ( Absent
    , Array
    , Composed
    , ComposedBase
    , Discriminated(..)
    , DiscriminatedA
    , DiscriminatedB
    , Enum(..), enumVariants
    , Enumeric(..), enumericVariants
    , Maybe_
    , OneOf(..)
    , OneOfA
    , OneOfB
    , Primitive
    , Recursion, RecursionMaybe(..), RecursionList(..), RecursionRef(..)
    , RecursionLoop, RecursionLoopRef(..)
    , UnsafeCharacters
    , encodeAbsent
    , encodeArray
    , encodeComposed
    , encodeComposedBase
    , encodeDiscriminated
    , encodeDiscriminatedA
    , encodeDiscriminatedB
    , encodeEnum
    , encodeEnumeric
    , encodeMaybe
    , encodeOneOf
    , encodeOneOfA
    , encodeOneOfB
    , encodePrimitive
    , encodeRecursion
    , encodeRecursionLoop
    , encodeUnsafeCharacters
    , absentDecoder
    , arrayDecoder
    , composedDecoder
    , composedBaseDecoder
    , discriminatedDecoder
    , discriminatedADecoder
    , discriminatedBDecoder
    , enumDecoder
    , enumericDecoder
    , maybeDecoder
    , oneOfDecoder
    , oneOfADecoder
    , oneOfBDecoder
    , primitiveDecoder
    , recursionDecoder
    , recursionLoopDecoder
    , unsafeCharactersDecoder
    )

import Api
import Dict
import Json.Decode
import Json.Encode


-- MODEL


{-| Model having absent and null values
-}
type alias Absent =
    { default : Maybe String
    , required : String
    , nullable : Maybe String
    , requiredNullable : Maybe String
    }


{-| Model with arrays
-}
type alias Array =
    { array : List (String)
    , arrayOfArray : List (List (String))
    , arrayOfPrimitive : Maybe (List (Primitive))
    , arrayOfEnum : Maybe (List (Enum))
    }


{-| Composed model
-}
type alias Composed =
    { base : Float
    , value : Maybe String
    }


type alias ComposedBase =
    { base : Float
    }


{-| Discriminated model
-}
type Discriminated
    = Discriminated BaseDiscriminated
    | DiscriminatedDiscriminatedA DiscriminatedA
    | DiscriminatedDiscriminatedB DiscriminatedB


type alias BaseDiscriminated =
    { kind : String
    }


type alias DiscriminatedA =
    { baseDiscriminated: BaseDiscriminated
    , a : Maybe String
    }


type alias DiscriminatedB =
    { baseDiscriminated: BaseDiscriminated
    , b : Maybe String
    }


type Enum
    = EnumFoo
    | EnumBar
    | EnumBaz


enumVariants : List Enum
enumVariants =
    [ EnumFoo
    , EnumBar
    , EnumBaz
    ]


type Enumeric
    = Enumeric1
    | Enumeric2
    | Enumeric3


enumericVariants : List Enumeric
enumericVariants =
    [ Enumeric1
    , Enumeric2
    , Enumeric3
    ]


{-| Model using reserved words
-}
type alias Maybe_ =
    { type_ : Maybe String
    , if_ : Maybe Bool
    }


{-| One of two models
-}
type OneOf
    = OneOfOneOfA OneOfA
    | OneOfOneOfB OneOfB



type alias OneOfA =
    { a : Maybe String
    }


type alias OneOfB =
    { b : Maybe String
    }


{-| Model with primitive properties
-}
type alias Primitive =
    { string : Maybe String
    , number : Maybe Float
    , float : Maybe Float
    , double : Maybe Float
    , integer : Maybe Int
    , short : Maybe Int
    , long : Maybe Int
    , boolean : Maybe Bool
    }


type alias Recursion =
    { maybe : RecursionMaybe
    , list : RecursionList
    , ref : RecursionRef
    }


type RecursionMaybe = RecursionMaybe (Maybe Recursion)


unwrapRecursionMaybe : RecursionMaybe -> Maybe Recursion
unwrapRecursionMaybe (RecursionMaybe maybe) = maybe


type RecursionList = RecursionList (Maybe (List (Recursion)))


unwrapRecursionList : RecursionList -> Maybe (List (Recursion))
unwrapRecursionList (RecursionList list) = list


type RecursionRef = RecursionRef (Maybe RecursionLoop)


unwrapRecursionRef : RecursionRef -> Maybe RecursionLoop
unwrapRecursionRef (RecursionRef ref) = ref


type alias RecursionLoop =
    { ref : RecursionLoopRef
    }


type RecursionLoopRef = RecursionLoopRef (Maybe Recursion)


unwrapRecursionLoopRef : RecursionLoopRef -> Maybe Recursion
unwrapRecursionLoopRef (RecursionLoopRef ref) = ref


{-| Model using unsafe characters
-}
type alias UnsafeCharacters =
    { prefix : Maybe String
    , suffix : Maybe String
    , rnd0mTff : Maybe String
    , before : Maybe String
    , after : Maybe String
    , both : Maybe String
    , inTheMiddle : Maybe String
    }


-- ENCODER


encodeAbsent : Absent -> Json.Encode.Value
encodeAbsent =
    encodeObject << encodeAbsentPairs


encodeAbsentWithTag : ( String, String ) -> Absent -> Json.Encode.Value
encodeAbsentWithTag (tagField, tag) model =
    encodeObject (encodeAbsentPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeAbsentPairs : Absent -> List EncodedField
encodeAbsentPairs model =
    let
        pairs =
            [ maybeEncode "default" Json.Encode.string model.default
            , encode "required" Json.Encode.string model.required
            , maybeEncodeNullable "nullable" Json.Encode.string model.nullable
            , encodeNullable "requiredNullable" Json.Encode.string model.requiredNullable
            ]
    in
    pairs


encodeArray : Array -> Json.Encode.Value
encodeArray =
    encodeObject << encodeArrayPairs


encodeArrayWithTag : ( String, String ) -> Array -> Json.Encode.Value
encodeArrayWithTag (tagField, tag) model =
    encodeObject (encodeArrayPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeArrayPairs : Array -> List EncodedField
encodeArrayPairs model =
    let
        pairs =
            [ encode "array" (Json.Encode.list Json.Encode.string) model.array
            , encode "arrayOfArray" (Json.Encode.list (Json.Encode.list Json.Encode.string)) model.arrayOfArray
            , maybeEncode "arrayOfPrimitive" (Json.Encode.list encodePrimitive) model.arrayOfPrimitive
            , maybeEncode "arrayOfEnum" (Json.Encode.list encodeEnum) model.arrayOfEnum
            ]
    in
    pairs


encodeComposed : Composed -> Json.Encode.Value
encodeComposed =
    encodeObject << encodeComposedPairs


encodeComposedWithTag : ( String, String ) -> Composed -> Json.Encode.Value
encodeComposedWithTag (tagField, tag) model =
    encodeObject (encodeComposedPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeComposedPairs : Composed -> List EncodedField
encodeComposedPairs model =
    let
        pairs =
            [ encode "base" Json.Encode.float model.base
            , maybeEncode "value" Json.Encode.string model.value
            ]
    in
    pairs


encodeComposedBase : ComposedBase -> Json.Encode.Value
encodeComposedBase =
    encodeObject << encodeComposedBasePairs


encodeComposedBaseWithTag : ( String, String ) -> ComposedBase -> Json.Encode.Value
encodeComposedBaseWithTag (tagField, tag) model =
    encodeObject (encodeComposedBasePairs model ++ [ encode tagField Json.Encode.string tag ])


encodeComposedBasePairs : ComposedBase -> List EncodedField
encodeComposedBasePairs model =
    let
        pairs =
            [ encode "base" Json.Encode.float model.base
            ]
    in
    pairs


encodeDiscriminated : Discriminated -> Json.Encode.Value
encodeDiscriminated model =
    case model of
        Discriminated subModel ->
            encodeBaseDiscriminated subModel

        DiscriminatedDiscriminatedA subModel ->
            encodeDiscriminatedAWithTag ("kind", "DiscriminatedA") subModel


        DiscriminatedDiscriminatedB subModel ->
            encodeDiscriminatedBWithTag ("kind", "DiscriminatedB") subModel


encodeBaseDiscriminated : BaseDiscriminated -> Json.Encode.Value
encodeBaseDiscriminated =
    encodeObject << encodeBaseDiscriminatedPairs


encodeBaseDiscriminatedWithTag : ( String, String ) -> BaseDiscriminated -> Json.Encode.Value
encodeBaseDiscriminatedWithTag (tagField, tag) model =
    encodeObject (encodeBaseDiscriminatedPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeBaseDiscriminatedPairs : BaseDiscriminated -> List EncodedField
encodeBaseDiscriminatedPairs model =
    let
        pairs =
            [ encode "kind" Json.Encode.string model.kind
            ]
    in
    pairs


encodeDiscriminatedA : DiscriminatedA -> Json.Encode.Value
encodeDiscriminatedA =
    encodeObject << encodeDiscriminatedAPairs


encodeDiscriminatedAWithTag : ( String, String ) -> DiscriminatedA -> Json.Encode.Value
encodeDiscriminatedAWithTag (tagField, tag) model =
    encodeObject (encodeDiscriminatedAPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeDiscriminatedAPairs : DiscriminatedA -> List EncodedField
encodeDiscriminatedAPairs model =
    let
        pairs =
            [ maybeEncode "a" Json.Encode.string model.a
            ]
    in
    encodeBaseDiscriminatedPairs model.baseDiscriminated ++ pairs


encodeDiscriminatedB : DiscriminatedB -> Json.Encode.Value
encodeDiscriminatedB =
    encodeObject << encodeDiscriminatedBPairs


encodeDiscriminatedBWithTag : ( String, String ) -> DiscriminatedB -> Json.Encode.Value
encodeDiscriminatedBWithTag (tagField, tag) model =
    encodeObject (encodeDiscriminatedBPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeDiscriminatedBPairs : DiscriminatedB -> List EncodedField
encodeDiscriminatedBPairs model =
    let
        pairs =
            [ maybeEncode "b" Json.Encode.string model.b
            ]
    in
    encodeBaseDiscriminatedPairs model.baseDiscriminated ++ pairs


stringFromEnum : Enum -> String
stringFromEnum model =
    case model of
        EnumFoo ->
            "foo"

        EnumBar ->
            "bar"

        EnumBaz ->
            "baz"


encodeEnum : Enum -> Json.Encode.Value
encodeEnum =
    Json.Encode.string << stringFromEnum


stringFromEnumeric : Enumeric -> String
stringFromEnumeric =
    String.fromInt << intFromEnumeric


intFromEnumeric : Enumeric -> Int
intFromEnumeric model =
    case model of
        Enumeric1 ->
            1

        Enumeric2 ->
            2

        Enumeric3 ->
            3


encodeEnumeric : Enumeric -> Json.Encode.Value
encodeEnumeric =
    Json.Encode.int << intFromEnumeric


encodeMaybe : Maybe_ -> Json.Encode.Value
encodeMaybe =
    encodeObject << encodeMaybePairs


encodeMaybeWithTag : ( String, String ) -> Maybe_ -> Json.Encode.Value
encodeMaybeWithTag (tagField, tag) model =
    encodeObject (encodeMaybePairs model ++ [ encode tagField Json.Encode.string tag ])


encodeMaybePairs : Maybe_ -> List EncodedField
encodeMaybePairs model =
    let
        pairs =
            [ maybeEncode "type" Json.Encode.string model.type_
            , maybeEncode "if" Json.Encode.bool model.if_
            ]
    in
    pairs


encodeOneOf : OneOf -> Json.Encode.Value
encodeOneOf model =
    case model of
        OneOfOneOfA subModel ->
            encodeOneOfA subModel


        OneOfOneOfB subModel ->
            encodeOneOfB subModel




encodeOneOfA : OneOfA -> Json.Encode.Value
encodeOneOfA =
    encodeObject << encodeOneOfAPairs


encodeOneOfAWithTag : ( String, String ) -> OneOfA -> Json.Encode.Value
encodeOneOfAWithTag (tagField, tag) model =
    encodeObject (encodeOneOfAPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeOneOfAPairs : OneOfA -> List EncodedField
encodeOneOfAPairs model =
    let
        pairs =
            [ maybeEncode "a" Json.Encode.string model.a
            ]
    in
    pairs


encodeOneOfB : OneOfB -> Json.Encode.Value
encodeOneOfB =
    encodeObject << encodeOneOfBPairs


encodeOneOfBWithTag : ( String, String ) -> OneOfB -> Json.Encode.Value
encodeOneOfBWithTag (tagField, tag) model =
    encodeObject (encodeOneOfBPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeOneOfBPairs : OneOfB -> List EncodedField
encodeOneOfBPairs model =
    let
        pairs =
            [ maybeEncode "b" Json.Encode.string model.b
            ]
    in
    pairs


encodePrimitive : Primitive -> Json.Encode.Value
encodePrimitive =
    encodeObject << encodePrimitivePairs


encodePrimitiveWithTag : ( String, String ) -> Primitive -> Json.Encode.Value
encodePrimitiveWithTag (tagField, tag) model =
    encodeObject (encodePrimitivePairs model ++ [ encode tagField Json.Encode.string tag ])


encodePrimitivePairs : Primitive -> List EncodedField
encodePrimitivePairs model =
    let
        pairs =
            [ maybeEncode "string" Json.Encode.string model.string
            , maybeEncode "number" Json.Encode.float model.number
            , maybeEncode "float" Json.Encode.float model.float
            , maybeEncode "double" Json.Encode.float model.double
            , maybeEncode "integer" Json.Encode.int model.integer
            , maybeEncode "short" Json.Encode.int model.short
            , maybeEncode "long" Json.Encode.int model.long
            , maybeEncode "boolean" Json.Encode.bool model.boolean
            ]
    in
    pairs


encodeRecursion : Recursion -> Json.Encode.Value
encodeRecursion =
    encodeObject << encodeRecursionPairs


encodeRecursionWithTag : ( String, String ) -> Recursion -> Json.Encode.Value
encodeRecursionWithTag (tagField, tag) model =
    encodeObject (encodeRecursionPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeRecursionPairs : Recursion -> List EncodedField
encodeRecursionPairs model =
    let
        pairs =
            [ maybeEncode "maybe" encodeRecursion <| unwrapRecursionMaybe model.maybe
            , maybeEncode "list" (Json.Encode.list encodeRecursion) <| unwrapRecursionList model.list
            , maybeEncode "ref" encodeRecursionLoop <| unwrapRecursionRef model.ref
            ]
    in
    pairs


encodeRecursionLoop : RecursionLoop -> Json.Encode.Value
encodeRecursionLoop =
    encodeObject << encodeRecursionLoopPairs


encodeRecursionLoopWithTag : ( String, String ) -> RecursionLoop -> Json.Encode.Value
encodeRecursionLoopWithTag (tagField, tag) model =
    encodeObject (encodeRecursionLoopPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeRecursionLoopPairs : RecursionLoop -> List EncodedField
encodeRecursionLoopPairs model =
    let
        pairs =
            [ maybeEncode "ref" encodeRecursion <| unwrapRecursionLoopRef model.ref
            ]
    in
    pairs


encodeUnsafeCharacters : UnsafeCharacters -> Json.Encode.Value
encodeUnsafeCharacters =
    encodeObject << encodeUnsafeCharactersPairs


encodeUnsafeCharactersWithTag : ( String, String ) -> UnsafeCharacters -> Json.Encode.Value
encodeUnsafeCharactersWithTag (tagField, tag) model =
    encodeObject (encodeUnsafeCharactersPairs model ++ [ encode tagField Json.Encode.string tag ])


encodeUnsafeCharactersPairs : UnsafeCharacters -> List EncodedField
encodeUnsafeCharactersPairs model =
    let
        pairs =
            [ maybeEncode "$prefix" Json.Encode.string model.prefix
            , maybeEncode "suffix$" Json.Encode.string model.suffix
            , maybeEncode "r@nd0m_$t#ff" Json.Encode.string model.rnd0mTff
            , maybeEncode "_before" Json.Encode.string model.before
            , maybeEncode "after_" Json.Encode.string model.after
            , maybeEncode "_both_" Json.Encode.string model.both
            , maybeEncode "in_the_middle" Json.Encode.string model.inTheMiddle
            ]
    in
    pairs


-- DECODER


absentDecoder : Json.Decode.Decoder Absent
absentDecoder =
    Json.Decode.succeed Absent
        |> maybeDecode "default" Json.Decode.string Nothing
        |> decode "required" Json.Decode.string 
        |> maybeDecodeNullable "nullable" Json.Decode.string Nothing
        |> decodeNullable "requiredNullable" Json.Decode.string 


arrayDecoder : Json.Decode.Decoder Array
arrayDecoder =
    Json.Decode.succeed Array
        |> decode "array" (Json.Decode.list Json.Decode.string) 
        |> decode "arrayOfArray" (Json.Decode.list (Json.Decode.list Json.Decode.string)) 
        |> maybeDecode "arrayOfPrimitive" (Json.Decode.list primitiveDecoder) Nothing
        |> maybeDecode "arrayOfEnum" (Json.Decode.list enumDecoder) Nothing


composedDecoder : Json.Decode.Decoder Composed
composedDecoder =
    Json.Decode.succeed Composed
        |> decode "base" Json.Decode.float 
        |> maybeDecode "value" Json.Decode.string Nothing


composedBaseDecoder : Json.Decode.Decoder ComposedBase
composedBaseDecoder =
    Json.Decode.succeed ComposedBase
        |> decode "base" Json.Decode.float 


discriminatedDecoder : Json.Decode.Decoder Discriminated
discriminatedDecoder =
    Json.Decode.field "kind" Json.Decode.string
        |> Json.Decode.andThen discriminatedTagDecoder


discriminatedTagDecoder : String -> Json.Decode.Decoder Discriminated
discriminatedTagDecoder tag =
    case tag of
        "DiscriminatedA" ->
            Json.Decode.map DiscriminatedDiscriminatedA discriminatedADecoder

        "DiscriminatedB" ->
            Json.Decode.map DiscriminatedDiscriminatedB discriminatedBDecoder

        _ ->
            Json.Decode.map Discriminated baseDiscriminatedDecoder


baseDiscriminatedDecoder : Json.Decode.Decoder BaseDiscriminated
baseDiscriminatedDecoder =
    Json.Decode.succeed BaseDiscriminated
        |> decode "kind" Json.Decode.string 


discriminatedADecoder : Json.Decode.Decoder DiscriminatedA
discriminatedADecoder =
    Json.Decode.succeed DiscriminatedA
        |> decodeChain baseDiscriminatedDecoder
        |> maybeDecode "a" Json.Decode.string Nothing


discriminatedBDecoder : Json.Decode.Decoder DiscriminatedB
discriminatedBDecoder =
    Json.Decode.succeed DiscriminatedB
        |> decodeChain baseDiscriminatedDecoder
        |> maybeDecode "b" Json.Decode.string Nothing


enumDecoder : Json.Decode.Decoder Enum
enumDecoder =
    Json.Decode.string
        |> Json.Decode.andThen
            (\value ->
                case value of
                    "foo" ->
                        Json.Decode.succeed EnumFoo

                    "bar" ->
                        Json.Decode.succeed EnumBar

                    "baz" ->
                        Json.Decode.succeed EnumBaz

                    other ->
                        Json.Decode.fail <| "Unknown type: " ++ other
            )


enumericDecoder : Json.Decode.Decoder Enumeric
enumericDecoder =
    Json.Decode.int
        |> Json.Decode.andThen
            (\value ->
                case value of
                    1 ->
                        Json.Decode.succeed Enumeric1

                    2 ->
                        Json.Decode.succeed Enumeric2

                    3 ->
                        Json.Decode.succeed Enumeric3

                    other ->
                        Json.Decode.fail <| "Unknown type: " ++ String.fromInt other
            )


maybeDecoder : Json.Decode.Decoder Maybe_
maybeDecoder =
    Json.Decode.succeed Maybe_
        |> maybeDecode "type" Json.Decode.string Nothing
        |> maybeDecode "if" Json.Decode.bool Nothing


oneOfDecoder : Json.Decode.Decoder OneOf
oneOfDecoder =
    Json.Decode.oneOf
        [ Json.Decode.map OneOfOneOfA oneOfADecoder
        , Json.Decode.map OneOfOneOfB oneOfBDecoder
        ]



oneOfADecoder : Json.Decode.Decoder OneOfA
oneOfADecoder =
    Json.Decode.succeed OneOfA
        |> maybeDecode "a" Json.Decode.string Nothing


oneOfBDecoder : Json.Decode.Decoder OneOfB
oneOfBDecoder =
    Json.Decode.succeed OneOfB
        |> maybeDecode "b" Json.Decode.string Nothing


primitiveDecoder : Json.Decode.Decoder Primitive
primitiveDecoder =
    Json.Decode.succeed Primitive
        |> maybeDecode "string" Json.Decode.string Nothing
        |> maybeDecode "number" Json.Decode.float Nothing
        |> maybeDecode "float" Json.Decode.float Nothing
        |> maybeDecode "double" Json.Decode.float Nothing
        |> maybeDecode "integer" Json.Decode.int Nothing
        |> maybeDecode "short" Json.Decode.int Nothing
        |> maybeDecode "long" Json.Decode.int Nothing
        |> maybeDecode "boolean" Json.Decode.bool Nothing


recursionDecoder : Json.Decode.Decoder Recursion
recursionDecoder =
    Json.Decode.succeed Recursion
        |> maybeDecodeLazy RecursionMaybe "maybe" (Json.Decode.lazy (\_ -> recursionDecoder)) Nothing
        |> maybeDecodeLazy RecursionList "list" (Json.Decode.list (Json.Decode.lazy (\_ -> recursionDecoder))) Nothing
        |> maybeDecodeLazy RecursionRef "ref" (Json.Decode.lazy (\_ -> recursionLoopDecoder)) Nothing


recursionLoopDecoder : Json.Decode.Decoder RecursionLoop
recursionLoopDecoder =
    Json.Decode.succeed RecursionLoop
        |> maybeDecodeLazy RecursionLoopRef "ref" (Json.Decode.lazy (\_ -> recursionDecoder)) Nothing


unsafeCharactersDecoder : Json.Decode.Decoder UnsafeCharacters
unsafeCharactersDecoder =
    Json.Decode.succeed UnsafeCharacters
        |> maybeDecode "$prefix" Json.Decode.string Nothing
        |> maybeDecode "suffix$" Json.Decode.string Nothing
        |> maybeDecode "r@nd0m_$t#ff" Json.Decode.string Nothing
        |> maybeDecode "_before" Json.Decode.string Nothing
        |> maybeDecode "after_" Json.Decode.string Nothing
        |> maybeDecode "_both_" Json.Decode.string Nothing
        |> maybeDecode "in_the_middle" Json.Decode.string Nothing




-- HELPER


type alias EncodedField =
    Maybe ( String, Json.Encode.Value )


encodeObject : List EncodedField -> Json.Encode.Value
encodeObject =
    Json.Encode.object << List.filterMap identity


encode : String -> (a -> Json.Encode.Value) -> a -> EncodedField
encode key encoder value =
    Just ( key, encoder value )


encodeNullable : String -> (a -> Json.Encode.Value) -> Maybe a -> EncodedField
encodeNullable key encoder value =
    Just ( key, Maybe.withDefault Json.Encode.null (Maybe.map encoder value) )


maybeEncode : String -> (a -> Json.Encode.Value) -> Maybe a -> EncodedField
maybeEncode key encoder =
    Maybe.map (Tuple.pair key << encoder)


maybeEncodeNullable : String -> (a -> Json.Encode.Value) -> Maybe a -> EncodedField
maybeEncodeNullable =
    encodeNullable


decode : String -> Json.Decode.Decoder a -> Json.Decode.Decoder (a -> b) -> Json.Decode.Decoder b
decode key decoder =
    decodeChain (Json.Decode.field key decoder)


decodeLazy : (a -> c) -> String -> Json.Decode.Decoder a -> Json.Decode.Decoder (c -> b) -> Json.Decode.Decoder b
decodeLazy f key decoder =
    decodeChainLazy f (Json.Decode.field key decoder)


decodeNullable : String -> Json.Decode.Decoder a -> Json.Decode.Decoder (Maybe a -> b) -> Json.Decode.Decoder b
decodeNullable key decoder =
    decodeChain (maybeField key decoder Nothing)


decodeNullableLazy : (Maybe a -> c) -> String -> Json.Decode.Decoder a -> Json.Decode.Decoder (c -> b) -> Json.Decode.Decoder b
decodeNullableLazy f key decoder =
    decodeChainLazy f (maybeField key decoder Nothing)


maybeDecode : String -> Json.Decode.Decoder a -> Maybe a -> Json.Decode.Decoder (Maybe a -> b) -> Json.Decode.Decoder b
maybeDecode key decoder fallback =
    -- let's be kind to null-values as well
    decodeChain (maybeField key decoder fallback)


maybeDecodeLazy : (Maybe a -> c) -> String -> Json.Decode.Decoder a -> Maybe a -> Json.Decode.Decoder (c -> b) -> Json.Decode.Decoder b
maybeDecodeLazy f key decoder fallback =
    -- let's be kind to null-values as well
    decodeChainLazy f (maybeField key decoder fallback)


maybeDecodeNullable : String -> Json.Decode.Decoder a -> Maybe a -> Json.Decode.Decoder (Maybe a -> b) -> Json.Decode.Decoder b
maybeDecodeNullable key decoder fallback =
    decodeChain (maybeField key decoder fallback)


maybeDecodeNullableLazy : (Maybe a -> c) -> String -> Json.Decode.Decoder a -> Maybe a -> Json.Decode.Decoder (c -> b) -> Json.Decode.Decoder b
maybeDecodeNullableLazy f key decoder fallback =
    decodeChainLazy f (maybeField key decoder fallback)


maybeField : String -> Json.Decode.Decoder a -> Maybe a -> Json.Decode.Decoder (Maybe a)
maybeField key decoder fallback =
    let
        fieldDecoder =
            Json.Decode.field key Json.Decode.value

        valueDecoder =
            Json.Decode.oneOf [ Json.Decode.map Just decoder, Json.Decode.null fallback ]

        decodeObject rawObject =
            case Json.Decode.decodeValue fieldDecoder rawObject of
                Ok rawValue ->
                    case Json.Decode.decodeValue valueDecoder rawValue of
                        Ok value ->
                            Json.Decode.succeed value

                        Err error ->
                            Json.Decode.fail (Json.Decode.errorToString error)

                Err _ ->
                    Json.Decode.succeed fallback
    in
    Json.Decode.value
        |> Json.Decode.andThen decodeObject


decodeChain : Json.Decode.Decoder a -> Json.Decode.Decoder (a -> b) -> Json.Decode.Decoder b
decodeChain =
    Json.Decode.map2 (|>)


decodeChainLazy : (a -> c) -> Json.Decode.Decoder a -> Json.Decode.Decoder (c -> b) -> Json.Decode.Decoder b
decodeChainLazy f =
    decodeChain << Json.Decode.map f