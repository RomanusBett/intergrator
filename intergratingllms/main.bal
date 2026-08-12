import ballerina/http;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service / on httpDefaultListener {
    resource function post analyze(@http:Payload AnalyzePayload payload) returns SentimentResult|error {
        SentimentResult sentimentResult = check ollamaModelProvider->generate(
            `Classify the sentiment of this customer review and provide a confidence score between 0.0 and 1.0 indicating how confident you are in the classification. 
            Review: ${payload.text}
            `
        );
        return sentimentResult;

    }
}
