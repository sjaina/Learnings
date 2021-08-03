variable "sample" {
  default="Sample"
}

output "variable"{
  value= var.sample
}

output "var2" {
  value = "${var.sample}"
}