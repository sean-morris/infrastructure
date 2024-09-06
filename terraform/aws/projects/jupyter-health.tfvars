region                 = "us-east-2"
cluster_name           = "jupyter-health"
cluster_nodes_location = "us-east-2a"

tags = {
  "2i2c.org/cluster-name" : "jupyter-health",
  "ManagedBy" : "2i2c",
}

user_buckets = {
  "scratch-staging" : {
    "delete_after" : 7
  },
  "scratch" : {
    "delete_after" : 7
  },
}


hub_cloud_permissions = {
  "staging" : {
    "user-sa" : {
      bucket_admin_access : ["scratch-staging"],
    },
  },
  "prod" : {
    "user-sa" : {
      bucket_admin_access : ["scratch"],
    },
  },
}
