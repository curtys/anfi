#include "RRScheduler.h"
#include "inet/common/INETUtils.h"

using namespace inet;

namespace ainf {

Define_Module(RRScheduler);

RRScheduler::~RRScheduler() {
}

void RRScheduler::initialize() {
    SchedulerBase::initialize();

    numInputs = gateSize("in");
    ASSERT(numInputs == (int )inputQueues.size());
}

bool RRScheduler::schedulePacket() {
    bool allQueueIsEmpty = true;
    for (int i = 0; i < numInputs; ++i) {
        if (!inputQueues[i]->isEmpty()) {
            allQueueIsEmpty = false;
            inputQueues[i]->requestPacket();
            return true;
        }
    }
    return false;
}

} // namespace inet

