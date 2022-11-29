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

                #                init_container {
                #
                #                    name    = "permissions"
                #                    image   = "busybox"
                #                    command = [ "sh", "-c", "chown -R 472:472 /var/lib/grafana" ]
                #
                #                    volume_mount {
                #
                #                        name       = "data"
                #                        mount_path = "/data"
                #
                #                    }
                #
                #                }

                container {

                    name  = "grafana"
                    image = var.image


                    #                    security_context {
                    #
                    #                        run_as_user  = 472
                    #                        run_as_group = 472
                    #
                    #                    }


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

                    readiness_probe {

                        http_get {

                            path = "/"
                            port = 3000

                        }

                        initial_delay_seconds = 15
                        timeout_seconds       = 5

                    }

                    liveness_probe {

                        http_get {

                            path = "/"
                            port = 3000

                        }

                        initial_delay_seconds = 15
                        timeout_seconds       = 5

                    }

                    volume_mount {

                        name       = "data"
                        mount_path = "/data"

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
