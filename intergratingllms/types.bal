
enum Sentiment {
    POSITIVE,
    NEGATIVE,
    NEUTRAL
}

type AnalyzePayload record {|
    string text;
|};

type SentimentResult record {|
    Sentiment sentiment;
    float confidence;
|};
