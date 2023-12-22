output "topic" {
  value       = length(google_pubsub_topic.topic) > 0 ? google_pubsub_topic.topic[0].name : ""
  description = "The name of the Pub/Sub topic"
}

output "topic_labels" {
  value       = length(google_pubsub_topic.topic) > 0 ? google_pubsub_topic.topic[0].labels : {}
  description = "Labels assigned to the Pub/Sub topic"
}

output "id" {
  value       = length(google_pubsub_topic.topic) > 0 ? google_pubsub_topic.topic[0].id : ""
  description = "The ID of the Pub/Sub topic"
}



