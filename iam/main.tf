provider "aws" {
    region = "us-east-1"
}

resource "aws_iam_user" "myUser" {
  name = "HA"
}

resource "aws_iam_policy" "customPolicy" {
  name = "GlacierEFSEC2"

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "ec2:AuthorizeSecurityGroupIngress",
                "ec2:ReplaceRouteTableAssociation",
                "ec2:ModifyManagedPrefixList",
                "elasticfilesystem:PutAccountPreferences",
                "ec2:DescribeCoipPools",
                "ec2:CreateIpamPool",
                "ec2:ResetInstanceAttribute",
                "ec2:ResetEbsDefaultKmsKeyId",
                "ec2:DescribeLocalGatewayVirtualInterfaces",
                "ec2:ModifyVpnConnectionOptions",
                "ec2:ReleaseIpamPoolAllocation",
                "ec2:DescribeFpgaImageAttribute",
                "ec2:CreateCoipPoolPermission",
                "ec2:DescribeExportTasks",
                "ec2:DeleteNetworkInsightsAnalysis",
                "ec2:UnassignPrivateIpAddresses",
                "glacier:PurchaseProvisionedCapacity",
                "ec2:DisableImageDeprecation",
                "ec2:DeleteLocalGatewayRouteTable",
                "ec2:DeleteTransitGatewayPeeringAttachment",
                "ec2:ImportKeyPair",
                "ec2:CancelCapacityReservationFleets",
                "ec2:DescribeVolumeAttribute",
                "ec2:ReplaceNetworkAclAssociation",
                "ec2:CreateVpcEndpointServiceConfiguration",
                "ec2:SearchLocalGatewayRoutes",
                "ec2:DescribeTrunkInterfaceAssociations",
                "ec2:ModifyInstanceMaintenanceOptions",
                "ec2:DescribeFleets",
                "ec2:DeleteNatGateway",
                "ec2:CancelCapacityReservation",
                "ec2:EnableTransitGatewayRouteTablePropagation",
                "elasticfilesystem:ClientRootAccess",
                "glacier:ListVaults",
                "ec2:ModifyVpcEndpoint",
                "ec2:ModifyInstanceCapacityReservationAttributes",
                "ec2:CreatePublicIpv4Pool",
                "ec2:DeleteSpotDatafeedSubscription",
                "ec2:DescribeCapacityReservationFleets",
                "ec2:ImportVolume",
                "ec2:ModifyFleet",
                "ec2:DescribeFlowLogs",
                "ec2:DeleteLocalGatewayRouteTableVirtualInterfaceGroupAssociation",
                "ec2:RequestSpotFleet",
                "ec2:DescribeVpcEndpointServices",
                "ec2:DescribeSpotInstanceRequests",
                "ec2:CreateSubnetCidrReservation",
                "ec2:DeleteTransitGatewayMulticastDomain",
                "elasticfilesystem:PutLifecycleConfiguration",
                "ec2:ModifyReservedInstances",
                "ec2:GetIpamPoolAllocations",
                "ec2:ReleaseAddress",
                "ec2:CreateTrafficMirrorTarget",
                "ec2:DescribeHostReservations",
                "ec2:ModifyTrafficMirrorFilterRule",
                "ec2:CreateClientVpnRoute",
                "ec2:CreateLocalGatewayRoute",
                "ec2:SendSpotInstanceInterruptions"
            ],
            "Resource": "*"
        }
    ]
}
  EOF
}

resource "aws_iam_policy_attachment" "bindPolicy" {
  name = "attachment"
  users = [aws_iam_user.myUser.name]
  policy_arn = aws_iam_policy.customPolicy.arn
}