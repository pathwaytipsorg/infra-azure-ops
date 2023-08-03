// Generates a random string of length 5 without special characters, uppercase letters, or numbers.
resource "random_string" "myrandom" {
  length           = 5
  special          = false
  upper = false
  numeric = false
}