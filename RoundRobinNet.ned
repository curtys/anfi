  //
// This file is part of an OMNeT++/OMNEST simulation example.
//
// Copyright (C) 1992-2015 Andras Varga
//
// This file is distributed WITHOUT ANY WARRANTY. See the file
// `license' for details on this and other legal matters.
//

import inet.common.queue.FifoQueue;

//
// Simple queueing network: generator + RR + sink.
//
network RoundRobinNet
{
    submodules:
        gen0: Source {
            parameters:
                @display("0=0;p=66,50");
        }
        gen1: Source {
            parameters:
                @display("0=0;p=66,150");

        }
        rr: RRScheduler {
            parameters:
                @display("p=257,100");
        }
        sink: Sink {
            parameters:
                @display("p=329,100");
        }
        fifoQueue0: FifoQueue {
            @display("p=191,150");
        }
        fifoQueue1: FifoQueue {
            @display("p=191,50");
        }
    connections:
        rr.out --> sink.in;
        fifoQueue1.out --> rr.in++;
        fifoQueue0.out --> rr.in++;
        gen0.out --> fifoQueue1.in++;
        gen1.out --> fifoQueue0.in++;
}


