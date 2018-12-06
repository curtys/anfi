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


network QueueNet2
{
    @display("bgb=928.424,773.312;bgl=2");
    types:
        channel ethernetline extends Ethernet1000
        {
            distance = 10m;
            thruputDisplayFormat = "b B U";
        }
        channel point2pointline extends Ethernet1000
        {
            distance = 10km;
            thruputDisplayFormat = "b B U";
            datarate = 10Gbps;
        }
    submodules:
        H1: StandardHost {
            @display("p=359.68,98.911995");
        }
        H2: StandardHost {
            @display("p=273.132,120.268");
        }
        H3: StandardHost {
            @display("p=205.692,164.104");
        }
        H4: StandardHost {
            @display("p=161.856,241.65999");
        }
        H5: StandardHost {
            @display("p=143.872,333.828");
        }
        H6: StandardHost {
            @display("p=143.872,424.87198");
        }
        H7: StandardHost {
            @display("p=161.856,506.92398");
        }
        H8: StandardHost {
            @display("p=205.692,592.34796");
        }
        H9: StandardHost {
            @display("p=273.132,636.18396");
        }
        H10: StandardHost {
            @display("p=359.68,665.40796");
        }
        H11: StandardHost {
            @display("p=609.208,98.911995");
        }
        H12: StandardHost {
            @display("p=681.144,120.268");
        }
        H13: StandardHost {
            @display("p=748.584,164.104");
        }
        H14: StandardHost {
            @display("p=778.932,241.65999");
        }
        H15: StandardHost {
            @display("p=792.42,333.828");
        }
        H16: StandardHost {
            @display("p=792.42,424.87198");
        }
        H17: StandardHost {
            @display("p=778.932,506.92398");
        }
        H18: StandardHost {
            @display("p=748.584,592.34796");
        }
        H19: StandardHost {
            @display("p=681.144,636.18396");
        }
        H20: StandardHost {
            @display("p=609.208,665.40796");
        }
        R0: Router {
            parameters:
                @display("p=359.68,385.53198");
                eth[*].queue.typename = "WrrQueueModel";

        }
        R1: Router {
            parameters:
                @display("p=609.208,385.53198");
                eth[*].queue.typename = "WrrQueueModel";

        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=97.788,34.843998;is=s");
        }
    connections:
        H1.ethg++ <--> ethernetline <--> R0.ethg++;
        H2.ethg++ <--> ethernetline <--> R0.ethg++;
        H3.ethg++ <--> ethernetline <--> R0.ethg++;
        H4.ethg++ <--> ethernetline <--> R0.ethg++;
        H5.ethg++ <--> ethernetline <--> R0.ethg++;
        H6.ethg++ <--> ethernetline <--> R0.ethg++;
        H7.ethg++ <--> ethernetline <--> R0.ethg++;
        H8.ethg++ <--> ethernetline <--> R0.ethg++;
        H9.ethg++ <--> ethernetline <--> R0.ethg++;
        H10.ethg++ <--> ethernetline <--> R0.ethg++;
        H14.ethg++ <--> ethernetline <--> R1.ethg++;
        H18.ethg++ <--> ethernetline <--> R1.ethg++;
        H13.ethg++ <--> ethernetline <--> R1.ethg++;
        H15.ethg++ <--> ethernetline <--> R1.ethg++;
        H11.ethg++ <--> ethernetline <--> R1.ethg++;
        H16.ethg++ <--> ethernetline <--> R1.ethg++;
        H20.ethg++ <--> ethernetline <--> R1.ethg++;
        H12.ethg++ <--> ethernetline <--> R1.ethg++;
        H17.ethg++ <--> ethernetline <--> R1.ethg++;
        H19.ethg++ <--> ethernetline <--> R1.ethg++;
        R0.ethg++ <--> point2pointline <--> R1.ethg++;
}
