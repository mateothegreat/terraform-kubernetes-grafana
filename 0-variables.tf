variable "name" {

    type        = string
    description = "Name of the resource group"
    default     = "grafana"

}

variable "namespace" {

    type        = string
    description = "Namespace of the resource group"
    default     = "default"

}

variable "image" {

    type        = string
    description = "Grafana image"
    default     = "grafana/grafana-oss"

}

variable "node_selector" {

    type        = map(string)
    description = "Node selector for the deployment"
    default     = null

}


variable "request_cpu" {

    type        = string
    description = "resource request for cpu"
    default     = "500m"

}

variable "request_memory" {

    type        = string
    description = "resource request for memory"
    default     = "500Mi"

}

variable "limit_cpu" {

    type        = string
    description = "resource limit for cpu"
    default     = "500m"

}

variable "limit_memory" {

    type        = string
    description = "resource limit for memory"
    default     = "500Mi"

}
