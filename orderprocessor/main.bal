import ballerina/log;
import ballerinax/rabbitmq;

listener rabbitmq:Listener rabbitmqListener = new("localhost", 5672);

service "Orders" on rabbitmqListener {
    remote function onMessage(rabbitmq:AnydataMessage message, rabbitmq:Caller caller) returns error? {
        do{
            log:printInfo("Received order");
        } on fail error e{
            //handle error
            return error("unhandled error", e);
        }
    }
}
