//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package anfi;


import inet.linklayer.ethernet.EtherHub;
import inet.node.ethernet.EtherSwitch;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.common.misc.ThruputMeteringChannel;


import inet.common.misc.ThruputMeteringChannel;
import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;


network QueueNetTest
{
    types:
        channel ethernetline extends ThruputMeteringChannel
        {
            delay = 0.1us;
            datarate = 100Mbps;
            thruputDisplayFormat = "b B U";
        }
    submodules:
        H1: StandardHost {
            @display("p=250,100");
        }
        H2: StandardHost {
            @display("p=250,200");
        }
        R0: Router {
            parameters:
                @display("p=400,150");
                eth[*].queue.typename = "WrrQueueModel";

        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=100,100;is=s");
        }
    connections:
        H1.ethg++ <--> ethernetline <--> R0.ethg++;
        H2.ethg++ <--> ethernetline <--> R0.ethg++;
}
