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

//
// Copyright (C) 2012 Opensim Ltd.
// Author: Tamas Borbely
//
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU Lesser General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
//
// You should have received a copy of the GNU Lesser General Public License
// along with this program; if not, see <http://www.gnu.org/licenses/>.
//

import inet.common.queue.DropTailQueue;
import inet.common.queue.IOutputQueue;
import inet.common.queue.PriorityScheduler;
import inet.common.queue.WrrScheduler;
import inet.linklayer.common.RandomQosClassifier;
import org.omnetpp.queueing.Classifier;


module WrrQueueModel like IOutputQueue
{
    parameters:
        int frameCapacity = default(100);

        @display("bgb=849.60004,951.84");
    gates:
        input in;
        output out;

    submodules:
        randomQosClassifier: RandomQosClassifier {
            @display("p=65,350");
        }
        priorityClassifier: Classifier {
            @display("p=288,349.92");
        	dispatchField = "priority";    
        }
        af1xQueue: DropTailQueue {
            frameCapacity = frameCapacity;
            @display("p=482.40002,198.72");
        }
        af2xQueue: DropTailQueue {
            frameCapacity = frameCapacity;
            @display("p=482.40002,292.32");
        }
        af3xQueue: DropTailQueue {
            frameCapacity = frameCapacity;
            @display("p=482.40002,396");
        }
        af4xQueue: DropTailQueue {
            frameCapacity = frameCapacity;
            @display("p=482.40002,488.16");
        }
        af5xQueue: DropTailQueue {
            frameCapacity = frameCapacity;
            @display("p=482.40002,588.96");
        }
        af6xQueue: DropTailQueue {
            frameCapacity = frameCapacity;
            @display("p=482.40002,688.32");
        }
        af7xQueue: DropTailQueue {
            frameCapacity = frameCapacity;
            @display("p=482.40002,787.68005");
        }
        af8xQueue: DropTailQueue {
            frameCapacity = frameCapacity;
            @display("p=482.40002,888.48004");
        }
        wrr: WrrScheduler {
            @display("p=753.12006,349.92");
        }
    connections:
        in --> randomQosClassifier.in;
        priorityClassifier.out++ --> af1xQueue.in;
        priorityClassifier.out++ --> af2xQueue.in;
        priorityClassifier.out++ --> af3xQueue.in;
        priorityClassifier.out++ --> af4xQueue.in;

        af1xQueue.out --> wrr.in++;
        af2xQueue.out --> wrr.in++;
        af3xQueue.out --> wrr.in++;
        af4xQueue.out --> wrr.in++;
        wrr.out --> out;
        randomQosClassifier.out --> priorityClassifier.in++;
        priorityClassifier.out++ --> af5xQueue.in;
        af5xQueue.out --> wrr.in++;
        priorityClassifier.out++ --> af6xQueue.in;
        af6xQueue.out --> wrr.in++;
        priorityClassifier.out++ --> af7xQueue.in;
        af7xQueue.out --> wrr.in++;
        priorityClassifier.rest --> af8xQueue.in;
        af8xQueue.out --> wrr.in++;
}

