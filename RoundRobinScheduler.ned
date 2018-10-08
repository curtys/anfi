simple RRScheduler
{
    parameters:
        string queueName = default("l2queue"); // name of the cQueue object, used in the 'q' tag of the display string
        volatile double serviceTime @unit(s);
        @display("i=block/passiveq");
        @signal[packetReceived](type=cPacket);
        @signal[packetEnqueued](type=cPacket);
        @signal[packetDequeued](type=cPacket);
        @signal[packetDropped](type=cPacket);
        @signal[queueingTime](type=simtime_t; unit=s);
        @signal[queueLength](type=long);
        @statistic[packetReceived](title="received packets"; record=count,"sum(packetBytes)","vector(packetBytes)"; interpolationmode=none);
        @statistic[dropPk](title="dropped packets"; source=packetDropped; record=count,"sum(packetBytes)","vector(packetBytes)"; interpolationmode=none);
        @statistic[queueingTime](title="queueing time"; record=histogram,vector; interpolationmode=none);
        @statistic[queueLength](title="queue length"; record=max,timeavg,vector; interpolationmode=sample-hold);
    gates:
        input in[];
        output out;
}
