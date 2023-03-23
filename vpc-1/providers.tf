/******************************************
	Provider configuration
 *****************************************/
provider "google" {
  # version     = "~> 3.69.0"
  project     = var.project_id
  region      = var.region
  credentials = file("./key.json") #service account json file
}

provider "google-beta" {
  # version     = "=> 3.69.0"
  project     = var.project_id
  region      = var.region
  credentials = file("./key.json")
}