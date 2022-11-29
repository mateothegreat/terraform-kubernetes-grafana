resource "kubernetes_deployment" "grafana" {

    metadata {

        name      = var.name
        namespace = var.namespace

        labels = {

            app = var.name

        }

    }

    spec {

        replicas = 1

        selector {

            match_labels = {

                app = var.name

            }

        }

        template {

            metadata {

                name = var.name

                labels = {

                    app = var.name

                }

            }

            spec {

                node_selector = var.node_selector

                container {

                    name  = "grafana"
                    image = var.image

                    resources {

                        requests = {

                            cpu    = var.request_cpu
                            memory = var.request_memory

                        }

                        limits = {

                            cpu    = var.limit_cpu
                            memory = var.request_memory

                        }

                    }

                    port {

                        container_port = 3000
                        protocol       = "TCP"

                    }

                    #                    readiness_probe {
                    #
                    #                        http_get {
                    #
                    #                            path = "/"
                    #                            port = 3000
                    #
                    #                        }
                    #
                    #                        initial_delay_seconds = 15
                    #                        timeout_seconds       = 5
                    #
                    #                    }
                    #
                    #                    liveness_probe {
                    #
                    #                        http_get {
                    #
                    #                            path = "/"
                    #                            port = 3000
                    #
                    #                        }
                    #
                    #                        initial_delay_seconds = 15
                    #                        timeout_seconds       = 5
                    #
                    #                    }

                    volume_mount {

                        name       = "data"
                        mount_path = "/data"

                    }

                    dynamic "env" {

                        for_each = var.environment_variables

                        content {

                            name  = env.key
                            value = env.value

                        }

                    }

                }

                volume {

                    name = "data"

                    empty_dir {}

                }

            }

        }

    }

}
