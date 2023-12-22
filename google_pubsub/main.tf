module "pubsub" {
  source  = "../../modules/pubsub"

  topic      = var.topic
  project_id = var.project_id
  push_subscriptions = [
    {
      name                       = "push-message"                                               // required
      ack_deadline_seconds       = 20                                                   // optional
      push_endpoint              = "https://example.com"                                // required
      expiration_policy          = "1209600s"                                           // optional
      dead_letter_topic          = "projects/bisonai-gke-svc/topics/bisonai-gke-svc" // optional
      max_delivery_attempts      = 5                                                    // optional
      maximum_backoff            = "600s"                                               // optional
      minimum_backoff            = "300s"                                               // optional
    }
  ]
  pull_subscriptions = [
    {
      name                         = "pull-message"                                               // required
      ack_deadline_seconds         = 20                                                   // optional
      dead_letter_topic            = "projects/bisonai-gke-svc/topics/bisonai-gke-svc" // optional
      max_delivery_attempts        = 5                                                    // optional
      maximum_backoff              = "600s"                                               // optional
      minimum_backoff              = "300s"                                               // optional
    }
  ]
}