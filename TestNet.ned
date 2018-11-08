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

import org.omnetpp.queueing.Source;
import org.omnetpp.queueing.Queue;
import org.omnetpp.queueing.Sink;
import org.omnetpp.queueing.PassiveQueue;
import org.omnetpp.queueing.Delay;
import anfi.Server;


//
// TODO Generated network
//
network TestNet
{
    @display("bgb=455,196");
    submodules:
        source: Source {
            @display("p=50,50");
        }
        sink: Sink {
            @display("p=311,50");
        }
        passiveQueue: PassiveQueue {
            @display("p=142,50");
        }
        server1: Server {
            @display("p=233,50");
        }
    connections:
        source.out --> passiveQueue.in++;
        passiveQueue.out++ --> server1.in++;
        server1.out --> sink.in++;
}
