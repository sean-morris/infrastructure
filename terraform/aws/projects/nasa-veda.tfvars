region                 = "us-west-2"
cluster_name           = "nasa-veda"
cluster_nodes_location = "us-west-2a"

default_budget_alert = {
  "enabled" : false,
}

enable_aws_ce_grafana_backend_iam = true

user_buckets = {
  "scratch-staging" : {
    "delete_after" : 7,
    "tags" : { "2i2c:hub-name" : "staging" },
  },
  "scratch" : {
    "delete_after" : 7,
    "tags" : { "2i2c:hub-name" : "prod" },
  },
  "scratch-binder" : {
    "delete_after" : 1,
    "tags" : { "2i2c:hub-name" : "binder" },
  },
}


hub_cloud_permissions = {
  "staging" : {
    bucket_admin_access : ["scratch-staging"],
    extra_iam_policy : <<-EOT
      {
        "Version": "2012-10-17",
        "Statement": [
          {
            "Effect": "Allow",
            "Action": [
              "s3:PutObject",
              "s3:GetObject",
              "s3:ListBucketMultipartUploads",
              "s3:AbortMultipartUpload",
              "s3:ListBucketVersions",
              "s3:CreateBucket",
              "s3:ListBucket",
              "s3:DeleteObject",
              "s3:GetBucketLocation",
              "s3:ListMultipartUploadParts",
              "s3:PutObjectTagging",
              "s3:GetObjectTagging"
            ],
            "Resource": [
              "arn:aws:s3:::veda-data-store",
              "arn:aws:s3:::veda-data-store/*",
              "arn:aws:s3:::veda-data-store-staging",
              "arn:aws:s3:::veda-data-store-staging/*",
              "arn:aws:s3:::veda-nex-gddp-cmip6-public",
              "arn:aws:s3:::veda-nex-gddp-cmip6-public/*",
              "arn:aws:s3:::cmip6-staging",
              "arn:aws:s3:::cmip6-staging/*",
              "arn:aws:s3:::lp-prod-protected",
              "arn:aws:s3:::lp-prod-protected/*",
              "arn:aws:s3:::gesdisc-cumulus-prod-protected",
              "arn:aws:s3:::gesdisc-cumulus-prod-protected/*",
              "arn:aws:s3:::nsidc-cumulus-prod-protected",
              "arn:aws:s3:::nsidc-cumulus-prod-protected/*",
              "arn:aws:s3:::ornl-cumulus-prod-protected",
              "arn:aws:s3:::ornl-cumulus-prod-protected/*",
              "arn:aws:s3:::pangeo-forge-veda-output",
              "arn:aws:s3:::pangeo-forge-veda-output/*",
              "arn:aws:s3:::podaac-ops-cumulus-public",
              "arn:aws:s3:::podaac-ops-cumulus-public/*",
              "arn:aws:s3:::podaac-ops-cumulus-protected",
              "arn:aws:s3:::podaac-ops-cumulus-protected/*",
              "arn:aws:s3:::maap-ops-workspace",
              "arn:aws:s3:::maap-ops-workspace/*",
              "arn:aws:s3:::nasa-maap-data-store",
              "arn:aws:s3:::nasa-maap-data-store/*",
              "arn:aws:s3:::sdap-dev-zarr",
              "arn:aws:s3:::sdap-dev-zarr/*",
              "arn:aws:s3:::usgs-landsat",
              "arn:aws:s3:::usgs-landsat/*",
              "arn:aws:s3:::sentinel-cogs",
              "arn:aws:s3:::sentinel-cogs/*",
              "arn:aws:s3:::sport-lis",
              "arn:aws:s3:::sport-lis/*",
              "arn:aws:s3:::nasa-disasters",
              "arn:aws:s3:::nasa-disasters/*",
              "arn:aws:s3:::nasa-eodc-scratch",
              "arn:aws:s3:::nasa-eodc-scratch/*"
            ]
          },
          {
            "Effect": "Allow",
            "Action": "s3:ListAllMyBuckets",
            "Resource": "*"
          }
        ]
      }
    EOT
  },
  "prod" : {
    bucket_admin_access : ["scratch"],
    extra_iam_policy : <<-EOT
      {
        "Version": "2012-10-17",
        "Statement": [
          {
            "Effect": "Allow",
            "Action": [
              "s3:PutObject",
              "s3:GetObject",
              "s3:ListBucketMultipartUploads",
              "s3:AbortMultipartUpload",
              "s3:ListBucketVersions",
              "s3:CreateBucket",
              "s3:ListBucket",
              "s3:DeleteObject",
              "s3:GetBucketLocation",
              "s3:ListMultipartUploadParts"
            ],
            "Resource": [
              "arn:aws:s3:::veda-data-store",
              "arn:aws:s3:::veda-data-store/*",
              "arn:aws:s3:::veda-data-store-staging",
              "arn:aws:s3:::veda-data-store-staging/*",
              "arn:aws:s3:::veda-nex-gddp-cmip6-public",
              "arn:aws:s3:::veda-nex-gddp-cmip6-public/*",
              "arn:aws:s3:::cmip6-staging",
              "arn:aws:s3:::cmip6-staging/*",
              "arn:aws:s3:::lp-prod-protected",
              "arn:aws:s3:::lp-prod-protected/*",
              "arn:aws:s3:::gesdisc-cumulus-prod-protected",
              "arn:aws:s3:::gesdisc-cumulus-prod-protected/*",
              "arn:aws:s3:::nsidc-cumulus-prod-protected",
              "arn:aws:s3:::nsidc-cumulus-prod-protected/*",
              "arn:aws:s3:::ornl-cumulus-prod-protected",
              "arn:aws:s3:::ornl-cumulus-prod-protected/*",
              "arn:aws:s3:::pangeo-forge-veda-output",
              "arn:aws:s3:::pangeo-forge-veda-output/*",
              "arn:aws:s3:::podaac-ops-cumulus-public",
              "arn:aws:s3:::podaac-ops-cumulus-public/*",
              "arn:aws:s3:::podaac-ops-cumulus-protected",
              "arn:aws:s3:::podaac-ops-cumulus-protected/*",
              "arn:aws:s3:::maap-ops-workspace",
              "arn:aws:s3:::maap-ops-workspace/*",
              "arn:aws:s3:::nasa-maap-data-store",
              "arn:aws:s3:::nasa-maap-data-store/*",
              "arn:aws:s3:::sdap-dev-zarr",
              "arn:aws:s3:::sdap-dev-zarr/*",
              "arn:aws:s3:::usgs-landsat",
              "arn:aws:s3:::usgs-landsat/*",
              "arn:aws:s3:::sport-lis",
              "arn:aws:s3:::sport-lis/*",
              "arn:aws:s3:::nasa-disasters",
              "arn:aws:s3:::nasa-disasters/*"
            ]
          },
          {
            "Effect": "Allow",
            "Action": "s3:ListAllMyBuckets",
            "Resource": "*"
          }
        ]
      }
    EOT
  },
  "binder" : {
    bucket_admin_access : ["scratch-binder"],
    extra_iam_policy : <<-EOT
      {
        "Version": "2012-10-17",
        "Statement": [
          {
            "Effect": "Allow",
            "Action": [
              "s3:GetObject",
              "s3:ListBucketVersions",
              "s3:ListBucket",
              "s3:GetBucketLocation"
            ],
            "Resource": [
              "arn:aws:s3:::veda-data-store",
              "arn:aws:s3:::veda-data-store/*",
              "arn:aws:s3:::veda-data-store-staging",
              "arn:aws:s3:::veda-data-store-staging/*",
              "arn:aws:s3:::veda-nex-gddp-cmip6-public",
              "arn:aws:s3:::veda-nex-gddp-cmip6-public/*",
              "arn:aws:s3:::cmip6-staging",
              "arn:aws:s3:::cmip6-staging/*",
              "arn:aws:s3:::lp-prod-protected",
              "arn:aws:s3:::lp-prod-protected/*",
              "arn:aws:s3:::gesdisc-cumulus-prod-protected",
              "arn:aws:s3:::gesdisc-cumulus-prod-protected/*",
              "arn:aws:s3:::nsidc-cumulus-prod-protected",
              "arn:aws:s3:::nsidc-cumulus-prod-protected/*",
              "arn:aws:s3:::ornl-cumulus-prod-protected",
              "arn:aws:s3:::ornl-cumulus-prod-protected/*",
              "arn:aws:s3:::pangeo-forge-veda-output",
              "arn:aws:s3:::pangeo-forge-veda-output/*",
              "arn:aws:s3:::podaac-ops-cumulus-public",
              "arn:aws:s3:::podaac-ops-cumulus-public/*",
              "arn:aws:s3:::podaac-ops-cumulus-protected",
              "arn:aws:s3:::podaac-ops-cumulus-protected/*",
              "arn:aws:s3:::maap-ops-workspace",
              "arn:aws:s3:::maap-ops-workspace/*",
              "arn:aws:s3:::nasa-maap-data-store",
              "arn:aws:s3:::nasa-maap-data-store/*",
              "arn:aws:s3:::sdap-dev-zarr",
              "arn:aws:s3:::sdap-dev-zarr/*",
              "arn:aws:s3:::usgs-landsat",
              "arn:aws:s3:::usgs-landsat/*",
              "arn:aws:s3:::sentinel-cogs",
              "arn:aws:s3:::sentinel-cogs/*",
              "arn:aws:s3:::sport-lis",
              "arn:aws:s3:::sport-lis/*",
              "arn:aws:s3:::nasa-disasters",
              "arn:aws:s3:::nasa-disasters/*"
            ]
          },
          {
            "Effect": "Allow",
            "Action": "s3:ListAllMyBuckets",
            "Resource": "*"
          }
        ]
      }
    EOT
  },
}

ebs_volumes = {
  "staging" = {
    size        = 110
    type        = "gp3"
    name_suffix = "staging"
    tags        = { "2i2c:hub-name" : "staging" }
  },
  "prod" = {
    size        = 2500 # 2.5TB
    type        = "gp3"
    name_suffix = "prod"
    tags        = { "2i2c:hub-name" : "prod" }
  }
}

enable_nfs_backup = true
