terraform {
 backend "gcs" {
   bucket  = ""                              #### Name of the gcp bucket we want to store our terraform state files in. 
   prefix  = ""                              #### Exact path to locate terraform state file
 }
}