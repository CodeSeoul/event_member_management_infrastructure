data "http" "github-meta-api" {
  url = "https://api.github.com/meta"

  request_headers = {
    Accept = "application/json"
  }
}