#ifndef __AINF_RRSCHEDULER_H
#define __AINF_RRSCHEDULER_H

#include "inet/common/INETDefs.h"
#include "inet/common/queue/SchedulerBase.h"

using namespace inet;

namespace ainf {

/**
 * This module implements a Round Robin Scheduler.
 */
class RRScheduler: public SchedulerBase {
protected:
    int numInputs;    // number of input gates

public:
    RRScheduler() :
            numInputs(0) {
    }

protected:
    virtual ~RRScheduler();
    virtual void initialize() override;
    virtual bool schedulePacket() override;
};

} // namespace inet

#endif // ifndef __AIFN_RRSCHEDULER_H
