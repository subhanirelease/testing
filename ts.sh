{
                "CallerReference": "riq1234",
                "Aliases": {
                        "Quantity": 0
                },
                "DefaultRootObject": "index.html",
                "Origins": {
                        "Quantity": 1,
                        "Items": [{
                                "Id": "riqio1234",
                                "DomainName": "riqio1234.s3.amazonaws.com",
                                "OriginPath": "",
                                "CustomHeaders": {
                                        "Quantity": 0
                                },
                                "S3OriginConfig": {
                                        "OriginAccessIdentity": "origin-access-identity/cloudfront/E35S79CBBUG9HJ"
                                }
                        }]
                },
                "OriginGroups": {
                        "Quantity": 0
                },
                "DefaultCacheBehavior": {
                        "TargetOriginId": "riqio1234",
                        "ForwardedValues": {
                                "QueryString": false,
                                "Cookies": {
                                        "Forward": "none"
                                },
                                "Headers": {
                                        "Quantity": 0
                                },
                                "QueryStringCacheKeys": {
                                        "Quantity": 0
                                }
                        },
                        "TrustedSigners": {
                                "Enabled": false,
                                "Quantity": 0
                        },
                        "ViewerProtocolPolicy": "redirect-to-https",
                        "MinTTL": 0,
                        "AllowedMethods": {
                                "Quantity": 2,
                                "Items": [
                                        "HEAD",
                                        "GET"
                                ],
                                "CachedMethods": {
                                        "Quantity": 2,
                                        "Items": [
                                                "HEAD",
                                                "GET"
                                        ]
                                }
                        },
                        "SmoothStreaming": false,
                        "DefaultTTL": 86400,
                        "MaxTTL": 31536000,
                        "Compress": false,
                        "LambdaFunctionAssociations": {
                                "Quantity": 0
                        },
                        "FieldLevelEncryptionId": ""
                },
                "CacheBehaviors": {
                        "Quantity": 2,
                        "Items": [{
                                        "PathPattern": "/admin-ui*",
                                        "TargetOriginId": "riqio1234",
                                        "ForwardedValues": {
                                                "QueryString": false,
                                                "Cookies": {
                                                        "Forward": "none"
                                                },
                                                "Headers": {
                                                        "Quantity": 0
                                                },
                                                "QueryStringCacheKeys": {
                                                        "Quantity": 0
                                                }
                                        },
                                        "TrustedSigners": {
                                                "Enabled": false,
                                                "Quantity": 0
                                        },
                                        "ViewerProtocolPolicy": "redirect-to-https",
                                        "MinTTL": 0,
                                        "AllowedMethods": {
                                                "Quantity": 2,
                                                "Items": [
                                                        "HEAD",
                                                        "GET"
                                                ],
                                                "CachedMethods": {
                                                        "Quantity": 2,
                                                        "Items": [
                                                                "HEAD",
                                                                "GET"
                                                        ]
                                                }
                                        },
                                        "SmoothStreaming": false,
                                        "DefaultTTL": 86400,
                                        "MaxTTL": 31536000,
                                        "Compress": false,
                                        "LambdaFunctionAssociations": {
                                                "Quantity": 0
                                        },
                                        "FieldLevelEncryptionId": ""
                                },
                                {
                                        "PathPattern": "/product-ui*",
                                        "TargetOriginId": "riqio1234",
                                        "ForwardedValues": {
                                                "QueryString": false,
                                                "Cookies": {
                                                        "Forward": "none"
                                                },
                                                "Headers": {
                                                        "Quantity": 0
                                                },
                                                "QueryStringCacheKeys": {
                                                        "Quantity": 0
                                                }
                                        },
                                        "TrustedSigners": {
                                                "Enabled": false,
                                                "Quantity": 0
                                        },
                                        "ViewerProtocolPolicy": "redirect-to-https",
                                        "MinTTL": 0,
                                        "AllowedMethods": {
                                                "Quantity": 2,
                                                "Items": [
                                                        "HEAD",
                                                        "GET"
                                                ],
                                                "CachedMethods": {
                                                        "Quantity": 2,
                                                        "Items": [
                                                                "HEAD",
                                                                "GET"
                                                        ]
                                                }
                                        },
                                        "SmoothStreaming": false,
                                        "DefaultTTL": 86400,
                                        "MaxTTL": 31536000,
                                        "Compress": false,
                                        "LambdaFunctionAssociations": {
                                                "Quantity": 0
                                        },
                                        "FieldLevelEncryptionId": ""
                                }
                        ]
                },
                "CustomErrorResponses": {
                        "Quantity": 2,
                        "Items": [{
                                        "ErrorCode": 400,
                                        "ResponsePagePath": "/index.html",
                                        "ResponseCode": "200",
                                        "ErrorCachingMinTTL": 60
                                },
                                {
                                        "ErrorCode": 403,
                                        "ResponsePagePath": "/index.html",
                                        "ResponseCode": "200",
                                        "ErrorCachingMinTTL": 30
                                }
                        ]
                },
                "Comment": "",
                "Logging": {
                        "Enabled": false,
                        "IncludeCookies": false,
                        "Bucket": "riq-logs.s3.amazonaws.com",
                        "Prefix": "staging/cdn-logs/"
                },

                "PriceClass": "PriceClass_100",
                "Enabled": true,
                "ViewerCertificate": {
                        "CloudFrontDefaultCertificate": true,
                        "MinimumProtocolVersion": "TLSv1",
                        "CertificateSource": "cloudfront"
                },

                "Restrictions": {
                        "GeoRestriction": {
                                "RestrictionType": "none",
                                "Quantity": 0
                        }
                },
                "WebACLId": "",
                "HttpVersion": "http2",
                "IsIPV6Enabled": true
        }
