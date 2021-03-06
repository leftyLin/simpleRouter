#!/usr/bin/env python
#-*- coding: utf-8 -*-

import json
import sys
from common_func import request_info

##################
# create_route
##################

def start_create_route(dpid, destination, netmask, nexthop, routeDist):
    operation = "create_route"
    url_path = "/openflow/" + dpid + "/route"
    method = "POST"
    request = '''
{
"route": {
"destination": "%s",
"netmask": "%s",
"nexthop": "%s",
"vrf_routeDist": "%s"
}
}'''%(destination, netmask, nexthop, routeDist)

    route_result = request_info(operation, url_path, method, request)
    print "----------"
    print json.dumps(route_result, sort_keys=False, indent=4)
    print ""



##############
# main
##############

def main(argv):
    dpid = "0000000000000001"
    destination = argv[1]
    netmask = argv[2]
    nexthop = argv[3]
    routeDist = argv[4]
    start_create_route(dpid, destination, netmask, nexthop, routeDist)

if __name__ == "__main__":
    if (len(sys.argv) != 5):
        print "Usage: post_route.sh [destination] [netmask] [nexthop] [routeDist]"
        sys.exit()
    else:
        main(sys.argv)
