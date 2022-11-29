resource "kubernetes_service" "grafana" {

    metadata {

        name      = var.name
        namespace = var.namespace

        labels = {

            app = var.name

        }

    }

    spec {

        selector = {

            app = var.name

        }

        port {

            name        = "grafana"
            port        = 3000
            target_port = 3000

        }

    }

}
